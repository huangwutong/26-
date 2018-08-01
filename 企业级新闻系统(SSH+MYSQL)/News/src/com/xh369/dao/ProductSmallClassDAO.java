package com.xh369.dao;

import java.util.List;
import com.xh369.dto.ProductBigClass;
import com.xh369.dto.ProductSmallClass;

public interface ProductSmallClassDAO{

    //��ѯ��Ʒ����
    List getProductBigClass();

    //��Ӳ�ƷС��
    boolean insertProductSmallClass(ProductSmallClass productSmallClass);

    //���ز�Ʒ����(����ID)
    ProductBigClass getProductBigClassByID(Integer bigclassid);

    //ɾ����ƷС��
    boolean delProductSmallClass(Integer id);
}
