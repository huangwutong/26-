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
package dlog4j.security;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Vector;

import org.apache.commons.digester.Digester;
import org.apache.commons.digester.ExtendedBaseRules;
import org.xml.sax.SAXException;

import web.security.Operation;
import web.security.Privilege;
import web.security.Range;
import web.security.Resource;
import web.security.Role;
import web.security.impl.OperationImpl;
import web.security.impl.PrivilegeImpl;
import web.security.impl.RangeImpl;
import web.security.impl.ResourceImpl;

/**
 * DLOG4j的安全配置信息
 * 该类对应security.xml中的信息
 * @author Winter Lau
 */
public class SecurityConfig {
	
	public final static String root = "web-security";
	//单件模式-Singleton
	private static SecurityConfig config;
	
	static{
        Digester dig = new Digester();
        dig.setValidating(false);
        dig.setRules(new ExtendedBaseRules());

        dig.addObjectCreate(root, SecurityConfig.class);
        dig.addSetProperties(root);
        
        //Ranges
        String key_range = root+"/ranges/range";
        dig.addObjectCreate(key_range, "type", RangeImpl.class);
        dig.addSetProperties(key_range);
        dig.addBeanPropertySetter(key_range + "/?");
        dig.addSetNext(key_range, "addRange");

        //Operations
        String key_opt = root+"/operations/operation";
        dig.addObjectCreate(key_opt, "type", OperationImpl.class);
        dig.addSetProperties(key_opt);
        dig.addBeanPropertySetter(key_opt + "/?");
        dig.addSetNext(key_opt, "addOperation");

        //Resources
        String key_res = root+"/resources/resource";
        dig.addObjectCreate(key_res, "type", ResourceImpl.class);
        dig.addSetProperties(key_res);
        dig.addBeanPropertySetter(key_res + "/?");
        dig.addSetNext(key_res, "addResource");        
        
        InputStream in = SecurityConfig.class.getResourceAsStream("/security.xml");
        try{
        	config = (SecurityConfig) dig.parse(in);
        }catch(Exception e){
        	System.err.println("Initialized security.xml failed.");
        	e.printStackTrace(System.err);
        }finally{
        	try{
        		in.close();
        	}catch(Exception e){}
        }
        
	}
	
	private List resources;
	private List operations;
	private List ranges;
	private List roles;
	
	/**
	 * 由于该方法是提供给Digester调用，因此必须是public
	 */
	public SecurityConfig() {
		resources = new Vector();
		operations = new Vector();
		ranges = new Vector();
		roles = new Vector();
	}
	
	public Range getRangeByName(String name){
		for(int i=0;i<ranges.size();i++){
			Range range = (Range)ranges.get(i);
			if(range.getName().equals(name))
				return range;
		}
		return null;
	}
	
	public Operation getOperationByName(String name){
		for(int i=0;i<operations.size();i++){
			Operation opt = (Operation)operations.get(i);
			if(opt.getName().equals(name))
				return opt;
		}
		return null;
	}
	
	public Resource getResourceByName(String name){
		for(int i=0;i<resources.size();i++){
			Resource res = (Resource)resources.get(i);
			if(res.getName().equals(name))
				return res;
		}
		return null;
	}
	
	/**
	 * 根据编号获取对应的角色信息
	 * @param id
	 * @return
	 */
	public DlogRole getRoleById(int id){
		for(int i=0;i<getRoles().size();i++){
			DlogRole role = (DlogRole)roles.get(i);
			if(role.getId()==id)
				return role;
		}
		return null;
	}
	
	/**
	 * 该方法是提供给Digester使用，请不要使用该方法
	 * @param range
	 */
	public void addRange(Range range){
		ranges.add(range);
	}
	
	/**
	 * 该方法是提供给Digester使用，请不要使用该方法
	 * @param opt
	 */
	public void addOperation(Operation opt){
		operations.add(opt);
	}
	
	/**
	 * 该方法是提供给Digester使用，请不要使用该方法
	 * @param res
	 */
	public void addResource(Resource res){
		resources.add(res);
	}
	
