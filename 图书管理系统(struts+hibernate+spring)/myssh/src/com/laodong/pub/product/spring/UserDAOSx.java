package com.laodong.pub.product.spring;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**@������
 * @ҵ������
 *
 * @author lhh
 * @ʱ�� 2007-7-1221:29:03
 */
public abstract class UserDAOSx extends HibernateDaoSupport implements UserDAO{
	protected JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	public void test(){};

    public void selectWithTemp(){};

    public List select(String where){return null;};

    public void update(String sql){
		jdbcTemplate.update(sql);
    };

    public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void insert(User u){};

    public User selectByUserid(String userid){return null;};

    public Object selectByPk(String id){return null;};
}
