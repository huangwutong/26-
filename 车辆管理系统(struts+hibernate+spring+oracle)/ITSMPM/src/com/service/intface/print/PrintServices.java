package com.service.intface.print;

import java.util.List;

public interface PrintServices {
//打印汽车所有的信息
	public List seCarnmAll();
	//打印汽车的数目
	public List PrintCarnum(Long id,String tab);
	
}
