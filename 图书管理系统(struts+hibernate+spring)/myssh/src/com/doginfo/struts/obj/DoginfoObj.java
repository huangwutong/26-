package com.doginfo.struts.obj;

import com.laodong.pub.product.spring.NllDObj;

/**
 * ������doginfo ���Ǽ���Ϣ
 * @author Administrator
 *
 */
public class DoginfoObj extends NllDObj{
    private int id;  //���
    private String name;  //����
    private String master;  //������
    private int age;  //����
    private String ms;  //��������
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMaster() {
		return master;
	}
	public void setMaster(String master) {
		this.master = master;
	}
	public String getMs() {
		return ms;
	}
	public void setMs(String ms) {
		this.ms = ms;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
