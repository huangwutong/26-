/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package dlog4j;

import java.util.Iterator;
import java.util.List;

import dlog4j.formbean.CategoryForm;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;
import dlog4j.security.DlogRole;

import net.sf.hibernate.Criteria;
import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.expression.Expression;
import net.sf.hibernate.expression.Order;

/**
 * 日记分类管理器
 * @author Liudong
 */
public class CategoryManager {

    /**
     * 读取日记分类的详细信息(管理级别的方法)
     * DlogCategoryAction的删除和更新分类方法用到该方法
     * @param ssn
     * @param site
     * @param loginUser
     * @param cat_id
     * @return
     * @throws HibernateException
     */
    public static CategoryForm getCategory(Session ssn, SiteForm site, int cat_id)
		throws HibernateException {    
		Criteria crit = ssn.createCriteria(CategoryForm.class);
		crit = crit.add(Expression.eq("site.id", new Integer(site.getId())));
		crit = crit.add(Expression.eq("id", new Integer(cat_id)));
		try {
			List cats = crit.list();
			if(cats.size()>0)
			    return (CategoryForm)cats.get(0);
		}catch(HibernateException e) {}
        return null;
    }
    
	/**
	 * 查询指定站点的所有日记分类(管理级别的方法)
	 * DlogCategoryAction: doCreateCategory, doMoveDown, doMoveUp
	 * @param ssn
	 * @param site
	 * @return
	 * @throws SQLException
	 * @throws HibernateException
	 */
	public static List listCategories(Session ssn, SiteForm site)
		throws HibernateException {
		Criteria crit = ssn.createCriteria(CategoryForm.class);
		crit = crit.add(Expression.eq("site.id", new Integer(site.getId())));
		crit = crit.addOrder(Order.asc("order"));
		return crit.list();
	}
	/**
	 * 查询某个用户可见的所有日记分类,用于浏览日记而非添加日记
	 * CategoryTag.java   (一般用途)
	 * @param ssn
	 * @param site
	 * @return
	 * @throws SQLException
	 * @throws HibernateException
	 */
	public static List listCategories(Session ssn, SiteForm site, UserForm loginUser)
		throws HibernateException {
		Criteria crit = ssn.createCriteria(CategoryForm.class);
		crit = crit.add(Expression.eq("site.id", new Integer(site.getId())));
		crit = crit.addOrder(Order.asc("order"));
		List cats = crit.list();
		Iterator icats = cats.iterator();
		int role = (loginUser!=null)?loginUser.getUserRole():DlogRole.ROLE_GUEST;
		int[] ncats = (loginUser!=null)?loginUser.getOwnerCatids():new int[0];
		
		while(role!=DlogRole.ROLE_MANAGER && icats.hasNext()){
			CategoryForm cat = (CategoryForm)icats.next();
			if(role==DlogRole.ROLE_BUDDY){
				if(cat.getType()==CategoryForm.TYPE_OWNER){
					int i=0;
					for(;i<ncats.length;i++){
						if(cat.getId()==ncats[i])
							break;
					}
					if(i>=ncats.length)
						icats.remove();
				}
			}
			else{
				if(cat.getType()==CategoryForm.TYPE_OWNER)
					icats.remove();
			}
		}
		return cats;
	}

	/**
	 * 查询某个用户可见的所有日记分类,用于浏览日记而非添加日记
	 * CategoryTag.java   (一般用途)
	 * @param ssn
	 * @param site
	 * @return
	 * @throws SQLException
	 * @throws HibernateException
	 */
	public static List listCategoriesForModify(Session ssn, SiteForm site, UserForm loginUser)
		throws HibernateException {
		Criteria crit = ssn.createCriteria(CategoryForm.class);
		crit = crit.add(Expression.eq("site.id", new Integer(site.getId())));
		crit = crit.addOrder(Order.asc("order"));
		List cats = crit.list();
		Iterator icats = cats.iterator();
		int role = (loginUser!=null)?loginUser.getRole().getId():DlogRole.ROLE_GUEST;
		int[] ncats = (loginUser!=null)?loginUser.getOwnerCatids():new int[0];
		
		while(role!=DlogRole.ROLE_MANAGER && icats.hasNext()){
			CategoryForm cat = (CategoryForm)icats.next();
			if(role==DlogRole.ROLE_BUDDY){
				if(cat.getType()==CategoryForm.TYPE_OWNER){
					int i=0;
					for(;i<ncats.length;i++){
						if(cat.getId()==ncats[i])
							break;
					}
					if(i<ncats.length)
						continue;
				}
				else 
				if(cat.getType()==CategoryForm.TYPE_COMMON)
					continue;
			}
			if(role==DlogRole.ROLE_FRIEND){
				if(cat.getType()==CategoryForm.TYPE_COMMON){
					int i=0;
					for(;i<ncats.length;i++){
						if(cat.getId()==ncats[i])
							break;
					}
					if(i<ncats.length)
						continue;
				}
			}
			icats.remove();
		}
		return cats;
	}
}
