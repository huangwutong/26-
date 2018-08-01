package sys.dao.bean;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sys.dao.ConnectManager;

@SuppressWarnings("serial")
public class Bill implements Serializable
{
	// 广告位ID
	private int billId;
	// 所属子页面的ID
	private int sortId;
	// 所属子页面
	private Sort sort = null;
	// 广告位的编号
	private String billNo;
	// 广告位的类型
	private int billTypeId;
	// 广告位的类型
	private BillType billType = null;
	// 广告位报价,每月多少钱
	private int billPrice;
	// 广告位状态,已售出,闲置,已预定
	private String billState;
	// 广告位卖出的总价格
	private int billBargainMoney;
	// 广告位卖出的时间,以月为单位
	private int billBargainTime;
	// 广告位说明
	private String billRemark;
	// 预定或出售这个广告位的业务员ID
	private int personnelId;
	// 预定或出售这个广告位的业务员类
	private Personnel personnel = null;
	// 预定或出售这个广告位的客户ID
	private int companyId;
	// 预定或出售这个广告位的客户
	private Company company = null;
	// 这个广告位的预定记录
	private List<DestineNote> destineNote = null;

	public Company getCompany()
	{
		if (this.company == null)
		{
			if (this.companyId != 0)
			{

				ResultSet rs = null;
				String sql = "select * from sort where sortid = " + this.sortId;
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
							company.setLastvisitdate(rs.getDate("lastvisitdate"));
							company.setVisitcount(rs.getInt("visitcount"));
							company.setIndustryid(rs.getInt("industryid"));
							company.setLastPersonnelid(rs.getInt("lastPersonnel"));
							company.setAddPersonnelid(rs.getInt("addPersonnel"));
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
		}
		return company;
	}

	public void setCompany(Company company)
	{
		this.company = company;
	}

	public int getBillId()
	{
		return billId;
	}

	public void setBillId(int billId)
	{
		this.billId = billId;
	}

	public int getSortId()
	{
		return sortId;
	}

	public void setSortId(int sortId)
	{
		this.sortId = sortId;
	}

	public String getBillNo()
	{
		return billNo;
	}

	public void setBillNo(String billNo)
	{
		this.billNo = billNo;
	}

	public int getBillTypeId()
	{
		return billTypeId;
	}

	public void setBillTypeId(int billTypeId)
	{
		this.billTypeId = billTypeId;
	}

	public int getBillPrice()
	{
		return billPrice;
	}

	public void setBillPrice(int billPrice)
	{
		this.billPrice = billPrice;
	}

	public String getBillState()
	{
		return billState;
	}

	public void setBillState(String billState)
	{
		this.billState = billState;
	}

	public int getBillBargainMoney()
	{
		return billBargainMoney;
	}

	public void setBillBargainMoney(int billBargainMoney)
	{
		this.billBargainMoney = billBargainMoney;
	}

	public int getBillBargainTime()
	{
		return billBargainTime;
	}

	public void setBillBargainTime(int billBargainTime)
	{
		this.billBargainTime = billBargainTime;
	}

	public String getBillRemark()
	{
		return billRemark;
	}

	public void setBillRemark(String billRemark)
	{
		this.billRemark = billRemark;
	}

	public int getPersonnelId()
	{
		return personnelId;
	}

	public void setPersonnelId(int personnelId)
	{
		this.personnelId = personnelId;
	}

	public int getCompanyId()
	{
		return companyId;
	}

	public void setCompanyId(int companyId)
	{
		this.companyId = companyId;
	}

	public Sort getSort()
	{
		if (this.sort == null)
		{
			ResultSet rs = null;
			String sql = "select * from sort where sortid = " + this.sortId;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						sort = new Sort();
						sort.setSortId(rs.getInt("sortid"));
						sort.setIndustryId(rs.getInt("industryid"));
						sort.setSortName(rs.getString("sortname"));
						sort.setUrl(rs.getString("url"));
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
		return sort;
	}

	public void setSort(Sort sort)
	{
		this.sort = sort;
	}

	public Personnel getPersonnel()
	{
		if (this.personnel == null)
		{
			if (this.personnelId != 0)
			{
				ResultSet rs = null;
				String sql = "select * from personnel where personnel = " + this.personnelId;
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
							personnel.setPnative(rs.getString("native"));
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
						cm.close();
					}
				}
			}
		}
		return personnel;
	}

	public void setPersonnel(Personnel personnel)
	{
		this.personnel = personnel;
	}

	public List<DestineNote> getDestineNote()
	{
		if (this.destineNote == null)
		{
			ResultSet rs = null;
			String sql = "select * from destinenote where billid = " + this.billId;
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

	public BillType getBillType()
	{
		if (this.billType == null)
		{
			ResultSet rs = null;
			String sql = "select * from billtype where billtypeid = " + this.billTypeId;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						billType = new BillType();
						billType.setBillTypeId(rs.getInt("billtypeid"));
						billType.setBillTypeName(rs.getString("billtypename"));
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
		return billType;
	}

	public void setBillType(BillType billType)
	{
		this.billType = billType;
	}
}
