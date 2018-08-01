package com.xh369.service;

import com.xh369.dao.ArticleDAO;
import com.xh369.daoimpl.ArticleDAOimpl;
import com.xh369.dao.BigClassDAO;
import com.xh369.daoimpl.BigClassDAOimpl;
import com.xh369.dao.SmallClassDAO;
import com.xh369.daoimpl.SmallClassDAOimpl;

public class ManagerFactory {

    //�������¶���
    public static ArticleDAO createArticleDAO(){
        return new ArticleDAOimpl();
    }

    //����һ���������
    public static BigClassDAO createBigClassDAO(){
        return new BigClassDAOimpl();
    }

    //���������������
    public static SmallClassDAO createSmallClassDAO(){
        return new SmallClassDAOimpl();
    }
}
