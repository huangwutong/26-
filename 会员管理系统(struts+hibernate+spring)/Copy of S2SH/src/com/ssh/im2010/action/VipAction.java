package com.ssh.im2010.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.im2010.model.Vip;
import com.ssh.im2010.service.PageService;
import com.ssh.im2010.service.VipService;
import com.ssh.im2010.utilBean.Page;

@Component("vipAction")
@Scope("prototype")

public class VipAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private Vip vip;
	private VipService vipService;
	private List<Vip> vips ;
	private Page page;
	private int requestedPage;
	private PageService pageService;
	public PageService getPageService() {
		return pageService;
	}
	@Resource
	public void setPageService(PageService pageService) {
		this.pageService = pageService;
	}
	public int getRequestedPage() {
		return requestedPage;
	}
	public void setRequestedPage(int requestedPage) {
		this.requestedPage = requestedPage;
	}
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	public Page getPage() {
		return page;
	}
	@Resource
	public void setPage(Page page) {
		this.page = page;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public Vip getVip() {
		return vip;
	}
	public void setVip(Vip vip) {
		this.vip = vip;
	}
	
	public VipService getVipService() {
		return vipService;
	}
	
	@Resource
	public void setVipService(VipService vipService) {
		this.vipService = vipService;
	}
	
	public List<Vip> getVips() {
		return vips;
	}
	public void setVips(List<Vip> vips) {
		this.vips = vips;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	//ÒµÎñÂß¼­
	public String addInput(){
		vipService.add(vip);
		return "true";
	}
	
	public String deleteById(){
		vipService.delete(id);
        return "true";
	}

	public String list(){
		vips = vipService.loadAllVip();
		return "success";
	}
	
	public String updateInput(){
		vip = vipService.loadById(id);
		return "updateInput";
	}
	
	public String update(){
		vipService.update(vip, id);
		return "true";
	}
	
	public String loadByName(){
		vips = vipService.loadByName(name);
		return "success";
	}
	
	public String loadVips(){
		if (requestedPage <= 0) {
			requestedPage = page.getPageCount();
		}
		this.page.setPageNow(requestedPage);
		vips = pageService.getVips(requestedPage);
    return "success";
    }
	
}
