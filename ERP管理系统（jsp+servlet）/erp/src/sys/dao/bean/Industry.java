package sys.dao.bean;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sys.dao.ConnectManager;


public class Industry implements java.io.Serializable
{

	private static final long serialVersionUID = 5527971156159859710L;
	//行业ID
	private Integer industryid;
	//行业
	private String industry;
	//是否公开
	private Byte islock;
	//所属员工ID
	private Integer personnelid;
	//所属员工
	private Personnel personnel = null;
	//该行业的客户
	private List<Company> companies = null;
	//该导行网的子页面
	private List<Sort> sorts = null;
	public List<Company> getCompanies()
	{
		if (this.companies==null)
		{
			ResultSet rs = null;
			String sql = "select * from company where industryid = " + this.industryid;
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
	public String getIndustry()
	{
		return industry;
	}
	public void setIndustry(String industry)
	{
		this.industry = industry;
	}
	public Integer getIndustryid()
	{
		return industryid;
	}
	public void setIndustryid(Integer industryid)
	{
		this.industryid = industryid;
	}
	public Byte getIslock()
	{
		return islock;
	}
	public void setIslock(Byte islock)
	{
		this.islock = islock;
	}
	public List<Sort> getSorts()
	{
		if (sorts==null)
		{
			ResultSet rs = null;
			String sql = "select * from sort where industryid = " + this.industryid;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						sorts = new ArrayList<Sort>();
						do
						{
							Sort sort = new Sort();
							sort.setIndustryId(this.industryid);
							sort.setSortId(rs.getInt("sortid"));
							sort.setSortName(rs.getString("sortname"));
							sort.setUrl(rs.getString("url"));
							sorts.add(sort);
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
		return sorts;
	}
	public void setSorts(List<Sort> sorts)
	{
		this.sorts = sorts;
	}
	public Integer getPersonnelid()
	{
		return personnelid;
	}
	public void setPersonnelid(Integer personnelid)
	{
		this.personnelid = personnelid;
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
}