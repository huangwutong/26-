package com.xh369.service;

import com.xh369.dao.ArticleDAO;
import com.xh369.daoimpl.ArticleDAOimpl;
import com.xh369.dao.BigClassDAO;
import com.xh369.daoimpl.BigClassDAOimpl;
import com.xh369.dao.SmallClassDAO;
import com.xh369.daoimpl.SmallClassDAOimpl;

public class ManagerFactory {

    //创建文章对象
    public static ArticleDAO createArticleDAO(){
        return new ArticleDAOimpl();
    }

    //创建一级分类对象
    public static BigClassDAO createBigClassDAO(){
        return new BigClassDAOimpl();
    }

    //创建二级分类对象
    public static SmallClassDAO createSmallClassDAO(){
        return new SmallClassDAOimpl();
    }
}
