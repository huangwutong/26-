package com.xh369.dao;

import com.xh369.dto.BigClass;

public interface BigClassDAO {

    //һ���������
    boolean articleBigClassAdd(BigClass bigClass);

    //��ѯ����Ҫ��ӵĶ����������ڵ�һ������
    BigClass addSmallClass(Integer bigclassid);

    //�޸�һ������ҳ��
    boolean updateOnlyBigClass(BigClass bigClass);

    //ɾ��һ������
    boolean deleteBigClass(Integer id);

    //����һ������
    BigClass loadBigClass(Integer id);
}
