package com.xh369.dao;

import com.xh369.dto.Product;
import java.util.List;
import com.xh369.dto.ProductBigClass;
import com.xh369.dto.ProductSmallClass;

public interface ProductDAO{

    //��Ӳ�Ʒ
    boolean insertProduct(Product product);

    //��Ʒ���
    List getProduct();

    //��Ʒ�޸�(������ʾ��ԭ����)
    Product showProduct(Integer id);

    //��Ʒ�޸�
    boolean updateProduct(Product product);

    //��Ʒɾ��
    boolean delProduct(Integer id);

    //����Ŀ����ģ������ʾһ������,�Ӷ���������������
    List getProductBigClass();

    //����һ������,��ID��ѯ
    ProductBigClass getProductBigClassByID(Integer id);

    //���ض�������,��ID��ѯ
    ProductSmallClass getProductSmallClassByID(Integer id);
}
