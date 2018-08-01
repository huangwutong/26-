package sys.dao.bean;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;

import sys.dao.ConnectManager;

public class Company implements java.io.Serializable
{
	private static final long serialVersionUID = -4579662514420302269L;
	//公司ID
	private Integer companyid;
	//公司关键字
	private String namekeywords;
	//公司名
	private String nameparticular;
	//所在城市ID
	private Integer districtid;
	//所在城市
	private District district = null;
	//公司地址ַ
	private String companyaddress;
	//公司类型:按业务员拜访分类,一共分A,B,C,D,E
	private String type;
	//公司网址ַ
	private String neturl;
	//公司等级:A无意向,B未拜访,C已拜访,D已签单,E已收费,F大客户
	private String companytype;
	//公司所在库:A库,B库,C库公共库,D服务库
	private String companystate;
	//添加日期
	private Date adddate;
	//加入A库日期
	private Date indate;
	//公司简介
	private String companynarrate;
	//所属业务员ID
	private Integer personnelid;
	//所属业务员
	private Personnel personnel = null;
	//等待接受的业务员ID
	private Integer accepterid;
	//等待接受的业务员
	private Personnel accepter = null;
	//最后拜访日期
	private Date lastvisitdate;
	//拜访次数
	private Integer visitcount;
	//所在行业ID
	private Integer industryid;
	//所在行业
	private Industry industry = null;
	//最后拜访人的ID
	private Integer lastPersonnelid;
	//最后拜访人
	private Personnel lastPersonnel = null;
	//添加人的ID
	private Integer addPersonnelid;
	//添加人
	private Personnel addPersonnel = null;
	//这公司的预定过的记录
	private List<DestineNote> destineNote = null;
	//所有联系人
	private List<Linkman> linkmans = null;
	//所有拜访记录
	private List<Visit> visits = null;
	
