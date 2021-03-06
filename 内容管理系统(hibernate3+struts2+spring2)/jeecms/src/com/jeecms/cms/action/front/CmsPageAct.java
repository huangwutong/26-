package com.jeecms.cms.action.front;

import static com.jeecms.cms.Constants.*;
import net.sf.ehcache.Element;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jeecms.article.entity.Article;
import com.jeecms.article.manager.ArticleMng;
import com.jeecms.cms.Constants;
import com.jeecms.cms.entity.CmsChannel;
import com.jeecms.cms.entity.CmsConfig;
import com.jeecms.cms.entity.CmsMember;
import com.jeecms.cms.entity.CmsMemberGroup;
import com.jeecms.cms.manager.CmsChannelMng;
import com.jeecms.cms.manager.CmsConfigMng;
import com.jeecms.cms.manager.CmsMemberMng;
import com.jeecms.core.PageBaseAction;
import com.ponyjava.common.page.Paginable;
import com.ponyjava.common.page.SimplePage;

@SuppressWarnings("unchecked")
@Scope("prototype")
@Controller("cms.cmsPageAct")
public class CmsPageAct extends PageBaseAction {
	private static final Logger log = LoggerFactory.getLogger(CmsPageAct.class);

	@Override
	protected String sysIndex() {
		String result = SUCCESS;
		if (getConfig().getCacheHomepage()) {
			log.debug("首页缓存开启");
			result = PAGE_CACHE_RESULT;
			if (useHomepageCache()) {
				return null;
			}
		}
		sysType = getConfig().getDefaultSystem();
		chnl = cmsChannelMng.getRoot(getWebId(), sysType);
		if (chnl == null) {
			addActionError("站点首页不存在，请在后台添加首页！");
			return showMessage();
		}
		// @ TODO 需要改变统计浏览次数的策略。目前的方法在大量并发下容易出现脏数据，并且频繁更新数据库，性能不佳。
		// chnl.setVisitTotal(chnl.getVisitTotal() + 1);

		tplPath = chnl.chooseTplChannel();
		return result;
	}

	@Override
	protected String chnlIndex(String chnlName) {
		String result = SUCCESS;
		if (getConfig().getCacheChannel()) {
			log.debug("栏目缓存开启");
			result = PAGE_CACHE_RESULT;
			if (useChannelCache(chnlName)) {
				return null;
			}
		}
		chnl = cmsChannelMng.getByPath(getWebId(), chnlName);
		if (chnl == null) {
			return pageNotFound();
		}
		// @ TODO 需要改变统计浏览次数的策略。目前的方法在大量并发下容易出现脏数据，并且频繁更新数据库，性能不佳。
		chnl.setVisitTotal(chnl.getVisitTotal() + 1);

		tplPath = chnl.chooseTplChannel();
		sysType = chnl.getSysType();
		return result;
	}

	@Override
	protected String content(String chnlName, Long id) {
		arti = articleMng.findById(id);
		String err = checkArticle(arti, chnlName);
		if (err != null) {
			return err;
		}
		chnl = arti.getChannel();
		sysType = chnl.getSysType();
		pagination = new SimplePage(pageNo, 1, arti.getPageCount());

		// @ TODO 需要改变统计浏览次数的策略。目前的方法在大量并发下容易出现脏数据，并且频繁更新数据库，性能不佳。
		arti.setVisitTotal(arti.getVisitTotal() + 1);

		tplPath = arti.chooseTpl();
		return SUCCESS;
	}

	@Override
	protected String alone(String chnlName) {
		chnl = cmsChannelMng.getByPath(getWebId(), chnlName);
		if (chnl == null) {
			return pageNotFound();
		}
		sysType = chnl.getSysType();
		tplPath = chnl.chooseTplChannel();
		return SUCCESS;
	}

	@Override
	protected String pageNotFound() {
		return handleResult(PAGE_NOT_FOUND, MEMBER_SYS, getConfig()
				.getSolution(MEMBER_SYS));
	}

	@Override
	protected String getSolution() {
		return getConfig().getSolution(getSysType());
	}

