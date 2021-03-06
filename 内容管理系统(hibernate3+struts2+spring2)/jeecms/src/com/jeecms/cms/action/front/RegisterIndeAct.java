package com.jeecms.cms.action.front;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jeecms.cms.CmsIndeAction;
import com.jeecms.cms.Constants;
import com.jeecms.cms.entity.CmsMember;
import com.jeecms.cms.manager.CmsMemberMng;
import com.jeecms.core.entity.Control;
import com.jeecms.core.entity.Member;
import com.jeecms.core.entity.User;
import com.jeecms.core.manager.UserMng;
import com.octo.captcha.service.image.ImageCaptchaService;

/**
 * 注册独立模板
 * 
 * @author liufang
 * 
 */
@SuppressWarnings("unchecked")
@Scope("prototype")
@Controller("cms.registerIndeAct")
public class RegisterIndeAct extends CmsIndeAction {
	private static final Logger log = LoggerFactory
			.getLogger(RegisterIndeAct.class);
	public static final String REGISTER_INPUT = "RegisterInput";
	public static final String REGISTER_RESULT = "RegisterResult";

	public String registerInput() {
		if (!getConfig().isOpenRegister()) {
			addActionError("已经关闭注册功能");
			return showMessage();
		}
		return handleResult(REGISTER_INPUT);
	}

	private boolean vldRegisterSubmit() {
		if (hasErrors()) {
			return true;
		}
		if (!getConfig().isOpenRegister()) {
			addActionError("已经关闭注册功能");
			return true;
		}
		if (!imageCaptchaService.validateResponseForID(contextPvd
				.getSessionId(false), checkCode)) {
			addActionError("验证码错误");
			return true;
		}
		// 注册名长度限制
		Control control = getWeb().getControl();
		int minLen = control.getNameMinLen();
		if (username.length() < minLen) {
			addActionError("用户名长度不够");
			return true;
		}
		// 检查保留字
		if (!control.checkReservedWords(username)) {
			addActionError("用户名使用了保留字");
			return true;
		}
		// 会员名是否已经被使用
		if (!userMng.checkLoginName(username)) {
			addActionError("用户名已经被使用");
			return true;
		}
		// 邮箱是否已经被使用
		if (!userMng.checkEmail(email)) {
			addActionError("email已经被使用");
			return true;
		}
		return false;
	}

	public String registerSubmit() {
		if (vldRegisterSubmit()) {
			return showError();
		}
		User user = new User();
		user.setLoginName(username);
		user.setPassword(password);
		user.setEmail(email);
		Member member = new Member();
		member.setUser(user);
		CmsMember cmsMember = new CmsMember();
		cmsMember.setMember(member);
		cmsMember.setGroup(getConfig().getMemberGroup());
		cmsMember.setScore(0);
		cmsMember.setCoupon(0);
		cmsMember.setWebsite(getWeb());
		cmsMember = cmsMemberMng.register(cmsMember, false);
		log.info("会员注册成功：{}", username);
		return handleResult(REGISTER_RESULT);
	}

	@Override
	protected String getSysType() {
		return Constants.MEMBER_SYS;
	}

	@Autowired
	private ImageCaptchaService imageCaptchaService;
	@Autowired
	private UserMng userMng;
	@Autowired
	private CmsMemberMng cmsMemberMng;
	private CmsMember cmsMember;
	private String username;
	private String password;
	private String email;
	private String checkCode;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public CmsMember getCmsMember() {
		return cmsMember;
	}

	public void setCmsMember(CmsMember cmsMember) {
		this.cmsMember = cmsMember;
	}
}