package sys.dao.bean;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sys.dao.ConnectManager;

public class Personnel implements java.io.Serializable
{

	private static final long serialVersionUID = 5527971156159859710L;
	//员工ID
	private Integer personnelid;
	//部门ID
	private Integer deptid;
	//部门
	private Dept dept = null;
	//职位ID
	private Integer positionid;
	//职位
	private Position position;
	//姓名
	private String realname;
	//工号
	private String jobid;
	//性别,1为男,0为女
	private Byte sex;
	//生日
	private Date birthday;
	//籍贯
	private String pnative;
	//民族
	private String nation;
	//政治面貌
	private String polity;
	//是否已婚:1为是,0为否
	private Byte wedlock;
	//身份证号码
	private String idcardno;
	//身份证地址
	private String idcardaddress;
	//社保卡号
	private String socialinsuranceid;
	//毕业学校
	private String finishschool;
	//专业
	private String specialty;
	//学历
	private String academic;
	//住址ַ
	private String dwelling;
	//入职日期
	private Date adddate;
	//离职日期
	private Date outdate;
	//转正日期
	private Date passdate;
	//系统用户名
	private String username;
	//ϵͳ密码
	private String password;
	//是否已锁定
	private Byte islock;
	//A库客户数
	private Integer A;
	//B库客户数
	private Integer B;
	//所管理的导航网
	private List<Industry> industrys = null;
	//可以预定的广告位
	private Integer bill_con;
	//所有客户
	private List<Company> pcompanies = null;
	//等待接收的客户
	private List<Company> acompanies = null;
	//自己添加的客户
	private List<Company> addcompanies = null;
	//该业务员的预定记录
	private List<DestineNote> destineNote = null;
	public List<Company> getAddcompanies()
	{
		if (this.addcompanies == null)
		{
			ResultSet rs = null;
			String sql = "select * from company where addPersonnel = " + this.personnelid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						acompanies = new ArrayList<Company>();
						do
						{
							Company company = new Company();
							company.setCompanyid(rs.getInt("companyid"));
							company.setNamekeywords(rs.getString("namekeywords"));
							company.setNameparticular(rs.getString("nameparticular"));
							company.setDistrictid(rs.getInt("districtid"));
							company.setCompanyaddress(rs.getString("companyaddress"));
							company.setType(rs.getString("type"));
							company.setNeturl(rs.getString("neturl"));
							company.setCompanytype(rs.getString("companytype"));
							company.setCompanystate(rs.getString("companystate"));
							company.setAdddate(rs.getDate("adddate"));
							company.setIndate(rs.getDate("indate"));
							company.setCompanynarrate(rs.getString("companynarrate"));
							company.setPersonnelid(rs.getInt("personnelid"));
							company.setAccepterid(rs.getInt("accepterid"));
							company.setLastPersonnelid(rs.getInt("lastPersonnel"));
							company.setLastvisitdate(rs.getDate("lastvisitdate"));
							company.setVisitcount(rs.getInt("visitcount"));
							company.setIndustryid(rs.getInt("industryid"));
							company.setAddPersonnelid(rs.getInt("addPersonnel"));
							addcompanies.add(company);
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
		return addcompanies;
	}
	public void setAddcompanies(List<Company> addcompanies)
	{
		this.addcompanies = addcompanies;
	}
	public Integer getA()
	{
		return A;
	}
	public void setA(Integer a)
	{
		A = a;
	}
	public String getAcademic()
	{
		return academic;
	}
	public void setAcademic(String academic)
	{
		this.academic = academic;
	}
	public List<Company> getAcompanies()
	{
		if (this.acompanies == null)
		{
			ResultSet rs = null;
			String sql = "select * from company where accepterid = " + this.personnelid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						acompanies = new ArrayList<Company>();
						do
						{
							Company company = new Company();
							company.setCompanyid(rs.getInt("companyid"));
							company.setNamekeywords(rs.getString("namekeywords"));
							company.setNameparticular(rs.getString("nameparticular"));
							company.setDistrictid(rs.getInt("districtid"));
							company.setCompanyaddress(rs.getString("companyaddress"));
							company.setType(rs.getString("type"));
							company.setNeturl(rs.getString("neturl"));
							company.setCompanytype(rs.getString("companytype"));
							company.setCompanystate(rs.getString("companystate"));
							company.setAdddate(rs.getDate("adddate"));
							company.setIndate(rs.getDate("indate"));
							company.setCompanynarrate(rs.getString("companynarrate"));
							company.setPersonnelid(rs.getInt("personnelid"));
							company.setAccepterid(rs.getInt("accepterid"));
							company.setLastPersonnelid(rs.getInt("lastPersonnel"));
							company.setLastvisitdate(rs.getDate("lastvisitdate"));
							company.setVisitcount(rs.getInt("visitcount"));
							company.setIndustryid(rs.getInt("industryid"));
							company.setAddPersonnelid(rs.getInt("addPersonnel"));
							acompanies.add(company);
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
		return acompanies;
	}
	public void setAcompanies(List<Company> acompanies)
	{
		this.acompanies = acompanies;
	}
	public Date getAdddate()
	{
		return adddate;
	}
	public void setAdddate(Date adddate)
	{
		this.adddate = adddate;
	}
	public Integer getB()
	{
		return B;
	}
	public void setB(Integer b)
	{
		B = b;
	}
	public Date getBirthday()
	{
		return birthday;
	}
	public void setBirthday(Date birthday)
	{
		this.birthday = birthday;
	}
	public Integer getDeptid()
	{
		return deptid;
	}
	public void setDeptid(Integer deptid)
	{
		this.deptid = deptid;
	}
	public String getDwelling()
	{
		return dwelling;
	}
	public void setDwelling(String dwelling)
	{
		this.dwelling = dwelling;
	}
	public String getFinishschool()
	{
		return finishschool;
	}
	public void setFinishschool(String finishschool)
	{
		this.finishschool = finishschool;
	}
	public String getIdcardaddress()
	{
		return idcardaddress;
	}
	public void setIdcardaddress(String idcardaddress)
	{
		this.idcardaddress = idcardaddress;
	}
	public String getIdcardno()
	{
		return idcardno;
	}
	public void setIdcardno(String idcardno)
	{
		this.idcardno = idcardno;
	}
	public Byte getIslock()
	{
		return islock;
	}
	public void setIslock(Byte islock)
	{
		this.islock = islock;
	}
	public String getJobid()
	{
		return jobid;
	}
	public void setJobid(String jobid)
	{
		this.jobid = jobid;
	}
	public String getNation()
	{
		return nation;
	}
	public void setNation(String nation)
	{
		this.nation = nation;
	}
	public Date getOutdate()
	{
		return outdate;
	}
	public void setOutdate(Date outdate)
	{
		this.outdate = outdate;
	}
	public Date getPassdate()
	{
		return passdate;
	}
	public void setPassdate(Date passdate)
	{
		this.passdate = passdate;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public List<Company> getPcompanies()
	{
		if (this.pcompanies == null)
		{
			ResultSet rs = null;
			String sql = "select * from company where personnelid = " + this.personnelid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						pcompanies = new ArrayList<Company>();
						do
						{
							Company company = new Company();
							company.setCompanyid(rs.getInt("companyid"));
							company.setNamekeywords(rs.getString("namekeywords"));
							company.setNameparticular(rs.getString("nameparticular"));
							company.setDistrictid(rs.getInt("districtid"));
							company.setCompanyaddress(rs.getString("companyaddress"));
							company.setType(rs.getString("type"));
							company.setNeturl(rs.getString("neturl"));
							company.setCompanytype(rs.getString("companytype"));
							company.setCompanystate(rs.getString("companystate"));
							company.setAdddate(rs.getDate("adddate"));
							company.setIndate(rs.getDate("indate"));
							company.setCompanynarrate(rs.getString("companynarrate"));
							company.setPersonnelid(rs.getInt("personnelid"));
							company.setAccepterid(rs.getInt("accepterid"));
							company.setLastPersonnelid(rs.getInt("lastPersonnel"));
							company.setLastvisitdate(rs.getDate("lastvisitdate"));
							company.setVisitcount(rs.getInt("visitcount"));
							company.setIndustryid(rs.getInt("industryid"));
							company.setAddPersonnelid(rs.getInt("addPersonnel"));
							pcompanies.add(company);
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
		return pcompanies;
	}
	public void setPcompanies(List<Company> pcompanies)
	{
		this.pcompanies = pcompanies;
	}
	public Integer getPersonnelid()
	{
		return personnelid;
	}
	public void setPersonnelid(Integer personnelid)
	{
		this.personnelid = personnelid;
	}
	public String getPnative()
	{
		return pnative;
	}
	public void setPnative(String pnative)
	{
		this.pnative = pnative;
	}
	public String getPolity()
	{
		return polity;
	}
	public void setPolity(String polity)
	{
		this.polity = polity;
	}
	public Integer getPositionid()
	{
		return positionid;
	}
	public void setPositionid(Integer positionid)
	{
		this.positionid = positionid;
	}
	public String getRealname()
	{
		return realname;
	}
	public void setRealname(String realname)
	{
		this.realname = realname;
	}
	public Byte getSex()
	{
		return sex;
	}
	public void setSex(Byte sex)
	{
		this.sex = sex;
	}
	public String getSocialinsuranceid()
	{
		return socialinsuranceid;
	}
	public void setSocialinsuranceid(String socialinsuranceid)
	{
		this.socialinsuranceid = socialinsuranceid;
	}
	public String getSpecialty()
	{
		return specialty;
	}
	public void setSpecialty(String specialty)
	{
		this.specialty = specialty;
	}
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public Byte getWedlock()
	{
		return wedlock;
	}
	public void setWedlock(Byte wedlock)
	{
		this.wedlock = wedlock;
	}
	public Dept getDept()
	{
		if (this.dept==null)
		{
			ResultSet rs = null;
			String sql = "select * from dept where deptid = " + this.deptid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						this.dept = new Dept();
						dept.setDeptid(rs.getInt("deptid"));
						dept.setGradeid(rs.getInt("gradeid"));
						dept.setDeptname(rs.getString("deptname"));
						dept.setMoneyaim(rs.getInt("moneyaim"));
						dept.setA(rs.getInt("A"));
						dept.setB(rs.getInt("B"));
						dept.setCleartime(rs.getInt("cleartime"));
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
		return dept;
	}
	public void setDept(Dept dept)
	{
		this.dept = dept;
	}
	public Position getPosition()
	{
		if (this.position==null)
		{
			ResultSet rs = null;
			String sql = "select * from position where positionid = " + this.positionid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						this.position = new Position();
						this.position.setPositionid(rs.getInt("positionid"));
						this.position.setJob(rs.getString("job"));
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
		return position;
	}
	public void setPosition(Position position)
	{
		this.position = position;
	}
	public Integer getBill_con()
	{
		return bill_con;
	}
	public void setBill_con(Integer bill_con)
	{
		this.bill_con = bill_con;
	}
	public List<DestineNote> getDestineNote()
	{
		if (this.destineNote==null)
		{
			ResultSet rs = null;
			String sql = "select * from destinenote where personnelid = " + this.personnelid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						destineNote = new ArrayList<DestineNote>();
						do
						{
							DestineNote dn = new DestineNote();
							dn.setSpeakForNoteId(rs.getInt("speakfornoteid"));
							dn.setBillId(rs.getInt("billid"));
							dn.setCompanyId(rs.getInt("companyid"));
							dn.setPersonnelId(rs.getInt("personnelid"));
							dn.setDestineDate(rs.getDate("destinedate"));
							dn.setPostponeDate(rs.getDate("postponedate"));
							dn.setDestime(rs.getInt("destime"));
							dn.setEnding(rs.getString("ending"));
							dn.setWhys(rs.getString("whys"));
							dn.setEndingDate(rs.getDate("endingdate"));
							destineNote.add(dn);
						}
						while (rs.next());
					}
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
				finally
				{

				}
			}
		}
		return destineNote;
	}
	public void setDestineNote(List<DestineNote> destineNote)
	{
		this.destineNote = destineNote;
	}
	public List<Industry> getIndustrys()
	{
		if (this.industrys == null)
		{
			ResultSet rs = null;
			String sql = "select * from industry where personnelid = " + this.personnelid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						this.industrys = new ArrayList<Industry>();
						do
						{
							Industry industry = new Industry();
							industry.setIndustryid(rs.getInt("industryid"));
							industry.setIndustry(rs.getString("industry"));
							industry.setIslock(rs.getByte("islock"));
							industrys.add(industry);
						}
						while (rs.next());
					}
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
				finally
				{
					cm.close();
				}
			}
		}
		return industrys;
	}
	public void setIndustrys(List<Industry> industrys)
	{
		this.industrys = industrys;
	}
}