package com.xh369.dao;

import java.util.List;
import com.xh369.dto.Articlesviews;
import com.xh369.dto.ArticlesviewsId;

public interface ArticlesviewsDAO{

    //����ͼ������ѯ
    Articlesviews findById(ArticlesviewsId id);

    //����ͼʵ�����ѯ(����Criteria���)
    List findByExample(Articlesviews instance);

    //����ͼ��Ų�ѯ
    List findByPropertyId(String propertyName, Object value);

    //���ڷ�ҳ��ѯ(����int position_index, int pageSize�ֱ�Ϊ��ʼ������ҳ��С)
    List findByProperty(Object[][] val, int position_index, int pageSize);
    
    //���ڷ�ҳ��ѯ(����int position_index, int pageSize�ֱ�Ϊ��ʼ������ҳ��С)
    List findByProperty(int position_index, int pageSize);

    //�õ���ҳ��ѯ���ܼ�¼��
    int getCount(Object[][] val);
    
    //�õ���ҳ��ѯ���ܼ�¼��
    int getCount();
}
