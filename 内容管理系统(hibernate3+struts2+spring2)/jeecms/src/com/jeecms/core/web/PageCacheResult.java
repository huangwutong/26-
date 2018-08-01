package com.jeecms.core.web;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;
import net.sf.ehcache.constructs.web.GenericResponseWrapper;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.views.freemarker.FreemarkerResult;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jeecms.core.PageBaseAction;
import com.opensymphony.xwork2.ActionInvocation;

import freemarker.template.Template;
import freemarker.template.TemplateModel;

public class PageCacheResult extends FreemarkerResult {
	private static final long serialVersionUID = 1L;
	private static final String CK_HOMEPAGE = "ckHomepage";
	private static final String HOMEPAGE_BEAN = "homepageCache";
	private static final String CK_CHANNEL = "ckChannel";
	private static final String CHANNEL_BEAN = "channelCache";
	private static final String CACHE_TYPE = "cacheType";

	private HttpServletResponse response;
	private ByteArrayOutputStream outstr;

	@Override
	public void execute(ActionInvocation invocation) throws Exception {
		outstr = new ByteArrayOutputStream();
		response = ServletActionContext.getResponse();
		GenericResponseWrapper wrapper = new GenericResponseWrapper(response,
				outstr);
		ServletActionContext.setResponse(wrapper);

		super.execute(invocation);
	}

	protected void postTemplateProcess(Template template, TemplateModel data)
			throws IOException {
		ServletActionContext.setResponse(response);
		String s = outstr.toString("GBK");
		WriteCache(s);
		outstr.writeTo(response.getOutputStream());
	}

	private void WriteCache(String s) {
		WebApplicationContext wac = WebApplicationContextUtils
				.getRequiredWebApplicationContext(ServletActionContext
						.getServletContext());
		Integer cacheKey = (Integer) invocation.getStack()
				.findValue(CACHE_TYPE);
		Cache cache;
		Object key;
		if (cacheKey == PageBaseAction.HOMEPAGE_CACHE) {
			cache = (Cache) wac.getBean(HOMEPAGE_BEAN, Cache.class);
			key = invocation.getStack().findValue(CK_HOMEPAGE);
		} else if (cacheKey == PageBaseAction.CHANNEL_CACHE) {
			cache = (Cache) wac.getBean(CHANNEL_BEAN, Cache.class);
			key = invocation.getStack().findValue(CK_CHANNEL);
		} else {
			throw new RuntimeException("不支持的缓存类型：" + cacheKey);
		}
		cache.put(new Element(key, s));
	}
}
