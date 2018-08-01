package com.ssh.im2010.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.ssh.im2010.model.Vip;
import com.ssh.im2010.service.PageService;

@Component("pageService")
public class VipPageServiceImpl implements PageService {
	
	private HibernateTemplate hibernateTemplate;

	public int getPageCount() {
		int pc = getRowCount();
		if(pc%11==0){
			return pc/11;
		}else{
			return pc/11+1;
		}
	}

	
	public int getRowCount() {
		return hibernateTemplate.find("from Vip").size();
	}

	//¾¯¸æ¹ýÂËÆ÷
	@SuppressWarnings("unchecked")
	public List<Vip> getVips(int requestedPage) {
		int begin = (requestedPage - 1) * 11;
		if(begin <0){
			begin = 0;
		}
		int sum = getRowCount();
		int end;
		if (getRowCount() < 11) {
			end = sum;
		} else {
			end = begin + 11;
		}
		if(end>sum){
			end = sum;
		}
        return (List<Vip>) hibernateTemplate.find("from Vip").subList(begin,end);
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}
