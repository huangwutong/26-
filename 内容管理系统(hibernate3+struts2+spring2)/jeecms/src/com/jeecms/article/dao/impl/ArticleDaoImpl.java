package com.jeecms.article.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jeecms.article.dao.ArticleDao;
import com.jeecms.article.entity.Article;
import com.jeecms.core.JeeCoreDaoImpl;
import com.ponyjava.common.hibernate3.Finder;
import com.ponyjava.common.page.Pagination;

@Repository
public class ArticleDaoImpl extends JeeCoreDaoImpl<Article> implements
		ArticleDao {
	@SuppressWarnings("unchecked")
	public Pagination getForTag(Long webId, Long chnlId, Long ctgId,
			String searchKey, Boolean hasTitleImg, boolean recommend,
			int orderBy, boolean isPage, int firstResult, int pageNo,
			int pageSize) {
		Finder f = Finder.create("select bean from Article bean");
		if (chnlId != null) {
			f.append(" inner join bean.channel node,CmsChannel parent");
			f.append(" where node.lft between parent.lft and parent.rgt");
			f.append(" and parent.id=:chnlId").setParam("chnlId", chnlId);
		} else {
			f.append(" where 1=1");
		}
		f.append(" and bean.website.id=:webId").setParam("webId", webId);
		f.append(" and bean.check=true and bean.disabled=false");
		if (ctgId != null) {
			f.append(" and bean.contentCtg.id=:ctgId").setParam("ctgId", ctgId);
		}
		if (recommend) {
			f.append(" and bean.recommend=true");
		}
		if (hasTitleImg != null) {
			f.append(" and bean.hasTitleImg=:hasTitleImg");
			f.setParam("hasTitleImg", hasTitleImg);
		}
		if (!StringUtils.isBlank(searchKey)) {
			searchKey = "%" + searchKey + "%";
			f.append(" and (bean.title like :searchKey");
			f.append(" or tags like :searchKey");
			f.append(" or description like :searchKey)");
			f.setParam("searchKey", searchKey);
		}
		switch (orderBy) {
		case 3:
			f.append(" order by bean.visitTotal asc");
			break;
		case 2:
			f.append(" order by bean.visitTotal desc");
			break;
		case 1:
			f.append(" order by bean.releaseDate asc");
			break;
		default:
			f.append(" order by bean.releaseDate desc");
			break;
		}
		if (isPage) {
			return find(f, pageNo, pageSize);
		} else {
			f.setFirstResult(firstResult);
			f.setMaxResults(pageSize);
			List list = find(f);
			return new Pagination(pageNo, list.size(), pageSize, list);
		}
	}

	public Article getSideArticle(Long webId, Long chnlId, Long artiId,
			boolean next) {
		Finder f = Finder
				.create("from Article a where a.website.id=:webId and a.disabled=false and a.check=true");
		f.setParam("webId", webId);
		if (chnlId != null) {
			f.append(" and a.channel.id=:chnlId");
			f.setParam("chnlId", chnlId);
		}
		if (next) {
			f.append(" and a.id>:artiId order by a.id asc");
		} else {
			f.append(" and a.id<:artiId order by a.id desc");
		}
		f.setParam("artiId", artiId);
		Article entity = (Article) f.createQuery(getSession()).setMaxResults(1)
				.uniqueResult();
		return entity;
	}

	public Pagination getUncheckArticle(Long adminId, int pageNo, int pageSize) {
		// 有权限的所有符合审核要求的文章
		Finder f = Finder.create("select bean from Article bean");
		f.append(" inner join bean.channel chnl");
		f.append(" inner join chnl.admins admin");
		f.append(" where admin.id=:adminId").setParam("adminId", adminId);
		f.append(" and bean.disabled=false and bean.reject=false");
		f.append(" and bean.draft=false and bean.check=false");
		f.append(" and bean.checkStep>=0");
		f.append(" and admin.checkRight=bean.checkStep+1");
		return find(f, pageNo, pageSize);
	}

	public Pagination getUnsigninArticle(Long adminId, int pageNo, int pageSize) {
		Finder f = Finder.create("select bean from Article bean");
		f.append(" inner join bean.channel chnl");
		f.append(" inner join chnl.admins admin");
		f.append(" where admin.id=:adminId").setParam("adminId", adminId);
		f.append(" and bean.checkStep=-1 and bean.draft=false");
		f.append(" and bean.disabled=false and bean.reject=false");
		return find(f, pageNo, pageSize);

	}

	public Pagination getRightArticle(Long webId, Long chnlId, Long adminId,
			Long inputAdminId, Long contentCtgId, boolean disabled,
			boolean topTime, Integer topLevel, int status, String title,
			int order, int pageNo, int pageSize) {
		String hql = "select bean from Article bean inner join bean.channel node inner join node.admins admin,CmsChannel parent"
				+ " where node.lft between parent.lft and parent.rgt and parent.id=:chnlId and bean.website.id=:webId and admin.id=:adminId";
		Finder f = Finder.create(hql).setParam("webId", webId).setParam(
				"chnlId", chnlId).setParam("adminId", adminId);
		if (contentCtgId != null) {
			f.append(" and bean.contentCtg.id=:contentCtgId").setParam(
					"contentCtgId", contentCtgId);
		}
		if (topLevel != null) {
			f.append(" and bean.topLevel=:topLevel").setParam("topLevel",
					topLevel);
		}
		if (inputAdminId != null) {
			f.append(" and bean.adminInput.id=:inputAdminId");
			f.setParam("inputAdminId", inputAdminId);
		}
		if (disabled) {
			f.append(" and bean.disabled=true");
		}
		if (topTime) {
			f.append(" and bean.sortDate>current_timestamp()");
		}
		switch (status) {
		case 4:
			// 退稿
			f.append(" and bean.reject=true");
			break;
		case 3:
			// 已审核
			f.append(" and bean.check=true");
			break;
		case 2:
			// 待审核
			f.append(" and bean.check=false and bean.draft=false");
			break;
		case 1:
			// 草稿
			f.append(" and bean.draft=true");
			break;
		default:
			break;
		}
		if (!StringUtils.isBlank(title)) {
			f.append(" and bean.title like :title").setParam("title",
					"%" + title + "%");
		}
		switch (order) {
		case 13:
			f.append(" order by bean.visitTotal asc");
			break;
		case 12:
			f.append(" order by bean.visitTotal desc");
			break;
		case 11:
			f.append(" order by bean.visitYear asc");
			break;
		case 10:
			f.append(" order by bean.visitYear desc");
			break;
		case 9:
			f.append(" order by bean.visitQuarter asc");
			break;
		case 8:
			f.append(" order by bean.visitQuarter desc");
			break;
		case 7:
			f.append(" order by bean.visitMonth asc");
			break;
		case 6:
			f.append(" order by bean.visitMonth desc");
			break;
		case 5:
			f.append(" order by bean.visitWeek asc");
			break;
		case 4:
			f.append(" order by bean.visitWeek desc");
			break;
		case 3:
			f.append(" order by bean.visitToday asc");
			break;
		case 2:
			f.append(" order by bean.visitTotal desc");
			break;
		case 1:
			f.append(" order by bean.id asc");
			break;
		default:
			f.append(" order by bean.id desc");
			break;
		}
		return find(f, pageNo, pageSize);
	}

	public Pagination getArticleForMember(Long memberId, Long webId,
			Boolean draft, Boolean check, Boolean reject, int pageNo,
			int pageSize) {
		Finder f = Finder
				.create("from Article bean where bean.member.id=:memberId");
		f.setParam("memberId", memberId);
		if (webId != null) {
			f.append(" and bean.website.id=:webId").setParam("webId", webId);
		}
		if (draft != null) {
			f.append(" and bean.draft=:draft").setParam("draft", draft);
		}
		if (check != null) {
			f.append(" and bean.check=:check").setParam("check", check);
		}
		if (reject != null) {
			f.append(" and bean.reject=:reject").setParam("reject", reject);
			if (reject) {
				f.append(" and bean.checkStep=-1");
			}
		}
		f.append(" order by bean.id desc");
		return find(f, pageNo, pageSize);
	}
}