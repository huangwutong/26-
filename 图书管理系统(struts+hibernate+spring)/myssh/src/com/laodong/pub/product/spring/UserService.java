package com.laodong.pub.product.spring;
/**@������
 * @ҵ������
 *
 * @author lhh
 * @ʱ�� 2007-7-70:46:51
 */
public class UserService {
	public User user;
    public void myt(){
    	user.selectWithTemp();
    }
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void taxd12()throws Exception{
		user.dog();
	}
	public void ptd12()throws Exception{
		user.dog();
	}
}
