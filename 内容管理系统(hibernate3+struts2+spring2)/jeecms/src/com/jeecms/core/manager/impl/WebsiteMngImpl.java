package com.jeecms.core.manager.impl;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeecms.auxiliary.entity.AuxiConfig;
import com.jeecms.auxiliary.manager.AuxiConfigMng;
import com.jeecms.cms.entity.CmsAdmin;
import com.jeecms.cms.entity.CmsConfig;
import com.jeecms.cms.manager.CmsAdminMng;
import com.jeecms.cms.manager.CmsConfigMng;
import com.jeecms.core.Constants;
import com.jeecms.core.JeeCoreManagerImpl;
import com.jeecms.core.dao.WebsiteDao;
import com.jeecms.core.entity.Admin;
import com.jeecms.core.entity.Role;
import com.jeecms.core.entity.User;
import com.jeecms.core.entity.Website;
import com.jeecms.core.manager.RoleMng;
import com.jeecms.core.manager.WebsiteMng;
import com.ponyjava.common.hibernate3.OrderBy;
import com.ponyjava.common.page.Pagination;
import com.ponyjava.common.struts2.ContextPvd;
import com.ponyjava.common.util.ComUtils;

/**
 * 站点管理实现。
 * <p>
 * 系统启动时，加载所有站点信息。使用hibernate二级缓存，应用缓存保存域名domain到id的关系。
 * </p>
 * <ul>
 * <li>修改website是检查是否修改域名，否则清空缓存。</li>
 * <li>添加站点时，加入缓存</li>
 * </ul>
 * 
 * @author liufang
 * 
 */
