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
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.lucene.document.DateField;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.Hits;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Searcher;

import dlog4j.formbean.LogForm;

/**
 * 日记信息搜索
 * 
 * @author Liudong
 */
public class LogSearchProxy extends SearchProxy {

    public LogSearchProxy() {
    }

    /*
     * (non-Javadoc)
     * @see jdlog.search.SearchProxy#searchFor(java.lang.String, int, int)
     */
    public List searchFor(int site, int catid, String word, int from, int count)
            throws IOException, ParseException {
        List logs = new ArrayList();
        Searcher searcher = getSearcher(getLogIndexPath());
        if (searcher == null) return logs;

        BooleanQuery comboQuery = new BooleanQuery();
        StringTokenizer st = new StringTokenizer(word);
        while(st.hasMoreElements()){
        	String q = st.nextToken();
            Query subjectQuery = QueryParser.parse(q, "title", getAnalyzer());
            comboQuery.add(subjectQuery, false, false);
        	Query bodyQuery = QueryParser.parse(q, "content", getAnalyzer());
        	comboQuery.add(bodyQuery, false, false);
        }
        MultiFilter multiFilter = new MultiFilter(1);
        multiFilter.add(new FieldFilter("siteId",String.valueOf(site)));
        if(catid>=0)
            multiFilter.add(new FieldFilter("categoryId",String.valueOf(catid)));
        
        Hits hits = searcher.search(comboQuery, multiFilter);

        // Don't return more search results than the maximum number allowed.
        int numResults = hits.length();
        for (int i = 0; i < numResults; i++) {
            if (count > 0 && logs.size() >= count) break;
            if (i < from) continue;
            logs.add(new Integer(((Document) hits.doc(i)).get("logId")));
        }
        return logs;
    }
    /**
     * 增加索引
     */
    public int addIndex(Object obj) throws IOException {
        if(obj==null)
            return 0;
        LogForm log = (LogForm)obj;
		Document doc = new Document();
		doc.add(Field.Keyword("logId", Integer.toString(log.getId())));
		doc.add(new Field("author", log.getOwnerName(),false,true,false));
		doc.add(new Field("siteId", Integer.toString(log.getSite().getId()),false,true,false));
		doc.add(new Field("categoryId", Integer.toString(log.getCategoryId()),false,true, false));
		doc.add(Field.UnStored("title", log.getTitle()));
		doc.add(Field.UnStored("content", log.getContent()));
		doc.add(new Field("logDate", DateField.dateToString(log.getLogTime()),false,true,false));
		IndexWriter writer = getWriter();
		try {
		    writer.addDocument(doc);
		    writer.optimize();
		}finally {
		    writer.close();
		}
        return 1;
    }
    /*
     * (non-Javadoc)
     * @see jdlog.search.SearchProxy#deleteIndex(int[])
     */
    public int deleteIndex(int[] id) throws IOException {
		IndexReader reader = IndexReader.open(getLogIndexPath());
		if (reader == null)
			return 0;
		int dc = 0;
		try {
			Term logIdTerm;
			for (int i = 0; i < id.length; i++) {
				logIdTerm = new Term("logId", Integer.toString(id[i]));
				try {
					dc += reader.delete(logIdTerm);
				}catch (Exception e) {}
			}
		} finally {
			try {
				reader.close();
			} catch (Exception e) {}
		}
		return dc;
    }

    /*
     * (non-Javadoc)
     * @see jdlog.search.SearchProxy#updateIndex(java.lang.Object)
     */
    public int updateIndex(Object obj) throws IOException {
        if(obj==null)
            return 0;
        LogForm log = (LogForm)obj;
        int dc = deleteIndex(new int[] {log.getId()});
        addIndex(obj);
        return dc;
    }
    /* (non-Javadoc)
     * @see jdlog.search.SearchProxy#getWriter()
     */
    public IndexWriter getWriter() throws IOException{
        String logPath = getLogIndexPath();
        File rp = new File(logPath);
        if(!rp.exists())
            rp.mkdirs();
        int wc = 0;
        while(wc<10 && IndexReader.isLocked(logPath)){
        	try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				return null;
			}
			wc++;
        }
        File segments = new File(logPath + File.separator + SEGMENTS);
        boolean bCreate = !segments.exists();
        return new IndexWriter(logPath,getAnalyzer(),bCreate);
    }
}
