package sys.dao.bean;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sys.dao.ConnectManager;

@SuppressWarnings("serial")
public class Sort implements Serializable
{
	// 子页面ID
	private int sortId;
	// 所在导航网ID
	private int industryId;
	// 所在的导航网的类
	private Industry industry = null;
	// 子页面中文路径
	private String sortName;
	// 子页面的图片保存地址
	private String url;
	// 在这个子页内的广告位
	private List<Bill> bills = null;

	public List<Bill> getBills()
	{
		if (bills == null)
		{
			ResultSet rs = null;
			String sql = "select * from bill where sortid = " + this.sortId;
			ConnectManager cm = ConnectManager.newInstance();
			try
			{
				if (cm.getConnection())
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						bills = new ArrayList<Bill>();
						do
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
							bills.add(bill);
						}
						while (rs.next());
					}
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
		return bills;
	}

	public void setBills(List<Bill> bills)
	{
		this.bills = bills;
	}

	public int getSortId()
	{
		return sortId;
	}

	public void setSortId(int sortId)
	{
		this.sortId = sortId;
	}

	public int getIndustryId()
	{
		return industryId;
	}

	public void setIndustryId(int industryId)
	{
		this.industryId = industryId;
	}

	public String getSortName()
	{
		return sortName;
	}

	public void setSortName(String sortName)
	{
		this.sortName = sortName;
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public Industry getIndustry()
	{
		if (this.industry == null)
		{
			ResultSet rs = null;
			String sql = "select * from industry where industryid = " + this.industryId;
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
						industry.setPersonnelid(rs.getInt("personnelid"));
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
		return industry;
	}

	public void setIndustry(Industry industry)
	{
		this.industry = industry;
	}
}
