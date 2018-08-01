package sys.dao.bean;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sys.dao.ConnectManager;

@SuppressWarnings("serial")
public class BillType implements Serializable
{
	//广告位类别的ID
	private int billTypeId;
	//广告位类别的ID
	private String billTypeName;
	//查询是这个类别的广告位
	private List<Bill> bills=null;
	public List<Bill> getBills()
	{
		if (bills == null)
		{
			ResultSet rs = null;
			String sql = "select * from bill where billtype = " + this.billTypeId;
			ConnectManager cm = ConnectManager.newInstance();
			try
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
	public int getBillTypeId()
	{
		return billTypeId;
	}
	public void setBillTypeId(int billTypeId)
	{
		this.billTypeId = billTypeId;
	}
	public String getBillTypeName()
	{
		return billTypeName;
	}
	public void setBillTypeName(String billTypeName)
	{
		this.billTypeName = billTypeName;
	}
}
