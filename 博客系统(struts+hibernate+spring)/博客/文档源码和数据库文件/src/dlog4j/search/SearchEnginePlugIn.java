/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package dlog4j.search;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.ServletException;

import net.sf.hibernate.Query;
import net.sf.hibernate.Session;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.DateField;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.struts.action.PlugIn;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.config.ModuleConfig;

import dlog4j.ManagerBase;
import dlog4j.formbean.LogForm;
import dlog4j.formbean.ReplyForm;

/**
 * A search engine daemon using lucene implements struts's plugin
 * 日记和评论的索引分开两个目录存放
 * @author Liudong
 */
public class SearchEnginePlugIn implements PlugIn, Runnable{

	/**
	 * analyzer提供了切词的方法。可替换。 建索引和搜索时，应该使用同一个analyzer。
	 */
	private static Analyzer analyzer;
	
    protected static ActionServlet servlet = null;
    
    /* properties from plugin's struts-config.xml */
	protected int activeInterval = 600;
	protected static String logIndexPath = "/WEB-INF/log_index";
	protected static String replyIndexPath = "/WEB-INF/reply_index";
	protected String statusFile = "/WEB-INF/lastActiveTime.sav";

	protected String analyzerClass;
	private Thread daemon;

    /**
     * The webapp started.
     * @see org.apache.struts.action.PlugIn#init(ActionServlet servlet, ModuleConfig config)
     */
    public void init(ActionServlet servlet, ModuleConfig config) throws ServletException{
        SearchEnginePlugIn.servlet = servlet;
        if(analyzerClass==null)
        	analyzerClass = StandardAnalyzer.class.getName();
        try{
        	analyzer = (Analyzer)Class.forName(analyzerClass).newInstance();
        }catch(Exception e){
        	servlet.log("Initialize Analyzer Failed.",e);
        }
        daemon = new Thread(this);
        daemon.setDaemon(true);
        daemon.start();
    }
    /**
     * The webapp is to be stop.
     * @see org.apache.struts.action.PlugIn#destroy()
     */
    public void destroy() {
        stop = true;
        /* wait the daemon to terminal */
        try {
            Thread.sleep(1000);
        }catch(InterruptedException e) {}
    }
    /**
     * 得到日记索引的Writter
     * @return
     * @throws IOException
     */
    protected IndexWriter getLogIndexWriter() throws IOException{
        String logPath = getLogIndexPath();
        File rp = new File(logPath);
        if(!rp.exists())
            rp.mkdirs();
        File segments = new File(logPath + File.separator + "segments");
        boolean bCreate = !segments.exists();
        return new IndexWriter(logPath,analyzer,bCreate);
    }
    /**
     * 得到评论索引的Writter
     * @return
     * @throws IOException
     */
    protected IndexWriter getReplyIndexWriter() throws IOException{
        String replyPath = getReplyIndexPath();
        File rp = new File(replyPath);
        if(!rp.exists())
            rp.mkdirs();
        File segments = new File(replyPath + File.separator + "segments");
        boolean bCreate = !segments.exists();
        return new IndexWriter(replyPath,analyzer,bCreate);
    }
    /**
     * 构建某个时间戳后的所有日记信息的索引
     * @param lastLogTime
     * @return 返回新增日记索引的数目
     * @throws SQLException
     */
    protected int buildLogIndex(IndexWriter writer, LastInfo lastInfo) throws Exception{
        Session ssn = ManagerBase.getSession();
        int logCount = 0;
        try {
            Date begin = new Date(lastInfo.lastLogTime);
            String hql = "FROM " + LogForm.class.getName() + " AS log WHERE log.logTime>? ORDER BY log.logTime ASC";            
            Query query = ssn.createQuery(hql);
            query.setDate(0,new Date(lastInfo.lastLogTime));
            Iterator logs = query.list().iterator();
            while(logs.hasNext()) {
                LogForm log = (LogForm)logs.next();
                if(!log.getLogTime().after(begin) || log.getContent()==null)
                    continue;
        		Document doc = new Document();
        		doc.add(Field.Keyword("logId", Integer.toString(log.getId())));
        		doc.add(new Field("author", log.getOwnerName(),false,true,false));
        		doc.add(new Field("siteId", Integer.toString(log.getSite().getId()),false,true,false));
        		doc.add(new Field("categoryId", Integer.toString(log.getCategoryId()),false,true, false));
        		doc.add(Field.UnStored("title", StringUtils.deleteWhitespace(log.getTitle())));
        		doc.add(Field.UnStored("content", log.getContent()));
        		doc.add(new Field("logDate", DateField.dateToString(log.getLogTime()),false,true,false));
        		writer.addDocument(doc);
        		logCount ++;
        		//保存该日记的时间做为时间戳
        		lastInfo.lastLogTime = log.getLogTime().getTime();
        		
            }
        }finally {
            ManagerBase.closeSession(ssn);
        }
        return logCount;
    }
    /**
     * 构建某个时间戳后的所有评论信息的索引
     * @param lastLogTime
     * @return 返回新增评论索引的数目
     */
    protected int buildReplyIndex(IndexWriter writer, LastInfo lastInfo) throws Exception{
        Session ssn = ManagerBase.getSession();
        int replyCount = 0;
        try {
            Date begin = new Date(lastInfo.lastReplyTime);
            String hql = "FROM " + ReplyForm.class.getName() + " AS r WHERE r.writeTime>? ORDER BY r.writeTime ASC";            
            Query query = ssn.createQuery(hql);
            query.setDate(0,new Date(lastInfo.lastReplyTime));
            Iterator replies = query.list().iterator();
            while(replies.hasNext()) {
                ReplyForm reply = (ReplyForm)replies.next();
                if(!reply.getWriteTime().after(begin))
                    continue;
        		Document doc = new Document();
        		doc.add(Field.Keyword("replyId", Integer.toString(reply.getId())));
        		doc.add(Field.Keyword("logId", Integer.toString(reply.getLogId())));
        		doc.add(new Field("categoryId", Integer.toString(reply.getLog().getCategoryId()),false,true, false));
        		doc.add(new Field("author", reply.getAuthorName(),false,true,false));
        		doc.add(new Field("siteId", Integer.toString(reply.getSite().getId()),false,true,false));
        		doc.add(Field.UnStored("content", reply.getContent()));
        		doc.add(new Field("replyDate", DateField.dateToString(reply.getWriteTime()),false,true,false));
        		writer.addDocument(doc);
        		replyCount++;
        		//保存该日记的时间做为时间戳
        		lastInfo.lastReplyTime = System.currentTimeMillis();
        		
            }
        }finally {
            ManagerBase.closeSession(ssn);
        }
        return replyCount;
    }
    