	public Integer getAccepterid()
	{
		return accepterid;
	}
	public void setAccepterid(Integer accepterid)
	{
		this.accepterid = accepterid;
	}
	public Date getAdddate()
	{
		return adddate;
	}
	public void setAdddate(Date adddate)
	{
		this.adddate = adddate;
	}
	public String getCompanyaddress()
	{
		return companyaddress;
	}
	public void setCompanyaddress(String companyaddress)
	{
		this.companyaddress = companyaddress;
	}
	public Integer getCompanyid()
	{
		return companyid;
	}
	public void setCompanyid(Integer companyid)
	{
		this.companyid = companyid;
	}
	public String getCompanynarrate()
	{
		return companynarrate;
	}
	public void setCompanynarrate(String companynarrate)
	{
		this.companynarrate = companynarrate;
	}
	public String getCompanystate()
	{
		return companystate;
	}
	public void setCompanystate(String companystate)
	{
		this.companystate = companystate;
	}
	public String getCompanytype()
	{
		return companytype;
	}
	public void setCompanytype(String companytype)
	{
		this.companytype = companytype;
	}
	public Integer getDistrictid()
	{
		return districtid;
	}
	public void setDistrictid(Integer districtid)
	{
		this.districtid = districtid;
	}
	public Date getIndate()
	{
		return indate;
	}
	public void setIndate(Date indate)
	{
		this.indate = indate;
	}
	public Integer getIndustryid()
	{
		return industryid;
	}
	public void setIndustryid(Integer industryid)
	{
		this.industryid = industryid;
	}
	public Integer getLastPersonnelid()
	{
		return lastPersonnelid;
	}
	public void setLastPersonnelid(Integer lastPersonnelid)
	{
		this.lastPersonnelid = lastPersonnelid;
	}
	public Date getLastvisitdate()
	{
		return lastvisitdate;
	}
	public void setLastvisitdate(Date lastvisitdate)
	{
		this.lastvisitdate = lastvisitdate;
	}
	public List<Linkman> getLinkmans()
	{
		if (linkmans==null)
		{
			ResultSet rs = null;
			String sql = "select * from linkman where companyid = " + this.companyid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				rs = cm.executeQuery(sql);
				try
				{
					if (rs.next())
					{
						linkmans = new ArrayList<Linkman>();
						do
						{
							Linkman linkman = new Linkman();
							linkman.setLinkmanid(rs.getInt("linkmanid"));
							linkman.setLinkmanname(rs.getString("linkmanname"));
							linkman.setLinkmanemail(rs.getString("linkmanemail"));
							linkman.setLinkmanphone(rs.getString("linkmanphone"));
							linkman.setLinkmanmoblie(rs.getString("linkmanmoblie"));
							linkman.setCompanyid(rs.getInt("companyid"));
							linkman.setJob(rs.getString("job"));
							linkman.setAdddate(rs.getDate("adddate"));
							linkmans.add(linkman);
						} while (rs.next());
					}
					rs.close();
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
		return linkmans;
	}
	public void setLinkmans(List<Linkman> linkmans)
	{
		this.linkmans = linkmans;
	}
	public String getNamekeywords()
	{
		return namekeywords;
	}
	public void setNamekeywords(String namekeywords)
	{
		this.namekeywords = namekeywords;
	}
	public String getNameparticular()
	{
		return nameparticular;
	}
	public void setNameparticular(String nameparticular)
	{
		this.nameparticular = nameparticular;
	}
	public String getNeturl()
	{
		return neturl;
	}
	public void setNeturl(String neturl)
	{
		this.neturl = neturl;
	}
	public Integer getPersonnelid()
	{
		return personnelid;
	}
	public void setPersonnelid(Integer personnelid)
	{
		this.personnelid = personnelid;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public Integer getVisitcount()
	{
		return visitcount;
	}
	public void setVisitcount(Integer visitcount)
	{
		this.visitcount = visitcount;
	}
	public List<Visit> getVisits()
	{
		if (visits==null)
		{
			ResultSet rs = null;
			String sql = "select * from visit where companyid = " + this.companyid;
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
	public void setDistrict(District district)
	{
		this.district = district;
	}
	public District getDistrict()
	{
		if (this.district==null)
		{
			ResultSet rs = null;
			String sql = "select * from district where districtid = " + this.districtid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						this.district = new District();
						this.district.setDistrictid(rs.getInt("districtid"));
						this.district.setSuperiorid(rs.getInt("superiorid"));
						this.district.setDistrict(rs.getString("district"));
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
		return district;
	}
	public Personnel getAccepter()
	{
		if (this.accepter==null)
		{
			ResultSet rs = null;
			String sql = "select * from personnel where personnelid = " + this.accepterid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						accepter = new Personnel();
						accepter.setPersonnelid(rs.getInt("personnelid"));
						accepter.setRealname(rs.getString("realname"));
						accepter.setDeptid(rs.getInt("deptid"));
						accepter.setPositionid(rs.getInt("positionid"));
						accepter.setJobid(rs.getString("jobid"));
						accepter.setSex(rs.getByte("sex"));
						accepter.setBirthday(rs.getDate("birthday"));
						accepter.setNation(rs.getString("native"));
						accepter.setNation(rs.getString("nation"));
						accepter.setPolity(rs.getString("polity"));
						accepter.setWedlock(rs.getByte("wedlock"));
						accepter.setIdcardno(rs.getString("idcardno"));
						accepter.setIdcardaddress(rs.getString("idcardaddress"));
						accepter.setSocialinsuranceid(rs.getString("socialinsuranceid"));
						accepter.setFinishschool(rs.getString("finishschool"));
						accepter.setSpecialty(rs.getString("specialty"));
						accepter.setAcademic(rs.getString("academic"));
						accepter.setDwelling(rs.getString("dwelling"));
						accepter.setAdddate(rs.getDate("adddate"));
						accepter.setOutdate(rs.getDate("outdate"));
						accepter.setPassdate(rs.getDate("passdate"));
						accepter.setUsername(rs.getString("username"));
						accepter.setPassword(rs.getString("password"));
						accepter.setIslock(rs.getByte("islock"));
						accepter.setA(rs.getInt("A"));
						accepter.setB(rs.getInt("B"));
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
		return accepter;
	}
	public void setAccepter(Personnel accepter)
	{
		this.accepter = accepter;
	}
	public Industry getIndustry()
	{
		if (this.industry==null)
		{
			ResultSet rs = null;
			String sql = "select * from industry where industryid = " + this.industryid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						industry = new Industry();
						industry.setIndustryid(rs.getInt("industryid"));
						industry.setIndustry(rs.getString("industry"));
						industry.setIslock(rs.getByte("islock"));
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
		return industry;
	}
	public void setIndustry(Industry industry)
	{
		this.industry = industry;
	}
	public Personnel getLastPersonnel()
	{
		if (this.lastPersonnel==null)
		{
			ResultSet rs = null;
			String sql = "select * from personnel where personnelid = " + this.lastPersonnelid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						lastPersonnel = new Personnel();
						lastPersonnel.setPersonnelid(rs.getInt("personnelid"));
						lastPersonnel.setRealname(rs.getString("realname"));
						lastPersonnel.setDeptid(rs.getInt("deptid"));
						lastPersonnel.setPositionid(rs.getInt("positionid"));
						lastPersonnel.setJobid(rs.getString("jobid"));
						lastPersonnel.setSex(rs.getByte("sex"));
						lastPersonnel.setBirthday(rs.getDate("birthday"));
						lastPersonnel.setNation(rs.getString("native"));
						lastPersonnel.setNation(rs.getString("nation"));
						lastPersonnel.setPolity(rs.getString("polity"));
						lastPersonnel.setWedlock(rs.getByte("wedlock"));
						lastPersonnel.setIdcardno(rs.getString("idcardno"));
						lastPersonnel.setIdcardaddress(rs.getString("idcardaddress"));
						lastPersonnel.setSocialinsuranceid(rs.getString("socialinsuranceid"));
						lastPersonnel.setFinishschool(rs.getString("finishschool"));
						lastPersonnel.setSpecialty(rs.getString("specialty"));
						lastPersonnel.setAcademic(rs.getString("academic"));
						lastPersonnel.setDwelling(rs.getString("dwelling"));
						lastPersonnel.setAdddate(rs.getDate("adddate"));
						lastPersonnel.setOutdate(rs.getDate("outdate"));
						lastPersonnel.setPassdate(rs.getDate("passdate"));
						lastPersonnel.setUsername(rs.getString("username"));
						lastPersonnel.setPassword(rs.getString("password"));
						lastPersonnel.setIslock(rs.getByte("islock"));
						lastPersonnel.setA(rs.getInt("A"));
						lastPersonnel.setB(rs.getInt("B"));
						lastPersonnel.setBill_con(rs.getInt("bill_con"));
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
		return lastPersonnel;
	}
	public void setLastPersonnel(Personnel lastPersonnel)
	{
		this.lastPersonnel = lastPersonnel;
	}
	public Personnel getPersonnel()
	{
		if (this.personnel==null)
		{
			ResultSet rs = null;
			String sql = "select * from personnel where personnelid = " + this.personnelid;;
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
						personnel.setBill_con(rs.getInt("bill_con"));
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
		String sql = "insert into company (namekeywords,nameparticular,districtid,companyaddress,type," +
					"neturl,companytype,companystate,adddate,indate,companynarrate,personnelid,lastvisitdate," +
					"visitcount,industryid,addPersonnel) " +
					"values ('"+this.namekeywords+"','"+this.nameparticular+"',"+this.districtid+",'"+this.companyaddress+
					"','E','"+this.neturl+"','B','A','"+Date.valueOf(DateFormat.getDateInstance(DateFormat.DEFAULT).format(new java.util.Date()))+
					"','"+Date.valueOf(DateFormat.getDateInstance(DateFormat.DEFAULT).format(new java.util.Date()))+"','"+this.companynarrate+
					"',"+this.personnelid+",null,0,"+this.industryid+","+this.addPersonnelid+")";
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
		String sql = "select * from Company where companyid = (select max(companyid) FROM Company where personnelid = "+this.personnelid+")";
		ConnectManager cm = ConnectManager.newInstance();
		if (cm.getConnection())
		{
			try
			{
				ResultSet rs = cm.executeQuery(sql);
				if (rs.next())
				{
					this.setCompanyid(rs.getInt("companyid"));
					this.setNamekeywords(rs.getString("namekeywords"));
					this.setNameparticular(rs.getString("nameparticular"));
					this.setDistrictid(rs.getInt("districtid"));
					this.setCompanyaddress(rs.getString("companyaddress"));
					this.setType(rs.getString("type"));
					this.setNeturl(rs.getString("neturl"));
					this.setCompanytype(rs.getString("companytype"));
					this.setCompanystate(rs.getString("companystate"));
					this.setAdddate(rs.getDate("adddate"));
					this.setIndate(rs.getDate("indate"));
					this.setCompanynarrate(rs.getString("companynarrate"));
					this.setPersonnelid(rs.getInt("personnelid"));
					this.setAccepterid(rs.getInt("accepterid"));
					this.setLastPersonnelid(rs.getInt("lastPersonnel"));
					this.setLastvisitdate(rs.getDate("lastvisitdate"));
					this.setVisitcount(rs.getInt("visitcount"));
					this.setIndustryid(rs.getInt("industryid"));
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
	public Integer getAddPersonnelid()
	{
		return addPersonnelid;
	}
	public void setAddPersonnelid(Integer addPersonnelid)
	{
		this.addPersonnelid = addPersonnelid;
	}
	public Personnel getAddPersonnel()
	{
		if (this.addPersonnel==null)
		{
			ResultSet rs = null;
			String sql = "select * from personnel where personnelid = " + this.addPersonnelid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						addPersonnel = new Personnel();
						addPersonnel.setPersonnelid(rs.getInt("personnelid"));
						addPersonnel.setRealname(rs.getString("realname"));
						addPersonnel.setDeptid(rs.getInt("deptid"));
						addPersonnel.setPositionid(rs.getInt("positionid"));
						addPersonnel.setJobid(rs.getString("jobid"));
						addPersonnel.setSex(rs.getByte("sex"));
						addPersonnel.setBirthday(rs.getDate("birthday"));
						addPersonnel.setNation(rs.getString("native"));
						addPersonnel.setNation(rs.getString("nation"));
						addPersonnel.setPolity(rs.getString("polity"));
						addPersonnel.setWedlock(rs.getByte("wedlock"));
						addPersonnel.setIdcardno(rs.getString("idcardno"));
						addPersonnel.setIdcardaddress(rs.getString("idcardaddress"));
						addPersonnel.setSocialinsuranceid(rs.getString("socialinsuranceid"));
						addPersonnel.setFinishschool(rs.getString("finishschool"));
						addPersonnel.setSpecialty(rs.getString("specialty"));
						addPersonnel.setAcademic(rs.getString("academic"));
						addPersonnel.setDwelling(rs.getString("dwelling"));
						addPersonnel.setAdddate(rs.getDate("adddate"));
						addPersonnel.setOutdate(rs.getDate("outdate"));
						addPersonnel.setPassdate(rs.getDate("passdate"));
						addPersonnel.setUsername(rs.getString("username"));
						addPersonnel.setPassword(rs.getString("password"));
						addPersonnel.setIslock(rs.getByte("islock"));
						addPersonnel.setA(rs.getInt("A"));
						addPersonnel.setB(rs.getInt("B"));
						addPersonnel.setBill_con(rs.getInt("bill_con"));
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
		return addPersonnel;
	}
	public void setAddPersonnel(Personnel addPersonnel)
	{
		this.addPersonnel = addPersonnel;
	}
	public List<DestineNote> getDestineNote()
	{
		if (this.destineNote==null)
		{
			ResultSet rs = null;
			String sql = "select * from destinenote where companyid = " + this.companyid;
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
}