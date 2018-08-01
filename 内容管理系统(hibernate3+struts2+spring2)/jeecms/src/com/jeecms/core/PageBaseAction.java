package com.jeecms.core;

import net.sf.ehcache.Cache;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

@SuppressWarnings("unchecked")
public abstract class PageBaseAction extends IntegrityAction {
	public static final String INDEX = "index";
	public static final int HOMEPAGE_CACHE = 1;
	public static final int CHANNEL_CACHE = 2;
	public static final String PAGE_CACHE_RESULT = "pageCache";

	private void handlePathParams() {
		len = pathParams.length;
		pathName = pathParams[0];
		pageName = pathParams[len - 1];
		int lineIndex = pageName.indexOf("_");
		if (lineIndex != -1) {
			pageRaw = pageName.substring(0, lineIndex);
		} else {
			pageRaw = pageName;
		}
	}

	@Override
	public String execute() throws Exception {
		handlePathParams();
		pageName = pathParams[len - 1];
		if (len == 1 && pageRaw.equals(INDEX)) {
			// 首页
			return sysIndex();
		} else if (len == 1 && StringUtils.isNumeric(pageRaw)) {
			// 内容
			return content(null, Long.parseLong(pageRaw));
		} else if (len == 1) {
			return alone(pageName);
		} else if (len == 2 && pageRaw.equals(INDEX)) {
			return chnlIndex(pathName);
		} else if (len == 2 && StringUtils.isNumeric(pageRaw)) {
			return content(pathName, Long.parseLong(pageRaw));
		} else {
			return pageNotFound();
		}
	}

	/**
	 * 系统首页
	 */
	protected abstract String sysIndex();

	/**
	 * 栏目页
	 */
	protected abstract String chnlIndex(String chnlName);

	/**
	 * 内容页
	 */
	protected abstract String content(String chnlName, Long id);

	/**
	 * 单页
	 */
	protected abstract String alone(String chnlName);

	/**
	 * 页面找不到
	 * 
	 * @return
	 */
	protected abstract String pageNotFound();

	protected String[] pathParams;
	protected int len = 0;
	protected String pathName;
	protected String pageName;
	protected String pageRaw;

	@Autowired
	@Qualifier("homepage")
	protected Cache homepageCache;
	protected Long ckHomepage;

	@Autowired
	@Qualifier("channel")
	protected Cache channelCache;
	protected String ckChannel;

	protected int cacheType;

	public void setPathParams(String[] pathParams) {
		this.pathParams = pathParams;
	}

	public void setWholeUrl(String wholeUrl) {
		this.wholeUrl = wholeUrl;
	}

	public void setPageLink(String pageLink) {
		this.pageLink = pageLink;
	}

	public void setPageSuffix(String pageSuffix) {
		this.pageSuffix = pageSuffix;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public Long getCkHomepage() {
		return ckHomepage;
	}

	public void setCkHomepage(Long ckHomepage) {
		this.ckHomepage = ckHomepage;
	}

	public String getCkChannel() {
		return ckChannel;
	}

	public void setCkChannel(String ckChannel) {
		this.ckChannel = ckChannel;
	}

	public int getCacheType() {
		return cacheType;
	}

	public void setCacheType(int cacheType) {
		this.cacheType = cacheType;
	}
}
