package com.jeecms.auxiliary.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;

import com.jeecms.auxiliary.entity.MsgCtg;
import com.jeecms.auxiliary.manager.MsgCtgMng;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("auxiliary.msgCtgAct")
public class MsgCtgAct extends com.jeecms.auxiliary.AuxiSysAction {
	private static final Logger log = LoggerFactory.getLogger(MsgCtgAct.class);

	public String list() {
		this.list = msgCtgMng.getList(getWebId());
		return LIST;
	}

	public String add() {
		return ADD;
	}

	public String save() {
		msgCtgMng.save(bean);
		log.info("添加 留言类别 成功：{}", bean.getName());
		return list();
	}

	public String edit() {
		this.bean = msgCtgMng.findById(id);
		return EDIT;
	}

	public String update() {
		msgCtgMng.updateDefault(bean);
		log.info("修改 留言类别 成功：{}", bean.getName());
		return list();
	}

	public String delete() {
		try {
			for (MsgCtg o : msgCtgMng.deleteById(ids)) {
				log.info("删除 留言类别 成功:{}", o.getName());
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
		bean.setWebsite(getWeb());
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
		if (vldWebsite(bean.getId(), null)) {
			return true;
		}
		bean.setWebsite(getWeb());
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

	private boolean vldExist(Long id) {
		MsgCtg entity = msgCtgMng.findById(id);
		if (entity == null) {
			addActionError("数据不存在：" + id);
			return true;
		}
		return false;
	}

	private boolean vldWebsite(Long id, MsgCtg bean) {
		MsgCtg entity = msgCtgMng.findById(id);
		if (!entity.getWebsite().equals(getWeb())) {
			addActionError("只能管理本站点数据：" + id);
			return true;
		}
		if (bean != null) {
			bean.setWebsite(getWeb());
		}
		return false;
	}

	@Autowired
	private MsgCtgMng msgCtgMng;
	private MsgCtg bean;

	public MsgCtg getBean() {
		return bean;
	}

	public void setBean(MsgCtg bean) {
		this.bean = bean;
	}
}
