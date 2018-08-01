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
 * ��Ϣ�����Ĵ�����,ͨ��������Ի�ȡ���ռ��Լ�������Ϣ������,������ɾ�����ӵȹ���
 * �������ࣺLogSearchProxy;ReplySearchProxy
 * 
 * @author Liudong
 */
public abstract class SearchProxy {

    public final static String SEGMENTS = "segments";
    /**
     * ��ȡ�ռ���������
     * @return
     */
    public static SearchProxy getLogQuery() {
        return new LogSearchProxy();
    }

    /**
     * ��ȡ������������
     * @return
     */
    public static SearchProxy getReplyQuery() {
        return new ReplySearchProxy();
    }

    /**
     * ������Ϣ
     * @param word Ҫ�����Ĺؼ���
     * @param from ������ϵ����
     * @param count ȡ�����(����ֵС����ʱȡȫ����Ϣ)
     * @return
     */
    public abstract List searchFor(int site,int catid,String word, int from, int count) throws IOException, ParseException;

    /**
     * ����ĳ�����������
     * @param obj
     * @return
     * @throws IOException
     */
    public abstract int addIndex(Object obj) throws IOException;
    /**
     * ɾ��ָ����ŵ���Ϣ������
     * @param id
     * @return
     */
    public abstract int deleteIndex(int[] id) throws IOException ;

    /**
     * ����������Ϣ
     * @param obj
     * @return
     */
    public abstract int updateIndex(Object obj) throws IOException;
    /**
     * ��ȡһ��������Writer
     * @return
     */
    public abstract IndexWriter getWriter() throws IOException;
    /**
     * ��ȡһ������������
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
     * ��ȡ�ռ��������ڵ�Ŀ¼
     * @return
     */
    protected String getLogIndexPath() {
        return SearchEnginePlugIn.getLogIndexPath();
    }

    /**
     * ��ȡ�����������ڵ�Ŀ¼
     * @return
     */
    protected String getReplyIndexPath() {
        return SearchEnginePlugIn.getReplyIndexPath();
    }

    /**
     * �õ���ѯ������
     * @return
     */
    protected Analyzer getAnalyzer() {
        return SearchEnginePlugIn.getAnalyzer();
    }

}