	/**
	 * 该方法是提供给Digester使用，请不要使用该方法
	 * @param role
	 */
	public void addRole(Role role){
		roles.add(role);
	}

	/**
	 * 用于获取安全配置信息的实例
	 * SecurityConfig config = SecurityConfig.getConfig();
	 * @return
	 * @throws IOException
	 * @throws SAXException
	 */
	public static SecurityConfig getConfig() throws IOException, SAXException{
		return config;
	}
	
	public List getOperations() {
		return operations;
	}
	public List getRanges() {
		return ranges;
	}
	public List getResources() {
		return resources;
	}
	public List getRoles() {
		if(roles.size()==0){
	        Digester dig = new Digester();
	        dig.setValidating(false);
	        dig.setRules(new ExtendedBaseRules());

	        dig.addObjectCreate(root, SecurityConfig.class);
	        dig.addSetProperties(root);
	        
	        //Roles
	        String key_role = root+"/roles/role";
	        dig.addObjectCreate(key_role, "type", DlogRole.class);
	        dig.addSetProperties(key_role);
	        //privilege
	        String key_pvg = key_role + "/privileges/privilege";
	        dig.addCallMethod(key_pvg, "addPrivilege", 3);
	        dig.addCallParam(key_pvg+"/resource",0);
	        dig.addCallParam(key_pvg+"/operation",1);
	        dig.addCallParam(key_pvg+"/range",2);  
	        dig.addSetNext(key_role, "addRole");  

	        InputStream in = SecurityConfig.class.getResourceAsStream("/security.xml");
	        try{
	        	SecurityConfig config2 = (SecurityConfig) dig.parse(in);
	        	config.roles.addAll(config2.getRoles());
	        }catch(Exception e){
	        	System.err.println("Initialized security.xml failed.");
	        	e.printStackTrace(System.err);
	        }finally{
	        	try{
	        		in.close();
	        	}catch(Exception e){}
	        }
		}
		return roles;
	}
	
	public static void main(String[] args) throws IOException, SAXException{
		SecurityConfig config = SecurityConfig.getConfig();
		Role guest = config.getRoleById(DlogRole.ROLE_GUEST);
		Role user = config.getRoleById(DlogRole.ROLE_COMMON);
		Role friend = config.getRoleById(DlogRole.ROLE_FRIEND);
		Role buddy = config.getRoleById(DlogRole.ROLE_BUDDY);
		Role manager = config.getRoleById(DlogRole.ROLE_MANAGER);
		/*
		System.out.println("manager.pvg.count="+manager.privileges().length);
		for(int i=0;i<manager.privileges().length;i++){
			System.out.println("manager.pvg["+i+"].resource="+manager.privileges()[i].getResource());
			System.out.println("manager.pvg["+i+"].operation="+manager.privileges()[i].getOperation());
			System.out.println("manager.pvg["+i+"].range="+manager.privileges()[i].getRange());
		}*/
		
		Resource res = config.getResourceByName("log");
		Operation opt = config.getOperationByName("maintain");
		Range range = config.getRangeByName("all");
		
		Privilege pvg = new PrivilegeImpl(res,opt,range);
		
		System.out.println("guest cando: "+guest.canDo(pvg));
		System.out.println("user cando: "+user.canDo(pvg));
		System.out.println("friend cando: "+friend.canDo(pvg));
		System.out.println("buddy cando: "+buddy.canDo(pvg));
		System.out.println("manager cando: "+manager.canDo(pvg));
		
		
		/*
		if(config==null)
			return;
		for(int i=0;i<config.getRanges().size();i++)
			System.out.println(config.getRanges().get(i)+" ===== "+config.getRanges().get(i).getClass().getName());
		for(int i=0;i<config.getOperations().size();i++)
			System.out.println(config.getOperations().get(i)+" ===== "+config.getOperations().get(i).getClass().getName());
		for(int i=0;i<config.getResources().size();i++)
			System.out.println(config.getResources().get(i)+" ===== "+config.getResources().get(i).getClass().getName());
		for(int i=0;i<config.getRoles().size();i++)
			System.out.println(config.getRoles().get(i)+" ===== "+config.getRoles().get(i).getClass().getName());
		*/
	}
	
}