	private String checkArticle(Article entity, String chnlName) {
		if (entity == null || !entity.getChannel().getPath().equals(chnlName)) {
			return pageNotFound();
		}
		// 检查阅读权限
		CmsMemberGroup group = entity.getGroup();
		if (group == null) {
			group = entity.getChannel().getGroupVisit();
		}
		if (group != null) {
			CmsMember cmsMember = getCmsMember();
			if (cmsMember == null) {
				return redirectLogin();
			}
			int artiLevel = group.getLevel();
			CmsMemberGroup memberGroup = cmsMember.getGroup();
			int memberLevel = memberGroup.getLevel();
			if (artiLevel > memberLevel) {
				addActionError("您的会员组级别是“" + memberGroup.getName() + "”，该页面需要“"
						+ group.getName() + "”或以上级别才能访问");
				return showMessage();
			}
		}
		if (entity.getDisabled()) {
			addActionError("您所访问的文章已经被关闭");
			return showMessage();
		}
		return null;
	}

	public CmsChannel getChnl() {
		return chnl;
	}

	public Article getArti() {
		return arti;
	}

	public String getSysType() {
		return sysType;
	}

	public CmsConfig getConfig() {
		return cmsConfigMng.findById(getWebId());
	}

	/**
	 * 获得cms会员对象
	 * 
	 * @return
	 */
	public CmsMember getCmsMember() {
		Long memberId = getMemberId();
		if (memberId == null) {
			return null;
		} else {
			return cmsMemberMng.findById(memberId);
		}
	}

	/**
	 * 获得cms会员ID
	 * 
	 * @return
	 */
	public Long getCmsMemberId() {
		CmsMember cmsMember = getCmsMember();
		if (cmsMember == null) {
			return null;
		} else {
			return cmsMember.getId();
		}
	}

	private String showMessage() {
		return handleResult(SHOW_MESSAGE, Constants.MEMBER_SYS);
	}

	protected String redirectLogin() {
		rootWebUrl = getWeb().getRootWeb().getWebUrl();
		return Constants.CMS_MEMBER_LOGIN;
	}

	private boolean useCache(Element e) {
		if (e != null) {
			String s = (String) e.getValue();
			int i = 0;
			while (i < MAX_WAIT_TIME && StringUtils.isBlank(s)) {
				s = (String) e.getValue();
				try {
					i += SLEEP_FOR_WAIT;
					Thread.sleep(SLEEP_FOR_WAIT);
					log.debug("等待缓存sleep{}ms" + SLEEP_FOR_WAIT);
				} catch (InterruptedException e1) {
					log.warn("sleep interrupted");
				}
			}
			if (i < MAX_WAIT_TIME && !StringUtils.isBlank(s)) {
				renderHtmlGBK(s);
				log.info("缓存命中");
				return true;
			} else {
				log.warn("等待已经超过{}ms，没有等到缓存", i);
			}
		} else {
			// 准备生成缓存
			homepageCache.put(new Element(ckHomepage, ""));
			log.info("准备生成缓存");
		}
		return false;
	}

	private boolean useHomepageCache() {
		ckHomepage = getWebId();
		cacheType = HOMEPAGE_CACHE;
		Element e = homepageCache.get(ckHomepage);
		return useCache(e);
	}

	private boolean useChannelCache(String chnlName) {
		ckChannel = getWebId() + chnlName + getPageNo();
		cacheType = CHANNEL_CACHE;
		Element e = channelCache.get(ckChannel);
		return useCache(e);
	}

	private static final int SLEEP_FOR_WAIT = 500;
	private static final int MAX_WAIT_TIME = 10000;
	@Autowired
	private CmsConfigMng cmsConfigMng;
	@Autowired
	private CmsChannelMng cmsChannelMng;
	@Autowired
	private CmsMemberMng cmsMemberMng;
	@Autowired
	private ArticleMng articleMng;
	private CmsChannel chnl;
	private Article arti;
	private String sysType;
	private Paginable pagination;

	public void setChnl(CmsChannel chnl) {
		this.chnl = chnl;
	}

	public Paginable getPagination() {
		return pagination;
	}

}
