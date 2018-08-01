package com.jeecms.cms.action;

import java.util.HashMap;
import java.util.Map;

import net.sf.ehcache.Cache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jeecms.cms.entity.CmsConfig;
import com.jeecms.cms.manager.CmsConfigMng;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("cms.cmsCacheAct")
public class CmsCacheAct extends com.jeecms.core.JeeCoreAction {
	public String configEdit() {
		CmsConfig config = cmsConfigMng.findById(getWebId());
		cacheHomepage = config.getCacheHomepage();
		cacheChannel = config.getCacheChannel();
		return EDIT;
	}

	public String configUpdate() {
		CmsConfig config = cmsConfigMng.findById(getWebId());
		if (cacheHomepage != null) {
			config.setCacheHomepage(cacheHomepage);
		}
		if (cacheChannel != null) {
			config.setCacheChannel(cacheChannel);
		}
		cmsConfigMng.update(config);
		addActionMessage("修改成功");
		return configEdit();
	}

	public String clearHomepageCache() {
		homepageCache.remove(getWebId());
		jsonRoot.put("success", true);
		jsonRoot.put("msg", "清除成功");
		return SUCCESS;
	}

	public String clearChannelCache() {
		for (Object key : channelCache.getKeys()) {
			String k = (String) key;
			if (k.startsWith(getWebId().toString())) {
				channelCache.remove(k);
			}
		}
		jsonRoot.put("success", true);
		jsonRoot.put("msg", "清除成功");
		return SUCCESS;
	}

	@Autowired
	private CmsConfigMng cmsConfigMng;
	@Autowired
	@Qualifier("homepage")
	protected Cache homepageCache;
	@Autowired
	@Qualifier("channel")
	protected Cache channelCache;
	private Boolean cacheHomepage;
	private Boolean cacheChannel;

	private Map<String, Object> jsonRoot = new HashMap<String, Object>();

	public Boolean getCacheHomepage() {
		return cacheHomepage;
	}

	public void setCacheHomepage(Boolean cacheHomepage) {
		this.cacheHomepage = cacheHomepage;
	}

	public Boolean getCacheChannel() {
		return cacheChannel;
	}

	public void setCacheChannel(Boolean cacheChannel) {
		this.cacheChannel = cacheChannel;
	}

	public Map<String, Object> getJsonRoot() {
		return jsonRoot;
	}

	public void setJsonRoot(Map<String, Object> jsonRoot) {
		this.jsonRoot = jsonRoot;
	}
}
