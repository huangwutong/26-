package test.service;

import java.util.List;

import test.vo.AdminInfo;

public interface IAdminService {

	public List<AdminInfo> getAdmin(AdminInfo adminInfo);
}
