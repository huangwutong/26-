package com.jeecms.core.action;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;

import com.jeecms.core.JeeCoreAction;
import com.jeecms.core.entity.EmailSender;
import com.jeecms.core.entity.Global;
import com.jeecms.core.entity.Website;
import com.jeecms.core.manager.GlobalMng;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("core.websiteAct")
public class WebsiteAct extends JeeCoreAction {
	private static final Logger log = LoggerFactory.getLogger(WebsiteAct.class);

	public String list() {
		this.pagination = websiteMng.getAllWebsite(pageNo, getCookieCount());
		return LIST;
	}

	public String add() {
		this.parentList = websiteMng.getAllWebsite();
		return ADD;
	}

	public String save() {
		if (bean.getParent() != null && bean.getParent().getId() == null) {
			bean.setParent(null);
		}
		websiteMng.saveWebsite(getWeb(), bean, getUser());
		log.info("添加  站点 成功:{}", bean.getName());
		return list();
	}

	public String edit() {
		this.bean = websiteMng.getWebsite(id);
		this.parentList = websiteMng.getAllWebsite();
		return EDIT;
	}

	public String update() {
		websiteMng.updateWebsite(bean);
		log.info("更新  站点 成功:{}", bean.getName());
		return list();
	}

	public String emailEdit() {
		this.email = getWeb().getEmailSender();
		return "emailEdit";
	}

	public String emailUpdate() {
		Website updater = new Website();
		if (email.getUserPwd() != null && email.getUserPwd().trim().equals("")) {
			email.setUserPwd(null);
		}
		updater.setEmailSender(email);
		updater.setId(getWebId());
		websiteMng.updateWebsite(updater);
		addActionMessage("修改成功");
		return emailEdit();
	}

	public String siteEdit() {
		this.bean = getWeb();
		return "siteEdit";
	}

	public String siteUpdate() {
		String origDomain = getWeb().getDomain();
		String updatedDomain = bean.getDomain();
		bean.setId(getWebId());
		bean = websiteMng.updateWebsite(bean);
		addActionMessage("修改成功");
		if (StringUtils.equals(origDomain, updatedDomain)) {
			return siteEdit();
		} else {
			return "domainChanged";
		}
	}

	public String globalEdit() {
		this.global = getWeb().getGlobal();
		return "globalEdit";
	}

	public String globalUpdate() {
		globalMng.updateDefault(global);
		addActionMessage("修改成功");
		return globalEdit();
	}

	public String delete() {
		try {
			for (Long webId : ids) {
				bean = websiteMng.removeWebsite(webId);
				log.info("删除  站点 成功:{}", bean.getName());
			}
		} catch (DataIntegrityViolationException e) {
			addActionError("记录已被引用，不能删除!");
			log.info("删除  站点 失败，记录被引用:{}", bean.getName());
			return SHOW_ERROR;
		}
		return list();
	}

	public boolean validateEdit() {
		if (hasErrors()) {
			return true;
		}
		if (vldExist(id)) {
			return true;
		}
		return false;
	}

	public boolean validateUpdate() {
		if (hasErrors()) {
			return true;
		}
		if (vldExist(bean.getId())) {
			return true;
		}
		return false;
	}

	public boolean validateDelete() {
		if (hasErrors()) {
			return true;
		}
		if (vldBatch()) {
			return true;
		}
		for (Long id : ids) {
			if (vldExist(id)) {
				return true;
			}
		}
		return false;
	}

	private boolean vldExist(Long id) {
		Website entity = websiteMng.getWebsite(id);
		if (entity == null) {
			addActionError("记录不存在：" + id);
			return true;
		}
		return false;
	}

	@Autowired
	private GlobalMng globalMng;
	private Website bean;
	private EmailSender email;
	private Global global;
	private List<Website> parentList;

	public Website getBean() {
		return bean;
	}

	public void setBean(Website bean) {
		this.bean = bean;
	}

	public List<Website> getParentList() {
		return parentList;
	}

	public void setParentList(List<Website> parentList) {
		this.parentList = parentList;
	}

	public EmailSender getEmail() {
		return email;
	}

	public void setEmail(EmailSender email) {
		this.email = email;
	}

	public Global getGlobal() {
		return global;
	}

	public void setGlobal(Global global) {
		this.global = global;
	}
}
