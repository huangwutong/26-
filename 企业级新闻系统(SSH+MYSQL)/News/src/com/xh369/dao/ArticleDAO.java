package com.xh369.dao;

import com.xh369.dto.Article;
import java.util.List;

public interface ArticleDAO {

    //�������
    boolean articleAdd(Article article);

    //�������(��id��ѯ)
    Article searchByID(Integer id);

    //�鿴������ϸ����
    Article searchDesc(Integer id);

    //�޸ķ��������µ���Ϣ(������ʾ��ԭ����)
    Article updateArticle(Integer id);

    //�޸ķ��������µ���Ϣ
    boolean updateOnlyArticle(Article article);

    //ɾ�����������µ���Ϣ
    boolean deleteArticle(Integer id);

    //����Ŀ����ģ������ʾһ������,�Ӷ���������������
    List searchBigClass();
    
    //�б����±���(�������ѯ)
    List searchArticleTitle(String title);
}
