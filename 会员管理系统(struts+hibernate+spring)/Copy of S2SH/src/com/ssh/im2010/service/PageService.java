package com.ssh.im2010.service;

import java.util.List;

import com.ssh.im2010.model.Vip;

public interface PageService {
	
	public int getRowCount();
	public int getPageCount();
    public List<Vip> getVips(int requestedPage);
}
