package com.laodong.pub.util.imp;

import com.laodong.pub.product.spring.NllDObj;

/**@������
 * @ҵ������
 *
 * @author lhh
 * @ʱ�� 2007-7-1423:15:42
 */
public class AutoGenIDObj extends NllDObj{
    private String tablename;
    private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
    
}