@Service
@Transactional
public class WebsiteMngImpl extends JeeCoreManagerImpl<Website> implements
		WebsiteMng {
	public List<Website> getAllWebsite() {
		return findAll();
	}

	public Pagination getAllWebsite(int page, int countPerPage) {
		return findAll(page, countPerPage, new OrderBy[] { OrderBy.desc("id") });
	}

	public Website removeWebsite(Long id) {
		Website website = getWebsiteDao().load(id);
		getWebsiteDao().delete(website);
		websiteDomainCache.remove(website.getDomain());
		return website;
	}

	public Website getWebsite(Long id) {
		Website w = null;
		w = getWebsiteDao().load(id);
		return w;
	}

	public Website getWebsite(String domainName) {
		Element e = websiteDomainCache.get(domainName);
		if (e != null) {
			Object websiteId = e.getObjectValue();
			return getWebsite((Long) websiteId);
		} else {
			log.warn("get website from cache, domain not exist:{}", domainName);
			return null;
		}
	}

	public Website getByAlias(String domainName) {
		Element e = websiteAliasCache.get(domainName);
		if (e != null) {
			Object webId = e.getObjectValue();
			return getWebsite((Long) webId);
		} else {
			log.warn("get website by alias from cache, domain not exist:{}",
					domainName);
			return null;
		}
	}

	public List<Website> getListByUserId(Long unitedId) {
		return getWebsiteDao().getListByUserId(unitedId);
	}

	public void loadAllWebsiteToCache() {
		websiteDomainCache.removeAll();
		websiteAliasCache.removeAll();
		List<Website> ws = getWebsiteDao().findAll();
		for (Website w : ws) {
			websiteDomainCache.put(new Element(w.getDomain(), w.getId()));
			String[] alias = w.getAlias();
			if (alias != null) {
				for (String a : alias) {
					websiteAliasCache.put(new Element(a, w.getId()));
				}
			}
		}
	}

	public void saveWebsite(Website currWeb, Website w, User user) {
		w.setGlobal(currWeb.getGlobal());
		w.setSuffix(Website.DEF_SUFFIX);
		w.setCreateTime(ComUtils.now());
		w.setControl(currWeb.getControl());
		Map<String, String> solutions = currWeb.getSolutions();
		Map<String, String> nsolutions = new HashMap<String, String>();
		for (String key : solutions.keySet()) {
			nsolutions.put(key, solutions.get(key));
		}
		w.setSolutions(nsolutions);
		getWebsiteDao().save(w);
		websiteDomainCache.put(new Element(w.getDomain(), w.getId()));
		String[] alias = w.getAlias();
		if (alias != null) {
			for (String a : alias) {
				websiteAliasCache.put(new Element(a, w.getId()));
			}
		}
		// 创建管理员
		CmsAdmin cmsAdmin = new CmsAdmin();
		cmsAdmin.setCheckRight(0);
		cmsAdmin.setSelfOnly(false);
		Admin admin = new Admin();
		admin.setUser(user);
		admin.setRoles(new HashSet<Role>(roleMng.findAll()));
		cmsAdmin.setAdmin(admin);
		cmsAdmin.setWebsite(w);
		cmsAdminMng.register(cmsAdmin, true);
		// 创建配置对象
		CmsConfig cc = cmsConfigMng.findById(currWeb.getId());
		AuxiConfig ac = auxiConfigMng.findById(currWeb.getId());
		CmsConfig ncc = new CmsConfig();
		AuxiConfig nac = new AuxiConfig();
		BeanUtils.copyProperties(cc, ncc);
		BeanUtils.copyProperties(ac, nac);
		ncc.setWebsite(w);
		nac.setWebsite(w);
		cmsConfigMng.save(ncc);
		auxiConfigMng.save(nac);
		// 创建模板
		String otpl = currWeb.getTplRoot().toString();
		String ores = currWeb.getResRoot();
		String ctpl = w.getTplRoot().toString();
		String cres = w.getResRoot();
		otpl = contextPvd.getAppRealPath(otpl);
		ores = contextPvd.getAppRealPath(ores);
		ctpl = contextPvd.getAppRealPath(ctpl);
		cres = contextPvd.getAppRealPath(cres);
		try {
			FileUtils.copyDirectory(new File(otpl), new File(ctpl));
			log.debug("原模板路径：{}", otpl);
			log.debug("目标模板路径：{}", ctpl);
		} catch (IOException e) {
			log.error("拷贝模板出错", e);
		}
		try {
			File[] subRes = new File(ores).listFiles(new FileFilter() {
				public boolean accept(File pathname) {
					if (pathname.getName().equals(Constants.UPLOAD_PATH)) {
						return false;
					} else {
						return true;
					}
				}
			});
			File cresFile = new File(cres);
			for (int i = 0; i < subRes.length; i++) {
				FileUtils.copyDirectory(subRes[i], new File(cresFile, subRes[i]
						.getName()));
				log.debug("原资源路径：{}", subRes[i].getAbsolutePath());
				log.debug("目标资源路径：{}/{}", cresFile.getAbsolutePath(), subRes[i]
						.getName());
			}
		} catch (IOException e) {
			log.error("拷贝资源出错", e);
		}
	}

	public Website updateWebsite(Website website) {
		Website before = getWebsite(website.getId());
		String beforeDomain = before.getDomain();
		String beforeAlias = before.getDomainAlias();
		String[] beforeAliasArr = before.getAlias();
		Website after = (Website) getWebsiteDao().updateDefault(website);
		if (!StringUtils.equals(beforeDomain, after.getDomain())) {
			websiteDomainCache.remove(beforeDomain);
			websiteDomainCache
					.put(new Element(after.getDomain(), after.getId()));
		}
		if (!StringUtils.equals(beforeAlias, after.getDomainAlias())) {
			if (beforeAliasArr != null) {
				for (String a : beforeAliasArr) {
					websiteAliasCache.remove(a);
				}
			}
			String[] afterAliasArr = after.getAlias();
			if (afterAliasArr != null) {
				for (String a : afterAliasArr) {
					websiteAliasCache.put(new Element(a, after.getId()));
				}
			}
		}
		return after;
	}

	@Autowired
	private CmsAdminMng cmsAdminMng;
	@Autowired
	private CmsConfigMng cmsConfigMng;
	@Autowired
	private AuxiConfigMng auxiConfigMng;
	@Autowired
	private RoleMng roleMng;
	@Autowired
	private ContextPvd contextPvd;

	@Autowired
	@Qualifier("websiteDomain")
	private Cache websiteDomainCache;

	@Autowired
	@Qualifier("websiteAlias")
	private Cache websiteAliasCache;

	@Autowired
	public void setWebsiteDao(WebsiteDao dao) {
		super.setDao(dao);
	}

	public WebsiteDao getWebsiteDao() {
		return (WebsiteDao) super.getDao();
	}
}
