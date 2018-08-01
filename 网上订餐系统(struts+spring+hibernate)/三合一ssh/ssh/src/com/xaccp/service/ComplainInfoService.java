package com.xaccp.service;

import java.util.List;

import com.xaccp.dao.ComplainInfoDAO;
import com.xaccp.po.ComplainInfo;

public class ComplainInfoService {
	
	private ComplainInfoDAO complainInfodao;
	public ComplainInfoDAO getComplainInfodao() {
		return complainInfodao;
	}

	public void setComplainInfodao(ComplainInfoDAO complainInfodao) {
		this.complainInfodao = complainInfodao;
	}
	
	/**
	 * 查询所有的投诉
	 * @return
	 */
	public List fingAllComplain(){
		return complainInfodao.findAllComplain();
	}
	
	/**
	 * 删除
	 * @param ciids
	 */
	public void bulkDeleteComplain(int ...ciids){
		for (int i = 0; i < ciids.length; i++) {
			//查询所有的用户的信息
			ComplainInfo ci=complainInfodao.findById(ciids[i]);
			complainInfodao.delete(ci);
		}
	}
	
	/**
	 * 添加投诉
	 *
	 */
	public void saveComplain(ComplainInfo ci){
		if(ci!=null){
			complainInfodao.save(ci);
		}
	}
}