    private boolean stop = false;
    
    /* 自动创建索引的线程入口
     * @see java.lang.Runnable#run()
     */
    public void run() {
        Log log = LogFactory.getLog(SearchEnginePlugIn.class);
        while(!stop) {
            IndexWriter logWriter = null;
            IndexWriter replyWriter = null;
            try {
                //Check if need to rebuild index.
                LastInfo lastInfo = getLastInfo();
                //更新日记索引
                logWriter = getLogIndexWriter();
                int lc = buildLogIndex(logWriter,lastInfo);
                logWriter.optimize();
                log.info("Build "+lc +" log's index success.");
                //更新评论索引                
                replyWriter = getReplyIndexWriter();
                int rc = buildReplyIndex(replyWriter,lastInfo);
                replyWriter.optimize();
                log.info("Build "+rc +" reply's index success.");
                
                saveLastInfo(lastInfo);
            }catch(Exception e) {
                log.error("SearchEnginePlugIn.AutoIndexBuild",e);
            }catch(Throwable t) {
                log.fatal("SearchEnginePlugIn.AutoIndexBuild",t);
            }finally {
                if(logWriter!=null)
                try {
                    logWriter.close();
                }catch(Exception e) {}
                if(replyWriter!=null)
                    try {
                        replyWriter.close();
                    }catch(Exception e) {}
                //wait for next active.
                try {
                    int i;
                    for(i=0;!stop&&i<2400;i++)
                        Thread.sleep(activeInterval*1000/2400);
                    if(i<2400)
                        break;
                }catch(Exception e) {
                    break;
                }
            }
        }
        log.info("SearchEnginePlugIn terminal.");
    }
    /**
     * 读取配置信息(最近一次更新日记、评论的时间)
     * @return
     * @throws Exception
     */
    private LastInfo getLastInfo() throws Exception{
        File f_status = new File(getStatusFile());
        Properties p = null;
        if(f_status.exists()) {
            InputStream is = null;
            try {
                is = new FileInputStream(f_status);
                p = new Properties();
                p.load(is);
            }finally {
                if(is!=null)
                    is.close();
            }
        }
        return new LastInfo(p);
    }
    /**
     * 保存配置信息(最近一次更新日记、评论的时间)
     * @param props
     * @throws IOException
     */
    private void saveLastInfo(LastInfo props) throws IOException{
        File f_status = new File(getStatusFile());
        OutputStream out = null;
        try {
            out = new FileOutputStream(f_status);
            props.getProperties().store(out,"SearchEngine Data Saved.");
        }finally {
            if(out!=null)
                out.close();
        }
    }
    /**
     * 配置信息类
     * @author Liudong
     */
    private class LastInfo{        
        public final static String REPLY_KEY = "LAST_REPLY_TIME";
        public final static String LOG_KEY = "LAST_LOG_TIME";
        public LastInfo(Properties p) {
            if(p!=null) {
                try {
                    lastReplyTime = Long.parseLong(p.getProperty(REPLY_KEY,"0"));
                }catch(Exception e) {}
                try {
                    lastLogTime = Long.parseLong(p.getProperty(LOG_KEY,"0"));
                }catch(Exception e) {}
            }
        }
        public Properties getProperties() {
            Properties ps = new Properties();
            ps.setProperty(LOG_KEY,String.valueOf(lastLogTime));
            ps.setProperty(REPLY_KEY,String.valueOf(lastReplyTime));
            return ps;
        }
        public long lastReplyTime;
        public long lastLogTime;
    }
    
