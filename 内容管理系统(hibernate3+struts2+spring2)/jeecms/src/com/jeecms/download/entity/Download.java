package com.jeecms.download.entity;

import static com.jeecms.core.Constants.SPT;

import com.jeecms.core.util.ContentInterface;
import com.jeecms.download.entity.base.BaseDownload;

public class Download extends BaseDownload implements ContentInterface {
	private static final long serialVersionUID = 1L;
	/**
	 * 下载系统附件相对地址
	 */
	public static final String UPLOAD_PATH = SPT + "download";

	/* [CONSTRUCTOR MARKER BEGIN] */
	public Download () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public Download (java.lang.Long id) {
		super(id);
	}

	/**
	 * Constructor for required fields
	 */
	public Download (
		java.lang.Long id,
		com.jeecms.core.entity.Website website,
		com.jeecms.cms.entity.CmsChannel channel,
		com.jeecms.cms.entity.ContentCtg contentCtg,
		com.jeecms.download.entity.DownType downType,
		com.jeecms.download.entity.DownLicense license,
		com.jeecms.download.entity.DownLanguage language,
		java.lang.Long viewTotal,
		java.lang.Long visitTotal,
		java.lang.Long visitToday,
		java.lang.Long visitWeek,
		java.lang.Long visitMonth,
		java.lang.Long visitQuarter,
		java.lang.Long visitYear,
		java.lang.Integer commentCount,
		java.lang.Boolean hasTitleimg,
		java.lang.Boolean bold,
		java.lang.Boolean draft,
		java.lang.Boolean recommend,
		java.lang.Boolean check,
		java.lang.Boolean reject,
		java.lang.Boolean disabled) {

		super (
			id,
			website,
			channel,
			contentCtg,
			downType,
			license,
			language,
			viewTotal,
			visitTotal,
			visitToday,
			visitWeek,
			visitMonth,
			visitQuarter,
			visitYear,
			commentCount,
			hasTitleimg,
			bold,
			draft,
			recommend,
			check,
			reject,
			disabled);
	}

	/* [CONSTRUCTOR MARKER END] */

	public String desc(int len) {
		// TODO Auto-generated method stub
		return null;
	}

	public String getCtgName() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getCtgUrl() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getDate(int style) {
		// TODO Auto-generated method stub
		return null;
	}

	public String getImgUrl() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getTitCol() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getUrl() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getWebName() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getWebUrl() {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean isTitBold() {
		// TODO Auto-generated method stub
		return false;
	}

	public String stit(int len) {
		// TODO Auto-generated method stub
		return null;
	}

	public String tit(int len) {
		// TODO Auto-generated method stub
		return null;
	}

}