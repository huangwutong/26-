package com.jeecms.core.service.impl;

import java.io.IOException;
import java.util.Date;

import net.paoding.analysis.analyzer.PaodingAnalyzer;

import org.apache.lucene.document.DateTools;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.NumberTools;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriter.MaxFieldLength;
import org.apache.lucene.store.LockObtainFailedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.jeecms.core.service.LuceneSvc;

public class LuceneSvcImpl implements LuceneSvc {
	private static final Logger log = LoggerFactory
			.getLogger(LuceneSvcImpl.class);

	public void addDoc(String indexPath, Long id, String url, String title,
			String summary, String content, Date date, String type, int right) {
		try {
			IndexWriter writer = new IndexWriter(indexPath, paodingAnalyzer,
					MaxFieldLength.LIMITED);
			Document doc = new Document();
			doc.add(new Field("url", url, Field.Store.YES,
					Field.Index.NOT_ANALYZED));
			doc.add(new Field("title", title, Field.Store.YES,
					Field.Index.ANALYZED));
			doc.add(new Field("summary", summary, Field.Store.YES,
					Field.Index.NO));
			doc.add(new Field("content", content, Field.Store.NO,
					Field.Index.ANALYZED));
			doc.add(new Field("modified", DateTools.dateToString(date,
					DateTools.Resolution.MINUTE), Field.Store.YES,
					Field.Index.NOT_ANALYZED));
			doc.add(new Field("type", type, Field.Store.YES,
					Field.Index.NOT_ANALYZED));
			doc.add(new Field("right", NumberTools.longToString(right),
					Field.Store.NO, Field.Index.NOT_ANALYZED));
			doc.add(new Field("uid", uid(type, id), Field.Store.NO,
					Field.Index.NOT_ANALYZED));
			writer.addDocument(doc);
			writer.close();
		} catch (CorruptIndexException e) {
			log.error("创建全文索引失败", e);
		} catch (LockObtainFailedException e) {
			log.error("创建全文索引失败", e);
		} catch (IOException e) {
			log.error("创建全文索引失败", e);
		}
	}

	private String uid(String type, long id) {
		return type + '@' + NumberTools.longToString(id);
	}

	// @Autowired
	public void setPaodingAnalyzer(PaodingAnalyzer paodingAnalyzer) {
		this.paodingAnalyzer = paodingAnalyzer;
	}

	private PaodingAnalyzer paodingAnalyzer;
}
