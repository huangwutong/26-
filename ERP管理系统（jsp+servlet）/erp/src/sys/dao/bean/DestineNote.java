package sys.dao.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import sys.dao.ConnectManager;

@SuppressWarnings("serial")
public class DestineNote implements Serializable
{
	// 广告位订单ID
	private int SpeakForNoteId;
	// 所属广告位ID
	private int billId;
	// 所属广告位
	private Bill bill = null;
	// 所属客户ID
	private int companyId;
	//所属客户
	private Company company = null;
	// 所属业务员ID
	private int personnelId;
	//所属业务员
	private Personnel personnel = null;
	// 预定日期
	private Date destineDate;
	// 续期日期
	private Date postponeDate;
	// 预定时期
	private int destime;
	// 结束状态
	private String ending;
	// 结束原因
	private String whys;
	// 结束时间
	private Date endingDate;

	public int getSpeakForNoteId()
	{
		return SpeakForNoteId;
	}

	public void setSpeakForNoteId(int speakForNoteId)
	{
		SpeakForNoteId = speakForNoteId;
	}

	public int getBillId()
	{
		return billId;
	}

	public void setBillId(int billId)
	{
		this.billId = billId;
	}

	public int getCompanyId()
	{
		return companyId;
	}

	public void setCompanyId(int companyId)
	{
		this.companyId = companyId;
	}

	public int getPersonnelId()
	{
		return personnelId;
	}

	public void setPersonnelId(int personnelId)
	{
		this.personnelId = personnelId;
	}

	public Date getDestineDate()
	{
		return destineDate;
	}

	public void setDestineDate(Date destineDate)
	{
		this.destineDate = destineDate;
	}

	public Date getPostponeDate()
	{
		return postponeDate;
	}

	public void setPostponeDate(Date postponeDate)
	{
		this.postponeDate = postponeDate;
	}

	public int getDestime()
	{
		return destime;
	}

	public void setDestime(int destime)
	{
		this.destime = destime;
	}

	public String getEnding()
	{
		return ending;
	}

	public void setEnding(String ending)
	{
		this.ending = ending;
	}

	public String getWhys()
	{
		return whys;
	}

	public void setWhys(String whys)
	{
		this.whys = whys;
	}

	public Date getEndingDate()
	{
		return endingDate;
	}

	public void setEndingDate(Date endingDate)
	{
		this.endingDate = endingDate;
	}

	public Bill getBill()
	{
		if (bill == null)
		{
			ResultSet rs = null;
			String sql = "select * from bill where billid = " + this.billId;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						Bill bill = new Bill();
						bill.setBillId(rs.getInt("billid"));
						bill.setSortId(rs.getInt("sortid"));
						bill.setBillNo(rs.getString("billno"));
						bill.setBillTypeId(rs.getInt("billtype"));
						bill.setBillPrice(rs.getInt("billprice"));
						bill.setBillState(rs.getString("billstate"));
						bill.setBillBargainMoney(rs.getInt("billbargainmoney"));
						bill.setBillBargainTime(rs.getInt("billbargaintime"));
						bill.setBillRemark(rs.getString("billremark"));
						bill.setPersonnelId(rs.getInt("perid"));
						bill.setCompanyId(rs.getInt("comid"));
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
		return bill;
	}

	public void setBill(Bill bill)
	{
		this.bill = bill;
	}

	public Company getCompany()
	{
		if (this.company==null)
		{
			ResultSet rs = null;
			String sql = "select * from company where companyid = " + this.companyId;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						this.company = new Company();
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
						company.setLastvisitdate(rs.getDate("lastvisitdate"));
						company.setVisitcount(rs.getInt("visitcount"));
						company.setIndustryid(rs.getInt("industryid"));
						company.setLastPersonnelid(rs.getInt("lastPersonnel"));
						company.setAddPersonnelid(rs.getInt("addPersonnel"));
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
		return company;
	}

	public void setCompany(Company company)
	{
		this.company = company;
	}

	public Personnel getPersonnel()
	{
		if (personnel==null)
		{
			ResultSet rs = null;
			String sql = "select * from personnel where personnelid = " + this.personnelId;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
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
		return personnel;
	}

	public void setPersonnel(Personnel personnel)
	{
		this.personnel = personnel;
	}
}
