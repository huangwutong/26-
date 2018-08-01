package sys.dao.bean;

import java.sql.Date;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;

import sys.dao.ConnectManager;

public class Linkman implements java.io.Serializable
{

	private static final long serialVersionUID = 5527971156159859710L;
	//联系人ID
	private Integer linkmanid;
	//公司ID
	private Integer companyid;
	//公司
	private Company company = null;
	//联系人名字
	private String linkmanname;
	//联系人Email
	private String linkmanemail;
	//联系人电话
	private String linkmanphone;
	//联系人手机
	private String linkmanmoblie;
	//联系人职位
	private String job;
	//添加日期
	private Date adddate;
	//拜访记录
	private List<Visit> visits = null;
	public Date getAdddate()
	{
		return adddate;
	}
	public void setAdddate(Date adddate)
	{
		this.adddate = adddate;
	}
	public Integer getCompanyid()
	{
		return companyid;
	}
	public void setCompanyid(Integer companyid)
	{
		this.companyid = companyid;
	}
	public String getJob()
	{
		return job;
	}
	public void setJob(String job)
	{
		this.job = job;
	}
	public String getLinkmanemail()
	{
		return linkmanemail;
	}
	public void setLinkmanemail(String linkmanemail)
	{
		this.linkmanemail = linkmanemail;
	}
	public Integer getLinkmanid()
	{
		return linkmanid;
	}
	public void setLinkmanid(Integer linkmanid)
	{
		this.linkmanid = linkmanid;
	}
	public String getLinkmanmoblie()
	{
		return linkmanmoblie;
	}
	public void setLinkmanmoblie(String linkmanmoblie)
	{
		this.linkmanmoblie = linkmanmoblie;
	}
	public String getLinkmanname()
	{
		return linkmanname;
	}
	public void setLinkmanname(String linkmanname)
	{
		this.linkmanname = linkmanname;
	}
	public String getLinkmanphone()
	{
		return linkmanphone;
	}
	public void setLinkmanphone(String linkmanphone)
	{
		this.linkmanphone = linkmanphone;
	}
	public List<Visit> getVisits()
	{
		if (visits==null)
		{
			ResultSet rs = null;
			String sql = "select * from visit where linkmanid = " + this.linkmanid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						visits = new ArrayList<Visit>();
						do
						{
							Visit visit = new Visit();
							visit.setVisitid(rs.getInt("visitid"));
							visit.setVisittype(rs.getString("visittype"));
							visit.setVisittime(rs.getDate("visittime"));
							visit.setLinkmanid(rs.getInt("linkmanid"));
							visit.setPersonnelid(rs.getInt("personnelid"));
							visit.setCompanyid(rs.getInt("companyid"));
							visit.setVisitlog(rs.getString("visitlog"));
							visits.add(visit);
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
		return visits;
	}
	public void setVisits(List<Visit> visits)
	{
		this.visits = visits;
	}
	public Company getCompany()
	{
		if (company==null)
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
	
	public void insert()
	{
		String sql = "insert into linkman (linkmanname,linkmanemail,linkmanphone,linkmanmoblie," +
					"companyid,job,adddate) values ('"+this.linkmanname+"','"+this.linkmanemail+
					"','"+this.getLinkmanphone()+"','"+this.getLinkmanmoblie()+"',"+this.getCompanyid()+
					",'"+this.getJob()+"','"+ Date.valueOf(DateFormat.getDateInstance(DateFormat.DEFAULT).format(new java.util.Date())) +"')";
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
	public void getnew()
	{
		String sql = "select * from linkman where linkmanid = (select max(linkmanid) from linkman where companyid = "+this.companyid+")";
		ConnectManager cm = ConnectManager.newInstance();
		if (cm.getConnection())
		{
			try
			{
				ResultSet rs = cm.executeQuery(sql);
				if (rs.next())
				{
					this.setLinkmanid(rs.getInt("linkmanid"));
					this.setLinkmanname(rs.getString("linkmanname"));
					this.setLinkmanemail(rs.getString("linkmanemail"));
					this.setLinkmanphone(rs.getString("linkmanphone"));
					this.setLinkmanmoblie(rs.getString("linkmanmoblie"));
					this.setCompanyid(rs.getInt("companyid"));
					this.setJob(rs.getString("job"));
					this.setAdddate(rs.getDate("adddate"));
				}
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
}