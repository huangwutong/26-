package com.xh369.dao;

import java.util.List;
import com.xh369.dto.Productsviews;
import com.xh369.dto.ProductsviewsId;

public interface ProductsviewsDAO{

        //����ͼ������ѯ
        Productsviews findById(ProductsviewsId id);

        //����ͼʵ�����ѯ(����Criteria���)
        List findByExample(Productsviews instance);

        //����ͼ��Ų�ѯ
        List findByPropertyId(String propertyName, Object value);

        //���ڷ�ҳ��ѯ(����int position_index, int pageSize�ֱ�Ϊ��ʼ������ҳ��С)
        List findByProperty(Object[][] val, int position_index, int pageSize);
        
        //���ڷ�ҳ��ѯ(����int position_index, int pageSize�ֱ�Ϊ��ʼ������ҳ��С)
        List getByProperty(int position_index, int pageSize);

        //�õ���ҳ��ѯ���ܼ�¼��
        int getCount();
}
