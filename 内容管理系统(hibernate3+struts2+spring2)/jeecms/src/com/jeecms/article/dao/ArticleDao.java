package com.jeecms.article.dao;

import com.jeecms.article.entity.Article;
import com.jeecms.core.JeeCoreDao;
import com.ponyjava.common.page.Pagination;

public interface ArticleDao extends JeeCoreDao<Article> {
	public Pagination getForTag(Long webId, Long chnlId, Long ctgId,
			String searchKey, Boolean hasTitleImg, boolean recommend,
			int orderBy, boolean isPage, int firstResult, int pageNo,
			int pageSize);

	/**
	 * 获得上一篇、下一篇文章
	 * 
	 * @param webId
	 * @param chnlId
	 * @param artiId
	 * @param next
	 *            true：下一篇；false：上一篇
	 * @return
	 */
	public Article getSideArticle(Long webId, Long chnlId, Long artiId,
			boolean next);

	/**
	 * 获得有权限未审核的文章
	 * 
	 * @param adminId
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pagination getUncheckArticle(Long adminId, int pageNo, int pageSize);

	/**
	 * 获得有权限未签收的文章
	 * 
	 * @param adminId
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pagination getUnsigninArticle(Long adminId, int pageNo, int pageSize);

	/**
	 * 获得有权限的文章
	 * 
	 * @param webId
	 * @param chnlId
	 * @param adminId
	 * @param inputAdminId
	 * @param contentCtgId
	 * @param disabled
	 * @param topTime
	 * @param topLevel
	 * @param status
	 * @param title
	 * @param order
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pagination getRightArticle(Long webId, Long chnlId, Long adminId,
			Long inputAdminId, Long contentCtgId, boolean disabled,
			boolean topTime, Integer topLevel, int status, String title,
			int order, int pageNo, int pageSize);

	public Pagination getArticleForMember(Long memberId, Long webId,
			Boolean draft, Boolean check, Boolean reject, int pageNo,
			int pageSize);
}