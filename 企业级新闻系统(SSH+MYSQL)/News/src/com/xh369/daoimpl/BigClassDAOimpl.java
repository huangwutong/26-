package com.xh369.daoimpl;

import com.xh369.dao.*;
import com.xh369.dto.BigClass;
import com.xh369.actions.HibernateSessionFactory;
import org.hibernate.Session;

public class BigClassDAOimpl implements BigClassDAO{

    //一级分类添加
    public boolean articleBigClassAdd(BigClass bigClass){

        try {
            Session session = HibernateSessionFactory.getSession();
            HibernateSessionFactory.beginTransaction();
            session.save(bigClass);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //查询出所要添加的二级分类所在的一级分类
    public BigClass addSmallClass(Integer bigclassid){

        BigClass bigClass = null;
        try {
            Session session = HibernateSessionFactory.getSession();
            bigClass = (BigClass) session.load(BigClass.class, bigclassid);
            return bigClass;
        } catch (Exception ex) {
            ex.printStackTrace();
            return bigClass;
        }
    }

    //修改一级分类页面
    public boolean updateOnlyBigClass(BigClass bigClass){

        try {
            Session session = HibernateSessionFactory.getSession();
            HibernateSessionFactory.beginTransaction();
            session.update(bigClass);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //删除一级分类
    public boolean deleteBigClass(Integer id){

        try {
            Session session = HibernateSessionFactory.getSession();
            HibernateSessionFactory.beginTransaction();
            BigClass bigclass = (BigClass) session.load(BigClass.class, id);
            session.delete(bigclass);
            return false;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //加载一级分类
    public BigClass loadBigClass(Integer id){

        try {
            Session session = HibernateSessionFactory.getSession();
            BigClass bigclass = (BigClass) session.load(BigClass.class, id);
            return bigclass;
        } catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
}
