package com.jeecms.cms.action.front;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jeecms.article.entity.Article;
import com.jeecms.article.manager.ArticleMng;
import com.jeecms.cms.CmsMemberAction;
import com.jeecms.cms.entity.CmsChannel;
import com.jeecms.cms.entity.CmsMember;
import com.jeecms.cms.entity.CmsMemberGroup;
import com.jeecms.cms.manager.CmsChannelMng;
import com.jeecms.core.util.UploadRule;
import com.octo.captcha.service.image.ImageCaptchaService;
import com.ponyjava.common.page.Pagination;
import com.ponyjava.common.util.HtmlChecker;
import com.ponyjava.common.util.SelectTreeUtils;

/**
 * 文章投稿模板
 * 
 * @author liufang
 * 
 */
@Scope("prototype")
@Controller("cms.articleIndeAct")
public class ArticleIndeAct extends CmsMemberAction {
	private static final Logger log = LoggerFactory
			.getLogger(ArticleIndeAct.class);

	public String articleMain() {
		String result = checkLoginAndError();
		if (result != null) {
			return result;
		}
		pagination = articleMng.getArticleForMember(getMemberId(), null, null,
				null, null, pageNo, getCookieCount());
		return handleResult("ArticleMain");
	}

	public String articleChecked() {
		String result = checkLoginAndError();
		if (result != null) {
			return result;
		}
		pagination = articleMng.getArticleForMember(getMemberId(), null, null,
				true, null, pageNo, getCookieCount());
		return handleResult("ArticleChecked");
	}

	public String articleUnchecked() {
		String result = checkLoginAndError();
		if (result != null) {
			return result;
		}
		pagination = articleMng.getArticleForMember(getMemberId(), null, false,
				false, false, pageNo, getCookieCount());
		return handleResult("ArticleUnchecked");
	}

	public String articleReject() {
		String result = checkLoginAndError();
		if (result != null) {
			return result;
		}
		pagination = articleMng.getArticleForMember(getMemberId(), null, null,
				null, true, pageNo, getCookieCount());
		return handleResult("ArticleReject");
	}

	public String articleDraft() {
		String result = checkLoginAndError();
		if (result != null) {
			return result;
		}
		pagination = articleMng.getArticleForMember(getMemberId(), null, true,
				null, null, pageNo, getCookieCount());
		return handleResult("ArticleDraft");
	}

	@SuppressWarnings("unchecked")
	public String articleInput() {
		String result = checkLoginAndError();
		if (result != null) {
			return result;
		}
		chnlList = cmsChannelMng.getChnlsForMember(null, getCmsMember()
				.getGroup().getLevel());
		chnlList = SelectTreeUtils.handleTreeChild(chnlList);
		chnlList = SelectTreeUtils.webTree(chnlList);
		addUploadRule();
		return handleResult("ArticleInput");
	}

	public String articleSubmit() {
		String result = validateArticleSubmit();
		if (result != null) {
			return result;
		}
		bean = articleMng.memberSave(bean, getCmsMember(), uploadRule);
		removeUploadRule();
		log.info("会员投稿成功：{}", bean.getTitle());
		addActionMessage("投稿成功");
		return showSuccess();
	}

	private String validateArticleSubmit() {
		String result = checkLoginAndError();
		if (result != null) {
			return result;
		}
		if (!imageCaptchaService.validateResponseForID(contextPvd
				.getSessionId(false), checkCode)) {
			addActionError("验证码错误");
			return showError();
		}
		// 验证恶意代码
		if (!HtmlChecker.check(bean.getContent())) {
			addActionError("内容不能包含恶意代码");
			return showError();
		}
		// 验证上传规则
		if (vldUploadRule()) {
			return showError();
		}
		// 验证栏目权限
		if (vldChannel(bean.getChannel().getId(), bean)) {
			return showError();
		}
		return null;
	}

	private boolean vldChannel(Long chnlId, Article bean) {
		CmsChannel c = cmsChannelMng.findById(chnlId);
		if (c == null) {
			addActionError("该栏目不存在：" + chnlId);
			return true;
		}
		if (!c.getHasChild()) {
			addActionError("该栏目不允许有内容：" + c.getName());
			return true;
		}
		if (!c.isTreeLeaf() || c.getParent() == null) {
			addActionError("只有末级栏目才能添加内容：" + c.getName());
			return true;
		}
		int level = getCmsMember().getGroup().getLevel();
		CmsMemberGroup group = c.getGroupContribute();
		if (group == null || group.getLevel() > level) {
			addActionError("您没有该栏目的权限：" + chnlId);
			return true;
		}
		if (bean != null) {
			bean.setChannel(c);
			bean.setWebsite(c.getWebsite());
		}
		return false;
	}

	private boolean vldUploadRule() {
		// 上传规则
		uploadRule = (UploadRule) contextPvd.getSessionAttr(UploadRule.KEY
				+ uploadRuleId);
		if (uploadRule == null) {
			addActionError("没有找到上传规则，不允许提交");
			return true;
		}
		return false;
	}

	private void addUploadRule() {
		uploadRule = (UploadRule) contextPvd.getSessionAttr(UploadRule.KEY
				+ CmsMember.UPLOAD_KEY);
		if (uploadRule == null) {
			uploadRule = new UploadRule(getWeb().getUploadRoot().toString(),
					Article.UPLOAD_PATH, true);
			uploadRule.setAllowFileBrowsing(false);
			// 允许上传大小
			uploadRule.setAllowSize(getCmsMember().getGroup().getUploadSize());
			// 已经上传大小
			uploadRule.setUploadSize(getCmsMember().getUploadToday());
		}
		uploadRuleId = CmsMember.UPLOAD_KEY;
		contextPvd.setSessionAttr(UploadRule.KEY + uploadRuleId, uploadRule);
	}

	private void removeUploadRule() {
		// 删除未被使用的图片
		uploadRule.clearUploadFile();
	}

	@Autowired
	private ImageCaptchaService imageCaptchaService;
	private String checkCode;
	@Autowired
	private ArticleMng articleMng;
	@Autowired
	private CmsChannelMng cmsChannelMng;
	private List<CmsChannel> chnlList;
	private Article bean;
	private Pagination pagination;

	private int uploadRuleId;
	private UploadRule uploadRule;

	public List<CmsChannel> getChnlList() {
		return chnlList;
	}

	public void setChnlList(List<CmsChannel> chnlList) {
		this.chnlList = chnlList;
	}

	public int getUploadRuleId() {
		return uploadRuleId;
	}

	public void setUploadRuleId(int uploadRuleId) {
		this.uploadRuleId = uploadRuleId;
	}

	public Article getBean() {
		return bean;
	}

	public void setBean(Article bean) {
		this.bean = bean;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
}