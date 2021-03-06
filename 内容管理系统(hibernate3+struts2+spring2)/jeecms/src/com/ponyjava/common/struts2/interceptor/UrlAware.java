package com.ponyjava.common.struts2.interceptor;

/**
 * 对URL进行处理，用户处理前台翻页、路径参数和‘-’分割的参数
 * 
 * @author liufang
 * 
 */
public interface UrlAware {
	/**
	 * 路径参数。将路径分割成字符串。如：http://www.sina.com/news/32.htm，取{"news","32"}。
	 * 
	 * @param pathParams
	 */
	public void setPathParams(String[] pathParams);

	/**
	 * 第几页
	 * 
	 * @param pageNo
	 */
	public void setPageNo(int pageNo);

	/**
	 * 用于分页。访问路径前面部分。如：http://www.sina.com/news/32_2.htm，取"http://www.sina.com/news/32"
	 */
	public void setPageLink(String pageLink);

	/**
	 * 用于分页。访问路径后面部分。如：http://www.sina.com/news/32_2-5-9.htm，取"-5-9.htm"
	 */
	public void setPageSuffix(String pageSuffix);

	/**
	 * 完整访问路径。如：http://www.sina.com/news/32_2-5-9.htm
	 */
	public void setWholeUrl(String wholeUrl);
}
