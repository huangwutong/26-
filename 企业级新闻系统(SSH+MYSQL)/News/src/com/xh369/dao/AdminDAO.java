package com.xh369.dao;

import com.xh369.dto.Admin;
import com.xh369.dto.Popedom;
import java.util.List;

public interface AdminDAO {

    //��¼
    int getLogin(Admin admin);

    //��ѯ������Ա�б�
    List getAdminList();

    //��ӹ�����Ա
    boolean insertAdmin(Admin admin);
    
    //��ѯ�û���ӵ�е�Ȩ��
    Admin getPopedom(Integer id);
    
    //��ѯȨ��
    List getAllPopedom();
    
    //�޸��û�Ȩ��
    boolean updatePopedom(Integer id, StringBuffer sb); 
    
    //ɾ���û�
    boolean delAdmin(Integer id);
}
