package com.xh369.dao;

import com.xh369.dto.ProductBigClass;
import java.util.List;

public interface ProductBigClassDAO{

    //��Ӳ�Ʒ����,�Ҹ�����ӳ�ʼС��(����ָ��С��)
    boolean insertProductBigClass(ProductBigClass productBigClass);

    //��ѯ��һ����Ʒ�����������Ʒ����,ͨ��һ����Ʒ���ർ����������Ʒ����
    List getAllProductBigClass();

    //ɾ����Ʒ����,�Ҽ���ɾ����С��
    boolean delProductBigClass(Integer id);
}
