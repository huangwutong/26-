package com.xh369.dao;

import com.xh369.dto.Article;
import java.util.List;

public interface ArticleDAO {

    //文章添加
    boolean articleAdd(Article article);

    //文章浏览(按id查询)
    Article searchByID(Integer id);

    //查看文章详细内容
    Article searchDesc(Integer id);

    //修改发布的文章的信息(首先显示出原数据)
    Article updateArticle(Integer id);

    //修改发布的文章的信息
    boolean updateOnlyArticle(Article article);

    //删除发布的文章的信息
    boolean deleteArticle(Integer id);

    //在栏目管理模块中显示一级分类,从而导航到二级分类
    List searchBigClass();
    
    //列表文章标题(按标题查询)
    List searchArticleTitle(String title);
}
