
package com.xh369.daoimpl;

import com.xh369.dao.*;
import com.xh369.dto.Article;
import org.hibernate.Session;
import com.xh369.actions.HibernateSessionFactory;
import java.util.*;

import org.hibernate.Query;
import com.xh369.dto.BigClass;

public class ArticleDAOimpl implements ArticleDAO {

    //�������
    public boolean articleAdd(Article article) {

        try {
            Session session = HibernateSessionFactory.getSession();
            HibernateSessionFactory.beginTransaction();
            session.save(article);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //�������(��id��ѯ)
    public Article searchByID(Integer id){

        Article article = null;
        Session session = HibernateSessionFactory.getSession();
        try {
            article = (Article) session.load(Article.class, id);
            return article;
        } catch (Exception ex) {
            ex.printStackTrace();
            return article;
        }
    }

    //�鿴������ϸ����
    public Article searchDesc(Integer id) {

        return searchByID(id);
    }

    //�޸ķ��������µ���Ϣ(������ʾ��ԭ����)
    public Article updateArticle(Integer id){

        return searchByID(id);
    }

    //ɾ�����������µ���Ϣ
    public boolean deleteArticle(Integer id) {

        try {
            Session session = HibernateSessionFactory.getSession();
            HibernateSessionFactory.beginTransaction();
            Article article = (Article) session.load(Article.class, id);
            session.delete(article);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //����Ŀ����ģ������ʾһ������,�Ӷ���������������
    public List searchBigClass(){

        List aList = new ArrayList();
        Session session = HibernateSessionFactory.getSession();
        try {
            String hql = "from BigClass bigclass";
            Query query = session.createQuery(hql);
            List list = query.list();
            for(Iterator it = list.iterator(); it.hasNext();){
                BigClass bigClass = (BigClass) it.next();
                aList.add(bigClass);
            }
            return aList;
        } catch (Exception ex) {
            ex.printStackTrace();
            return aList;
        }
    }

    //�޸ķ��������µ���Ϣ
    public boolean updateOnlyArticle(Article article){

        try {
            Session session = HibernateSessionFactory.getSession();
            HibernateSessionFactory.beginTransaction();
            session.update(article);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    //�б����±���(�������ѯ)
	public List searchArticleTitle(String title) {
		
		try {
			Session session = HibernateSessionFactory.getSession();
			String hql = "select distinct(article.title) from Article as article where article.title like '%" + title + "%' ";
			return session.createQuery(hql)
				                .list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
