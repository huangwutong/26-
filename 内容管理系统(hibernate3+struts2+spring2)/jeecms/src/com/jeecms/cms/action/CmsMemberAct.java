package com.jeecms.cms.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;

import com.jeecms.cms.entity.CmsMember;
import com.jeecms.cms.manager.CmsMemberGroupMng;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("cms.cmsMemberAct")
public class CmsMemberAct extends com.jeecms.cms.CmsSysAction {
	private static final Logger log = LoggerFactory
			.getLogger(CmsMemberAct.class);

	public String list() {
		this.pagination = cmsMemberMng.findAll(pageNo, getCookieCount());
		return LIST;
	}

	public String add() {
		return ADD;
	}

	public String save() {
		cmsMemberMng.save(bean);
		addActionMessage("添加成功");
		log.info("添加 会员 成功:{}", bean.getLoginName());
		return add();
	}

	public String edit() {
		this.bean = cmsMemberMng.findById(id);
		this.list = cmsMemberGroupMng.getList(getWebId(), Integer.MIN_VALUE,
				true);
		return EDIT;
	}

	public String update() {
		cmsMemberMng.updateDefault(bean);
		log.info("修改 会员 成功:{}", bean.getLoginName());
		return list();
	}

	public String delete() {
		try {
			for (CmsMember o : cmsMemberMng.deleteById(ids)) {
				log.info("删除 会员 成功:{}", o.getLoginName());
			}
		} catch (DataIntegrityViolationException e) {
			addActionError("记录已被引用，不能删除!");
			return SHOW_ERROR;
		}
		return list();
	}

	public boolean validateSave() {
		if (hasErrors()) {
			return true;
		}
		bean.setWebsite(getRootWeb());
		return false;
	}

	public boolean validateEdit() {
		if (hasErrors()) {
			return true;
		}
		if (vldExist(id)) {
			return true;
		}
		if (vldWebsite(id, null)) {
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
		if (vldWebsite(bean.getId(), bean)) {
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
			if (vldWebsite(id, null)) {
				return true;
			}
		}
		return false;
	}

	private boolean vldWebsite(Long id, CmsMember bean) {
		CmsMember entity = cmsMemberMng.findById(id);
		if (!entity.getWebsite().equals(getRootWeb())) {
			addActionError("只能管理本站点数据：" + id);
			return true;
		}
		if (bean != null) {
			bean.setWebsite(getRootWeb());
		}
		return false;
	}

	private boolean vldExist(Long id) {
		CmsMember entity = cmsMemberMng.findById(id);
		if (entity == null) {
			addActionError("数据不存在：" + id);
			return true;
		}
		return false;
	}

	@Autowired
	private CmsMemberGroupMng cmsMemberGroupMng;

	private CmsMember bean;

	public CmsMember getBean() {
		return bean;
	}

	public void setBean(CmsMember bean) {
		this.bean = bean;
	}
}
