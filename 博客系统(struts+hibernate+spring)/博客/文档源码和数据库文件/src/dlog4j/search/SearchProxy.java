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

import java.io.IOException;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Searcher;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

/**
 * 信息搜索的代理类,通过该类可以获取对日记以及评论信息的搜索,索引的删除增加等功能
 * 两个子类：LogSearchProxy;ReplySearchProxy
 * 
 * @author Liudong
 */
public abstract class SearchProxy {

    public final static String SEGMENTS = "segments";
    /**
     * 获取日记搜索代理
     * @return
     */
    public static SearchProxy getLogQuery() {
        return new LogSearchProxy();
    }

    /**
     * 获取评论搜索代理
     * @return
     */
    public static SearchProxy getReplyQuery() {
        return new ReplySearchProxy();
    }

    /**
     * 搜索信息
     * @param word 要搜索的关键字
     * @param from 结果集合的起点
     * @param count 取结果数(当该值小于零时取全部信息)
     * @return
     */
    public abstract List searchFor(int site,int catid,String word, int from, int count) throws IOException, ParseException;

    /**
     * 增加某个对象的索引
     * @param obj
     * @return
     * @throws IOException
     */
    public abstract int addIndex(Object obj) throws IOException;
    /**
     * 删除指定编号的信息的索引
     * @param id
     * @return
     */
    public abstract int deleteIndex(int[] id) throws IOException ;

    /**
     * 更新索引信息
     * @param obj
     * @return
     */
    public abstract int updateIndex(Object obj) throws IOException;
    /**
     * 获取一个索引的Writer
     * @return
     */
    public abstract IndexWriter getWriter() throws IOException;
    /**
     * 获取一个搜索的助理
     * @param idxPath
     * @return
     * @throws IOException
     */
    protected Searcher getSearcher(String idxPath) throws IOException {
        Searcher searcher = null;
        //Acquire a lock -- analyzer is a convenient object to do this on.
        synchronized (getAnalyzer()) {
            Directory searchDirectory = FSDirectory.getDirectory(idxPath, false);
            IndexReader reader = IndexReader.open(searchDirectory);
            searcher = new IndexSearcher(reader);
        }
        return searcher;
    }    

    /**
     * 获取日记索引所在的目录
     * @return
     */
    protected String getLogIndexPath() {
        return SearchEnginePlugIn.getLogIndexPath();
    }

    /**
     * 获取评论索引所在的目录
     * @return
     */
    protected String getReplyIndexPath() {
        return SearchEnginePlugIn.getReplyIndexPath();
    }

    /**
     * 得到查询分析器
     * @return
     */
    protected Analyzer getAnalyzer() {
        return SearchEnginePlugIn.getAnalyzer();
    }

}
