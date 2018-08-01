package com.xh369.dao;

import com.xh369.dto.Admin;
import com.xh369.dto.Popedom;
import java.util.List;

public interface AdminDAO {

    //登录
    int getLogin(Admin admin);

    //查询管理人员列表
    List getAdminList();

    //添加管理人员
    boolean insertAdmin(Admin admin);
    
    //查询用户已拥有的权限
    Admin getPopedom(Integer id);
    
    //查询权限
    List getAllPopedom();
    
    //修改用户权限
    boolean updatePopedom(Integer id, StringBuffer sb); 
    
    //删除用户
    boolean delAdmin(Integer id);
}
