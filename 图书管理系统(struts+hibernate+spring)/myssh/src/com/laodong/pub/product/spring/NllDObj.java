package com.laodong.pub.product.spring;
/**
 * @������ spring����
 * @ҵ������
 *
 * @author lhh
 * @ʱ�� 2007-7-1323:56:15
 */
public class NllDObj {
	/**
	 * ��ʾnull����
	 */
	private boolean isNull = true;

	public boolean isNull() {
		return isNull;
	}

	public void setNull(boolean isNull) {
		this.isNull = isNull;
	}
	public NllDObj getObject(){
		if(isNull)
			return null;
		else
			return this;
	}
}
