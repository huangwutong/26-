package com.jeecms.cms.action.login;

import static com.ponyjava.common.util.ComUtils.JSESSION_COOKIE;

import java.util.Set;

import javax.servlet.http.Cookie;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jeecms.core.Constants;
import com.jeecms.core.JeeCoreAction;
import com.jeecms.core.entity.Admin;
import com.jeecms.core.entity.User;
import com.jeecms.core.entity.Website;
import com.jeecms.core.manager.FunctionMng;
import com.octo.captcha.service.image.ImageCaptchaService;
import com.ponyjava.common.struts2.ContextPvd;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("cms.adminLoginAct")
public class AdminLoginAct extends JeeCoreAction {
	public String loginInput() {
		Website web = websiteMng.getWebsite(domainName);
		if (web == null) {
			web = websiteMng.getByAlias(domainName);
			if (web != null) {
				redirectUrl = web.getWebUrl();
				return Constants.REDIRECT_DOMAIN;
			} else {
				return Constants.WEBSITE_NOT_FOUND;
			}
		}
		return "loginInput";
	}

	public String login() {
		boolean isHuman = imageCaptchaService.validateResponseForID(contextPvd
				.getSessionId(false), checkCode);
		if (!isHuman) {
			addActionError("��֤�����");
			return loginInput();
		}
		User user = userMng.authenticate(loginName, password);
		if (user == null) {
			addActionError("�û��������ڻ��������");
			return loginInput();
		}
		Admin admin = adminMng.getAdminByUserId(getWebId(), user.getId());
		if (admin == null) {
			addActionError("��û�б�վ�Ĺ���Ȩ�ޣ�");
			return loginInput();
		}
		// �����ǰ��¼��Ϣ
		contextPvd.logout();
		// ���浱ǰ��¼��Ϣ
		contextPvd.setSessionAttr(User.USER_KEY, user.getId());
		contextPvd.setSessionAttr(Admin.ADMIN_KEY, admin.getId());
		userMng.updateLoginInfo(user);
		// ��Ȩ�޼�����session
		Set<String> fiSet = functionMng.getFunctionItems(admin.getId());
		contextPvd.setSessionAttr(Admin.RIGHTS_KEY, fiSet);
		// ����μ����������¼
		Website web = getWeb();
		if (!StringUtils.isBlank(web.getBaseDomain())) {
			Cookie c = new Cookie(JSESSION_COOKIE, contextPvd
					.getSessionId(false));
			c.setPath("/");
			c.setDomain(web.getTopDomain(true));
			contextPvd.addCookie(c);
		}
		return SUCCESS;
	}

	public String logout() {
		contextPvd.logout();
		return "logout";
	}

	@Autowired
	private ImageCaptchaService imageCaptchaService;
	@Autowired
	private ContextPvd contextPvd;
	@Autowired
	private FunctionMng functionMng;
	private String loginName;
	private String password;
	private String checkCode;
	private String redirectUrl;

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public String getRedirectUrl() {
		return redirectUrl;
	}

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
}