    /* 以下几个getter/setter方法用于对应PlugIn的配置信息 */
    public int getActiveInterval() {
        return activeInterval;
    }
    public void setActiveInterval(int activeInterval) {
        this.activeInterval = activeInterval;
    }
    /**
     * 得到日记索引目录所在的绝对路径
     * @return
     */
    public static String getLogIndexPath() {
    	if(logIndexPath.toUpperCase().startsWith("/WEB-INF"))
    		return servlet.getServletContext().getRealPath(logIndexPath);
    	return logIndexPath;
    }
    public void setLogIndexPath(String indexPath) {
        logIndexPath = indexPath;
    }
    /**
     * 得到评论索引目录所在的绝对路径
     * @return
     */
    public static String getReplyIndexPath() {
    	if(replyIndexPath.toUpperCase().startsWith("/WEB-INF"))
    		return servlet.getServletContext().getRealPath(replyIndexPath);
    	return replyIndexPath;
    }
    public void setReplyIndexPath(String indexPath) {
        replyIndexPath = indexPath;
    }
    /**
     * 得到保存状态信息的文件所在的绝对路径
     * @return
     */
    public String getStatusFile() {
    	if(statusFile.startsWith("/"))
    		return servlet.getServletContext().getRealPath(statusFile);
    	return statusFile;
    }
    public void setStatusFile(String statusFile) {
        this.statusFile = statusFile;
    }
    public static Analyzer getAnalyzer() {
        return analyzer;
    }
	public String getAnalyzerClass() {
		return analyzerClass;
	}
	public void setAnalyzerClass(String analyzerClass) {
		this.analyzerClass = analyzerClass;
	}
}
