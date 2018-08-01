package com.xh369.daoimpl;

import com.xh369.dao.*;
import com.xh369.dto.*;
import org.hibernate.Session;
import com.xh369.actions.HibernateSessionFactory;
import java.util.*;

public class SmallClassDAOimpl implements SmallClassDAO {

    //添加二级分类
    public boolean addSmall(SmallClass smallClass){

        try {
            Session session = HibernateSessionFactory.getSession();
            HibernateSessionFactory.beginTransaction();
            session.save(smallClass);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //修改二级分类
    public boolean updateOnlySmallClass(SmallClass smallClass){

        try {
            Session session = HibernateSessionFactory.getSession();
            HibernateSessionFactory.beginTransaction();
            session.update(smallClass);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //删除二级分类
    public boolean deleteSmallClass(Integer id){

        try {
            Session session = HibernateSessionFactory.getSession();
            HibernateSessionFactory.beginTransaction();
            SmallClass smallclass = this.loadSmallClass(id);
            session.delete(smallclass);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //加载二级分类
    public SmallClass loadSmallClass(Integer id){

        try {
            Session session = HibernateSessionFactory.getSession();
            SmallClass smallclass = (SmallClass) session.load(SmallClass.class, id);
            return smallclass;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
