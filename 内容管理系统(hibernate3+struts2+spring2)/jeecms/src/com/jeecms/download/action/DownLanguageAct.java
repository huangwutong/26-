package com.jeecms.download.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;

import com.jeecms.download.entity.DownLanguage;
import com.jeecms.download.manager.DownLanguageMng;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("download.downLanguageAct")
public class DownLanguageAct extends com.jeecms.cms.CmsSysAction {
	private static final Logger log = LoggerFactory
			.getLogger(DownLanguage.class);

	public String list() {
		this.list = downLanguageMng.getList(getWebId(), true);
		return LIST;
	}

	public String add() {
		return ADD;
	}

	public String save() {
		downLanguageMng.save(bean);
		log.info("��� ������� �ɹ�:{}", bean.getName());
		return list();
	}

	public String edit() {
		this.bean = downLanguageMng.findById(id);
		return EDIT;
	}

	public String update() {
		downLanguageMng.updateDefault(bean);
		log.info("�޸� ������� �ɹ�:{}", bean.getName());
		return list();
	}

	public String delete() {
		try {
			if (id != null) {
				bean = downLanguageMng.deleteById(id);
				log.info("ɾ�� ģ�� �ɹ�:{}", bean.getName());
			} else {
				for (DownLanguage b : downLanguageMng.deleteById(ids)) {
					log.info("ɾ�� ģ�� �ɹ�:{}", b.getName());
				}
			}
		} catch (DataIntegrityViolationException e) {
			addActionError("��¼�ѱ����ã�����ɾ��");
			return SHOW_ERROR;
		}
		return list();
	}

	public String priorityUpdate() {
		downLanguageMng.updatePriority(wids, prioritys);
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
		DownLanguage po;
		if (id == null && (ids == null || ids.length <= 0)) {
			addActionError("ID����Ϊ��");
			return true;
		} else {
			if (id != null) {
				ids = new Long[] { id };
			}
			for (Long id : ids) {
				po = downLanguageMng.findById(id);
				if (!po.getWebsite().getId().equals(getWebId())) {
					addActionError("����ɾ������վ������");
					return true;
				}
			}
		}
		return false;
	}

	public boolean validatePriorityUpdate() {
		if (hasActionErrors()) {
			return true;
		}
		if (wids == null || wids.length <= 0 || prioritys == null
				|| prioritys.length <= 0 || wids.length != prioritys.length) {
			addActionError("���ݲ��Ϸ�");
			return true;
		}
		for (int i = 0; i < wids.length; i++) {
			if (wids[i] == null) {
				addActionError("���ݲ��Ϸ�");
				return true;
			}
			if (vldExist(wids[i])) {
				return true;
			}
			if (vldWebsite(wids[i], null)) {
				return true;
			}
		}
		return false;
	}

	private boolean vldExist(Long id) {
		DownLanguage entity = downLanguageMng.findById(id);
		if (entity == null) {
			addActionError("���ݲ����ڣ�" + id);
			return true;
		}
		return false;
	}

	private boolean vldWebsite(Long id, DownLanguage bean) {
		DownLanguage entity = downLanguageMng.findById(id);
		if (!entity.getWebsite().getId().equals(getWebId())) {
			addActionError("ֻ���޸ı�վ�����ݣ�" + id);
			return true;
		}
		if (bean != null) {
			bean.setWebsite(getRootWeb());
		}
		return false;
	}

	@Autowired
	private DownLanguageMng downLanguageMng;
	private DownLanguage bean;

	private Long[] wids;
	private int[] prioritys;

	public DownLanguage getBean() {
		return bean;
	}

	public void setBean(DownLanguage bean) {
		this.bean = bean;
	}

	public Long[] getWids() {
		return wids;
	}

	public void setWids(Long[] wids) {
		this.wids = wids;
	}

	public int[] getPrioritys() {
		return prioritys;
	}

	public void setPrioritys(int[] prioritys) {
		this.prioritys = prioritys;
	}
}