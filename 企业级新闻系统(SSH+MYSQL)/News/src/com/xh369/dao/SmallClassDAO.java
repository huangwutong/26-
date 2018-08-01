package com.xh369.dao;

import com.xh369.dto.SmallClass;

public interface SmallClassDAO {

    //��Ӷ�������
    boolean addSmall(SmallClass smallClass);

    //�޸Ķ�������
    boolean updateOnlySmallClass(SmallClass smallClass);

    //ɾ����������
    boolean deleteSmallClass(Integer id);

    //���ض�������
    SmallClass loadSmallClass(Integer id);
}
