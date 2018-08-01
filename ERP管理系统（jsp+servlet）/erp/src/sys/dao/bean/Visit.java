package sys.dao.bean;

import java.sql.Date;
import java.sql.ResultSet;
import java.text.DateFormat;

import sys.dao.ConnectManager;

public class Visit implements java.io.Serializable
{

	private static final long serialVersionUID = 5527971156159859710L;
	// 拜访ID
	private Integer visitid;
	// 客户ID
	private Integer companyid;
	// 客户
	private Company company = null;
	// 联系人ID
	private Integer linkmanid;
	// 联系人
	private Linkman linkman = null;
	// 业务员ID
	private Integer personnelid;
	// 业务员
	private Personnel personnel = null;
	// 拜访方式
	private String visittype;
	// 拜访时间
	private Date visittime;
	// 拜访内容
	private String visitlog;

	public Integer getCompanyid()
	{
		return companyid;
	}

	public void setCompanyid(Integer companyid)
	{
		this.companyid = companyid;
	}

	public Integer getLinkmanid()
	{
		return linkmanid;
	}

	public void setLinkmanid(Integer linkmanid)
	{
		this.linkmanid = linkmanid;
	}

	public Integer getPersonnelid()
	{
		return personnelid;
	}

	public void setPersonnelid(Integer personnelid)
	{
		this.personnelid = personnelid;
	}

	public Integer getVisitid()
	{
		return visitid;
	}

	public void setVisitid(Integer visitid)
	{
		this.visitid = visitid;
	}

	public String getVisitlog()
	{
		return visitlog;
	}

	public void setVisitlog(String visitlog)
	{
		this.visitlog = visitlog;
	}

	public Date getVisittime()
	{
		return visittime;
	}

	public void setVisittime(Date visittime)
	{
		this.visittime = visittime;
	}

	public String getVisittype()
	{
		return visittype;
	}

	public void setVisittype(String visittype)
	{
		this.visittype = visittype;
	}

	public Company getCompany()
	{
		if (company == null)
		{
			ResultSet rs = null;
			String sql = "select * from company where companyid = " + this.companyid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						company = new Company();
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
		return company;
	}

	public void setCompany(Company company)
	{
		this.company = company;
	}

	public Linkman getLinkman()
	{
		if (linkman == null)
		{
			ResultSet rs = null;
			String sql = "select * from linkman where linkmanid = " + this.linkmanid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						linkman = new Linkman();
						linkman.setLinkmanid(rs.getInt("linkmanid"));
						linkman.setLinkmanname(rs.getString("linkmanname"));
						linkman.setLinkmanemail(rs.getString("linkmanemail"));
						linkman.setLinkmanphone(rs.getString("linkmanphone"));
						linkman.setLinkmanmoblie(rs.getString("linkmanmoblie"));
						linkman.setCompanyid(rs.getInt("companyid"));
						linkman.setJob(rs.getString("job"));
						linkman.setAdddate(rs.getDate("adddate"));
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
		return linkman;
	}

	public void setLinkman(Linkman linkman)
	{
		this.linkman = linkman;
	}

	public Personnel getPersonnel()
	{
		if (this.personnel == null)
		{
			ResultSet rs = null;
			String sql = "select * from personnel where personnelid = " + this.personnelid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						personnel = new Personnel();
						personnel.setPersonnelid(rs.getInt("personnelid"));
						personnel.setRealname(rs.getString("realname"));
						personnel.setDeptid(rs.getInt("deptid"));
						personnel.setPositionid(rs.getInt("positionid"));
						personnel.setJobid(rs.getString("jobid"));
						personnel.setSex(rs.getByte("sex"));
						personnel.setBirthday(rs.getDate("birthday"));
						personnel.setNation(rs.getString("native"));
						personnel.setNation(rs.getString("nation"));
						personnel.setPolity(rs.getString("polity"));
						personnel.setWedlock(rs.getByte("wedlock"));
						personnel.setIdcardno(rs.getString("idcardno"));
						personnel.setIdcardaddress(rs.getString("idcardaddress"));
						personnel.setSocialinsuranceid(rs.getString("socialinsuranceid"));
						personnel.setFinishschool(rs.getString("finishschool"));
						personnel.setSpecialty(rs.getString("specialty"));
						personnel.setAcademic(rs.getString("academic"));
						personnel.setDwelling(rs.getString("dwelling"));
						personnel.setAdddate(rs.getDate("adddate"));
						personnel.setOutdate(rs.getDate("outdate"));
						personnel.setPassdate(rs.getDate("passdate"));
						personnel.setUsername(rs.getString("username"));
						personnel.setPassword(rs.getString("password"));
						personnel.setIslock(rs.getByte("islock"));
						personnel.setA(rs.getInt("A"));
						personnel.setB(rs.getInt("B"));
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
		return personnel;
	}

	public void setPersonnel(Personnel personnel)
	{
		this.personnel = personnel;
	}

	public void insert()
	{
		String sql = "insert into visit (visittype,visittime,linkmanid,personnelid,companyid,visitlog) " + "values ('" + this.visittype + "','" + Date.valueOf(DateFormat.getDateInstance(DateFormat.DEFAULT).format(new java.util.Date())) + "'," + this.linkmanid + "," + this.personnelid + "," + this.companyid + ",'" + this.visitlog + "')";
		ConnectManager cm = ConnectManager.newInstance();
		if (cm.getConnection())
		{
			try
			{
				cm.executeUpdate(sql);
			}
			finally
			{
				cm.close();
			}
		}
	}
}