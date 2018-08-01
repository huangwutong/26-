package test.service;

import java.util.List;

import test.vo.CatagoryInfo;

public interface ICatagoryService {

	public CatagoryInfo saveCatagory(CatagoryInfo catagoryInfo);
	public List<CatagoryInfo>  getCatagorys();
	public Boolean delCatagoryInfo(int catano);
	public Boolean updateCatagoryInfo(CatagoryInfo catagoryInfo);
	public CatagoryInfo searchCatagoryInfo(int catano);
	public List<CatagoryInfo> getPageCatagorys(int currentPage);
	
	
}
