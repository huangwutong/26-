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


import org.apache.commons.lang.StringUtils;
import org.apache.lucene.document.DateField;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.Hits;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Searcher;

import dlog4j.formbean.ReplyForm;

/**
 * 评论信息搜索代理
 * @author Liudong
 */
public class ReplySearchProxy extends SearchProxy {
    
    public ReplySearchProxy() {
        
    }
    /* (non-Javadoc)
     * @see jdlog.search.SearchProxy#searchFor(java.lang.String, int, int)
     */
    public List searchFor(int site,int catid,String word, int from, int count) throws IOException, ParseException{
        List replies = new ArrayList();
        Searcher searcher = getSearcher(getReplyIndexPath());
        if (searcher == null) return replies;

        word = StringUtils.deleteWhitespace(word);
        Query bodyQuery = QueryParser.parse(word, "content", getAnalyzer());

        MultiFilter multiFilter = new MultiFilter(1);
        multiFilter.add(new FieldFilter("siteId",String.valueOf(site)));
        if(catid>=0)
            multiFilter.add(new FieldFilter("categoryId",String.valueOf(catid)));
        
        Hits hits = searcher.search(bodyQuery, multiFilter);

        // Don't return more search results than the maximum number allowed.
        int numResults = hits.length();
        for (int i = 0; i < numResults; i++) {
            if (count > 0 && replies.size() >= count) break;
            if (i < from) continue;
            replies.add(new Integer(((Document) hits.doc(i)).get("replyId")));
        }
        return replies;
    }
    /* (non-Javadoc)
     * @see jdlog.search.SearchProxy#deleteIndex(int[])
     */
    public int deleteIndex(int[] id) throws IOException {
		IndexReader reader = IndexReader.open(getReplyIndexPath());
		if (reader == null)
			return 0;
		int dc = 0;
		try {
			Term logIdTerm;
			for (int i = 0; i < id.length; i++) {
				logIdTerm = new Term("replyId", Integer.toString(id[i]));
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
    /* (non-Javadoc)
     * @see jdlog.search.SearchProxy#updateIndex(java.lang.Object)
     */
    public int updateIndex(Object obj) throws IOException {
        if(obj==null)
            return 0;
        ReplyForm reply = (ReplyForm)obj;
        int dc = deleteIndex(new int[] {reply.getId()});
        addIndex(obj);
        return dc;
    }
    /* (non-Javadoc)
     * @see jdlog.search.SearchProxy#addIndex(java.lang.Object)
     */
    public int addIndex(Object obj) throws IOException {
        if(obj==null)
            return 0;
        ReplyForm reply = (ReplyForm)obj;
		Document doc = new Document();
		doc.add(Field.Keyword("replyId", Integer.toString(reply.getId())));
		doc.add(Field.Keyword("logId", Integer.toString(reply.getLogId())));
		doc.add(new Field("categoryId", Integer.toString(reply.getLog().getCategoryId()),false,true, false));
		doc.add(new Field("author", reply.getAuthorName(),false,true,false));
		doc.add(new Field("siteId", Integer.toString(reply.getSite().getId()),false,true,false));
		doc.add(Field.UnStored("content", reply.getContent()));
		doc.add(new Field("replyDate", DateField.dateToString(reply.getWriteTime()),false,true,false));
		IndexWriter writer = getWriter();
		try {
		    writer.addDocument(doc);
		    writer.optimize();
		}finally {
		    writer.close();
		}
        return 1;
    }
    /* (non-Javadoc)
     * @see jdlog.search.SearchProxy#getWriter()
     */
    public IndexWriter getWriter() throws IOException {
        String replyPath = getReplyIndexPath();
        File rp = new File(replyPath);
        if(!rp.exists())
            rp.mkdirs();
        int wc = 0;
        while(wc<10 && IndexReader.isLocked(replyPath)){
        	try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				return null;
			}
			wc++;
        }
        File segments = new File(replyPath + File.separator + SEGMENTS);
        boolean bCreate = !segments.exists();
        return new IndexWriter(replyPath,getAnalyzer(),bCreate);
    }
}
