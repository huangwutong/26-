package sys.dao.bean;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sys.dao.ConnectManager;

public class Dept implements java.io.Serializable
{
	private static final long serialVersionUID = 5527971156159859710L;
	//部门ID
	private Integer deptid;
	//上级部门ID
	private Integer gradeid;
	//上级部门
	private Dept grade = null;
	//部门名
	private String deptname;
	//部门的目标
	private Integer moneyaim;
	//部门的A库初始客户数
	private Integer A;
	//部门的B库初始客户数
	private Integer B;
	//部门内可以预定的广告数
	private Integer bill_con;
	//清除时间
	private Integer cleartime;
	//该部门的所有员工
	private List<Personnel> personnels = null;
	//该部门的下级部门
	private List<Dept> depts = null;
	
	public Integer getA()
	{
		return A;
	}
	public void setA(Integer a)
	{
		A = a;
	}
	public Integer getB()
	{
		return B;
	}
	public void setB(Integer b)
	{
		B = b;
	}
	public Integer getCleartime()
	{
		return cleartime;
	}
	public void setCleartime(Integer cleartime)
	{
		this.cleartime = cleartime;
	}
	public Integer getDeptid()
	{
		return deptid;
	}
	public void setDeptid(Integer deptid)
	{
		this.deptid = deptid;
	}
	public String getDeptname()
	{
		return deptname;
	}
	public void setDeptname(String deptname)
	{
		this.deptname = deptname;
	}
	public List<Dept> getDepts()
	{
		if (this.depts==null)
		{
			ResultSet rs = null;
			String sql = "select * from dept where gradeid = " + this.deptid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						depts = new ArrayList<Dept>();
						do
						{
							Dept dept = new Dept();
							dept.setDeptid(rs.getInt("deptid"));
							dept.setGradeid(rs.getInt("gradeid"));
							dept.setDeptname(rs.getString("deptname"));
							dept.setMoneyaim(rs.getInt("moneyaim"));
							dept.setA(rs.getInt("A"));
							dept.setB(rs.getInt("B"));
							dept.setCleartime(rs.getInt("cleartime"));
							depts.add(dept);
						} while (rs.next());
					}
					rs.close();
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
				finally
				{
					cm.close();
				}
			}
		}
		return depts;
	}
	public void setDepts(List<Dept> depts)
	{
		this.depts = depts;
	}
	public Integer getGradeid()
	{
		return gradeid;
	}
	public void setGradeid(Integer gradeid)
	{
		this.gradeid = gradeid;
	}
	public Integer getMoneyaim()
	{
		return moneyaim;
	}
	public void setMoneyaim(Integer moneyaim)
	{
		this.moneyaim = moneyaim;
	}
	public List<Personnel> getPersonnels()
	{
		if (this.personnels==null)
		{
			ResultSet rs = null;
			String sql = "select * from personnel where deptid = " + this.deptid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						personnels = new ArrayList<Personnel>();
						do
						{
							Personnel per = new Personnel();
							per = new Personnel();
							per.setPersonnelid(rs.getInt("personnelid"));
							per.setRealname(rs.getString("realname"));
							per.setDeptid(rs.getInt("deptid"));
							per.setPositionid(rs.getInt("positionid"));
							per.setJobid(rs.getString("jobid"));
							per.setSex(rs.getByte("sex"));
							per.setBirthday(rs.getDate("birthday"));
							per.setNation(rs.getString("native"));
							per.setNation(rs.getString("nation"));
							per.setPolity(rs.getString("polity"));
							per.setWedlock(rs.getByte("wedlock"));
							per.setIdcardno(rs.getString("idcardno"));
							per.setIdcardaddress(rs.getString("idcardaddress"));
							per.setSocialinsuranceid(rs.getString("socialinsuranceid"));
							per.setFinishschool(rs.getString("finishschool"));
							per.setSpecialty(rs.getString("specialty"));
							per.setAcademic(rs.getString("academic"));
							per.setDwelling(rs.getString("dwelling"));
							per.setAdddate(rs.getDate("adddate"));
							per.setOutdate(rs.getDate("outdate"));
							per.setPassdate(rs.getDate("passdate"));
							per.setUsername(rs.getString("username"));
							per.setPassword(rs.getString("password"));
							per.setIslock(rs.getByte("islock"));
							per.setA(rs.getInt("A"));
							per.setB(rs.getInt("B"));
							personnels.add(per);
						} while (rs.next());
					}
					rs.close();
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
				finally
				{
					cm.close();
				}
			}
		}
		return personnels;
	}
	public void setPersonnels(List<Personnel> personnels)
	{
		this.personnels = personnels;
	}
	public Dept getGrade()
	{
		if (this.grade==null)
		{
			ResultSet rs = null;
			String sql = "select * from dept where deptid = " + this.gradeid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						this.grade = new Dept();
						grade.setDeptid(rs.getInt("deptid"));
						grade.setGradeid(rs.getInt("gradeid"));
						grade.setDeptname(rs.getString("deptname"));
						grade.setMoneyaim(rs.getInt("moneyaim"));
						grade.setA(rs.getInt("A"));
						grade.setB(rs.getInt("B"));
						grade.setCleartime(rs.getInt("cleartime"));
					}
					rs.close();
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
				finally
				{
					cm.close();
				}
			}
		}
		return grade;
	}
	public void setGrade(Dept grade)
	{
		this.grade = grade;
	}
	public Integer getBill_con()
	{
		return bill_con;
	}
	public void setBill_con(Integer bill_con)
	{
		this.bill_con = bill_con;
	}
}