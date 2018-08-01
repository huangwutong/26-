package com.xh369.daoimpl;

import com.xh369.dao.*;
import com.xh369.dto.BigClass;
import com.xh369.actions.HibernateSessionFactory;
import org.hibernate.Session;

public class BigClassDAOimpl implements BigClassDAO{

    //һ���������
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

    //��ѯ����Ҫ��ӵĶ����������ڵ�һ������
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

    //�޸�һ������ҳ��
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

    //ɾ��һ������
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

    //����һ������
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
