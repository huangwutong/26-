package com.ponyjava.common.struts2.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class UrlInterceptor extends MethodFilterInterceptor {
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		Object action = invocation.getAction();
		ActionContext ctx = invocation.getInvocationContext();
		HttpServletRequest req = (HttpServletRequest) ctx
				.get(StrutsStatics.HTTP_REQUEST);
		if (action instanceof UrlAware) {
			UrlAware aware = (UrlAware) action;
			String url = req.getRequestURL().toString();
			int pointIndex = url.indexOf('.', url.lastIndexOf('/'));
			if (pointIndex == -1) {
				url += "index.do";
				pointIndex = url.indexOf('.', url.lastIndexOf('/'));
			}
			String paramStr = req.getQueryString();
			if (paramStr != null && !paramStr.trim().equals("")) {
				url += "?" + paramStr;
			}
			aware.setWholeUrl(url);
			int lineIndex = url.indexOf('_', url.lastIndexOf('/'));
			int mlineIndex = url.indexOf('-', url.lastIndexOf('/'));
			if (pointIndex != -1) {
				int preIndex = 0;
				if (lineIndex != -1) {
					// 有下划线（有分页）
					preIndex = lineIndex;
				} else if (mlineIndex != -1) {
					// 有中划线（有定制参数）
					preIndex = mlineIndex;
				} else {
					// 什么都没有
					preIndex = pointIndex;
				}
				aware.setPageLink(url.substring(0, preIndex));
				int suffixIndex = 0;
				if (mlineIndex != -1) {
					// 有中划线
					suffixIndex = mlineIndex;
				} else {
					suffixIndex = pointIndex;
				}
				aware.setPageSuffix(url.substring(suffixIndex));
				// 取页数
				if (preIndex == suffixIndex) {
					// 没有分页，为第一页。
					aware.setPageNo(1);
				} else {
					// 去掉下划线"_"。
					String page = url.substring(preIndex + 1, suffixIndex);
					try {
						aware.setPageNo(Integer.parseInt(page));
					} catch (Exception e) {
						aware.setPageNo(1);
					}
				}
			} else {
				// never
				throw new RuntimeException("路径错误。不过这是不可能发生的！");
			}
			String[] pathParams = ctx.getName().split("/");
			aware.setPathParams(pathParams);
		}
		return invocation.invoke();
	}
}
