package sys.dao.bean;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sys.dao.ConnectManager;

public class District implements java.io.Serializable
{

	private static final long serialVersionUID = 5527971156159859710L;
	//城市ID
	private Integer districtid;
	//所在省份ID
	private Integer superiorid;
	//所在省份
	private District superior = null;
	//城市名
	private String district;
	//子类城市的集合
	private List<District> districts = null;
	//城市里的客户
	private List<Company> companies = null;
	public List<Company> getCompanies()
	{
		if (this.companies==null)
		{
			ResultSet rs = null;
			String sql = "select * from company where districtid = " + this.districtid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						companies = new ArrayList<Company>();
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
							companies.add(company);
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
		return companies;
	}
	public void setCompanies(List<Company> companies)
	{
		this.companies = companies;
	}
	public String getDistrict()
	{
		return district;
	}
	public void setDistrict(String district)
	{
		this.district = district;
	}
	public Integer getDistrictid()
	{
		return districtid;
	}
	public void setDistrictid(Integer districtid)
	{
		this.districtid = districtid;
	}
	public List<District> getDistricts()
	{
		if (this.districts==null)
		{
			ResultSet rs = null;
			String sql = "select * from district where superiorid = " + this.districtid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						districts = new ArrayList<District>();
						do
						{
							District dis = new District();
							dis.setDistrictid(rs.getInt("districtid"));
							dis.setSuperiorid(rs.getInt("superiorid"));
							dis.setDistrict(rs.getString("district"));
							districts.add(dis);
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
		return districts;
	}
	public void setDistricts(List<District> districts)
	{
		this.districts = districts;
	}
	public Integer getSuperiorid()
	{
		return superiorid;
	}
	public void setSuperiorid(Integer superiorid)
	{
		this.superiorid = superiorid;
	}
	public District getSuperior()
	{
		if (this.superior==null)
		{
			ResultSet rs = null;
			String sql = "select * from district where districtid = " + this.superiorid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
							superior = new District();
							superior.setDistrictid(rs.getInt("districtid"));
							superior.setSuperiorid(rs.getInt("superiorid"));
							superior.setDistrict(rs.getString("district"));
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
		return superior;
	}
	public void setSuperior(District superior)
	{
		this.superior = superior;
	}
}