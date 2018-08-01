package crm.manager;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import sys.dao.ConnectManager;
import sys.dao.bean.Company;
import sys.dao.bean.Linkman;
import sys.dao.bean.Personnel;

public class Export extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 查询客户
	@SuppressWarnings({
			"deprecation", "unchecked"
	})
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String personnelid = request.getSession().getAttribute("personnelid").toString();;
		Integer stype = null;
		if (request.getSession().getAttribute("stype")!=null)
		{
			stype = Integer.valueOf(request.getSession().getAttribute("stype").toString());
		}
		String content = request.getSession().getAttribute("content").toString();
		String industry = request.getSession().getAttribute("industry").toString();
		String state = request.getSession().getAttribute("state").toString();
		String type = request.getSession().getAttribute("type").toString();
		String gotime = request.getSession().getAttribute("gotime").toString();
		String endtime = request.getSession().getAttribute("endtime").toString();
		String str = "";
		if (!"".equals(personnelid))
		{
			str = str + " personnelid = " + personnelid;
		}
		else
		{
			str = str + " personnelid in (select personnelid from personnel where outdate is null and deptid = "+((Personnel)request.getSession().getAttribute("user")).getDeptid()+")";
		}
		if (!"".equals(state))
		{
			str = str + " and companystate = '" + state+"'";
		}
		if (!"".equals(type))
		{
			str = str + " and type = '" + type+"'";
		}
		if (!("".equals(gotime)&&"".equals(endtime)))
		{
			str = str + " and adddate in (select adddate from company where adddate >= '"+gotime+"' and adddate <= '"+endtime+"')";
		}
		if (!"".equals(content))
		{
			switch (stype)
			{
				case 1:
					str += " and nameparticular like '%" + content + "%'";
					break;
				case 2:
					str += " and companyaddress like '%" + content + "%'";
					break;
				case 3:
					str += " and companyid = (select companyid from linkman where linkmanmoblie = '" + content + "')";
					break;
				case 4:
					str += " and companyid = (select companyid from linkman where linkmanphone = '" + content + "')";
					break;
				default:
					str += " and companyid = (select companyid from linkman where linkmanemail = '" + content + "')";
					break;
			}
		}
		if (!"".equals(industry))
		{
			str = str + " and industryid = " + Integer.valueOf(industry);
		}
		ConnectManager cm = ConnectManager.newInstance();
		List<Company> companies = null;
		try
		{
			String sql = "select * from company where " + str + " order by adddate desc";
			if (cm.getConnection())
			{
				ResultSet rs = cm.executeQuery(sql);
				try
				{
					
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
							companies.add(company);
						} while (rs.next());
					}
					rs.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
		}
		finally
		{
			cm.close();
		}
		//清空response
		response.reset();
		//设置响应为下载
		response.setContentType("application/x-rar-compressed");
		//设置保存时显示的对话框
		response.setHeader("Content-Disposition", "attachment; filename=\"data.xls\"");
		
		//创建新的Excel 工作簿
		HSSFWorkbook workbook = new HSSFWorkbook();
		
		//设置字体样式
		HSSFFont h = workbook.createFont();
		//设为宋体
        h.setFontName("宋体");
        //设字体的大小
        h.setFontHeight((short)200);
        //封装到单元格样式
        HSSFCellStyle style = workbook.createCellStyle();
        //封装
        style.setFont(h);
        
		//创建一个工作表
		HSSFSheet sheet = workbook.createSheet();
		//设置列宽
        sheet.setColumnWidth((short) 0, (short) (400*3));
        sheet.setColumnWidth((short) 1, (short) (400*15));
        sheet.setColumnWidth((short) 2, (short) (400*20));
        sheet.setColumnWidth((short) 3, (short) (400*5));
        sheet.setColumnWidth((short) 4, (short) (400*10));
        sheet.setColumnWidth((short) 5, (short) (400*13));
        sheet.setColumnWidth((short) 6, (short) (400*8));
        sheet.setColumnWidth((short) 7, (short) (400*4));
        
		//创建行索引从0开始
		HSSFRow row = sheet.createRow(0);
		//设置行高
		row.setHeight((short)(20*12.75));
		
		//在行里建单元格
		HSSFCell cell = row.createCell((short)0);
		//定义单元格为字符串类型
		cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		//定义这个单元格的样式
		cell.setCellStyle(style);
		cell.setCellValue("ID");
		
		//在行里建单元格
		HSSFCell cell1 = row.createCell((short)1);
		//定义单元格为字符串类型
		cell1.setCellType(HSSFCell.CELL_TYPE_STRING);
		//定义这个单元格的样式
		cell1.setCellStyle(style);
		//输入单元格内空
		cell1.setCellValue("公司名");
		
		//在行里建单元格
		HSSFCell cell2 = row.createCell((short)2);
		//定义单元格为字符串类型
		cell2.setCellType(HSSFCell.CELL_TYPE_STRING);
		//定义这个单元格的样式
		cell2.setCellStyle(style);
		//输入单元格内空
		cell2.setCellValue("地址");
		
		//在行里建单元格
		HSSFCell cell3 = row.createCell((short)3);
		//定义单元格为字符串类型
		cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
		//定义这个单元格的样式
		cell3.setCellStyle(style);
		//输入单元格内空
		cell3.setCellValue("联系人");
		
		//在行里建单元格
		HSSFCell cell4 = row.createCell((short)4);
		//定义单元格为字符串类型
		cell4.setCellType(HSSFCell.CELL_TYPE_STRING);
		//定义这个单元格的样式
		cell4.setCellStyle(style);
		//输入单元格内空
		cell4.setCellValue("联系电话");
		
		//在行里建单元格
		HSSFCell cell5 = row.createCell((short)5);
		//定义单元格为字符串类型
		cell5.setCellType(HSSFCell.CELL_TYPE_STRING);
		//定义这个单元格的样式
		cell5.setCellStyle(style);
		//输入单元格内空
		cell5.setCellValue("手机");
		
		//在行里建单元格
		HSSFCell cell6 = row.createCell((short)6);
		//定义单元格为字符串类型
		cell6.setCellType(HSSFCell.CELL_TYPE_STRING);
		//定义这个单元格的样式
		cell6.setCellStyle(style);
		//输入单元格内空
		cell6.setCellValue("最后拜访日期");
		
		//在行里建单元格
		HSSFCell cell7 = row.createCell((short)7);
		//定义单元格为字符串类型
		cell7.setCellType(HSSFCell.CELL_TYPE_STRING);
		//定义这个单元格的样式
		cell7.setCellStyle(style);
		//输入单元格内空
		cell7.setCellValue("备注");
		int i = 1;
		for (Company com : companies)
		{
			//创建行索引从0开始
			row = sheet.createRow(i);
			//设置行高
			row.setHeight((short)(20*12.75));
			
			//在行里建单元格
			cell = row.createCell((short)0);
			//定义单元格为字符串类型
			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
			//定义这个单元格的样式
			cell.setCellStyle(style);
			cell.setCellValue(i);
			
			//在行里建单元格
			cell1 = row.createCell((short)1);
			//定义单元格为字符串类型
			cell1.setCellType(HSSFCell.CELL_TYPE_STRING);
			//定义这个单元格的样式
			cell1.setCellStyle(style);
			//输入单元格内空
			cell1.setCellValue(com.getNameparticular());
			
			//在行里建单元格
			cell2 = row.createCell((short)2);
			//定义单元格为字符串类型
			cell2.setCellType(HSSFCell.CELL_TYPE_STRING);
			//定义这个单元格的样式
			cell2.setCellStyle(style);
			//输入单元格内空
			cell2.setCellValue(com.getCompanyaddress());
			
			List<Linkman> ls = com.getLinkmans();
			if (ls!=null)
			{
				if (ls.size()>1)
				{
					boolean p = true;
					for (Linkman linkman : ls)
					{
						if (linkman.getJob().indexOf("董事") >= 0)
						{
							p = false;
							//在行里建单元格
							cell3 = row.createCell((short)3);
							//定义单元格为字符串类型
							cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
							//定义这个单元格的样式
							cell3.setCellStyle(style);
							//输入单元格内空
							cell3.setCellValue(linkman.getLinkmanname());
							
							//在行里建单元格
							cell4 = row.createCell((short)4);
							//定义单元格为字符串类型
							cell4.setCellType(HSSFCell.CELL_TYPE_STRING);
							//定义这个单元格的样式
							cell4.setCellStyle(style);
							//输入单元格内空
							cell4.setCellValue(linkman.getLinkmanphone());
							
							//在行里建单元格
							cell5 = row.createCell((short)5);
							//定义单元格为字符串类型
							cell5.setCellType(HSSFCell.CELL_TYPE_STRING);
							//定义这个单元格的样式
							cell5.setCellStyle(style);
							//输入单元格内空
							cell5.setCellValue(linkman.getLinkmanmoblie());
							break;
						}
						else if(linkman.getJob().indexOf("总经理") >= 0)
						{
							p = false;
							//在行里建单元格
							cell3 = row.createCell((short)3);
							//定义单元格为字符串类型
							cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
							//定义这个单元格的样式
							cell3.setCellStyle(style);
							//输入单元格内空
							cell3.setCellValue(linkman.getLinkmanname());
							
							//在行里建单元格
							cell4 = row.createCell((short)4);
							//定义单元格为字符串类型
							cell4.setCellType(HSSFCell.CELL_TYPE_STRING);
							//定义这个单元格的样式
							cell4.setCellStyle(style);
							//输入单元格内空
							cell4.setCellValue(linkman.getLinkmanphone());
							
							//在行里建单元格
							cell5 = row.createCell((short)5);
							//定义单元格为字符串类型
							cell5.setCellType(HSSFCell.CELL_TYPE_STRING);
							//定义这个单元格的样式
							cell5.setCellStyle(style);
							//输入单元格内空
							cell5.setCellValue(linkman.getLinkmanmoblie());
							break;
						}
						else if(linkman.getJob().indexOf("经理") >= 0)
						{
							p = false;
							//在行里建单元格
							cell3 = row.createCell((short)3);
							//定义单元格为字符串类型
							cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
							//定义这个单元格的样式
							cell3.setCellStyle(style);
							//输入单元格内空
							cell3.setCellValue(linkman.getLinkmanname());
							
							//在行里建单元格
							cell4 = row.createCell((short)4);
							//定义单元格为字符串类型
							cell4.setCellType(HSSFCell.CELL_TYPE_STRING);
							//定义这个单元格的样式
							cell4.setCellStyle(style);
							//输入单元格内空
							cell4.setCellValue(linkman.getLinkmanphone());
							
							//在行里建单元格
							cell5 = row.createCell((short)5);
							//定义单元格为字符串类型
							cell5.setCellType(HSSFCell.CELL_TYPE_STRING);
							//定义这个单元格的样式
							cell5.setCellStyle(style);
							//输入单元格内空
							cell5.setCellValue(linkman.getLinkmanmoblie());
							break;
						}
					}
					if (p)
					{
						//在行里建单元格
						cell3 = row.createCell((short)3);
						//定义单元格为字符串类型
						cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
						//定义这个单元格的样式
						cell3.setCellStyle(style);
						//输入单元格内空
						cell3.setCellValue(ls.get(0).getLinkmanname());
						
						//在行里建单元格
						cell4 = row.createCell((short)4);
						//定义单元格为字符串类型
						cell4.setCellType(HSSFCell.CELL_TYPE_STRING);
						//定义这个单元格的样式
						cell4.setCellStyle(style);
						//输入单元格内空
						cell4.setCellValue(ls.get(0).getLinkmanphone());
						
						//在行里建单元格
						cell5 = row.createCell((short)5);
						//定义单元格为字符串类型
						cell5.setCellType(HSSFCell.CELL_TYPE_STRING);
						//定义这个单元格的样式
						cell5.setCellStyle(style);
						//输入单元格内空
						cell5.setCellValue(ls.get(0).getLinkmanmoblie());
					}
				}
				else
				{
					//在行里建单元格
					cell3 = row.createCell((short)3);
					//定义单元格为字符串类型
					cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
					//定义这个单元格的样式
					cell3.setCellStyle(style);
					//输入单元格内空
					cell3.setCellValue(ls.get(0).getLinkmanname());
					
					//在行里建单元格
					cell4 = row.createCell((short)4);
					//定义单元格为字符串类型
					cell4.setCellType(HSSFCell.CELL_TYPE_STRING);
					//定义这个单元格的样式
					cell4.setCellStyle(style);
					//输入单元格内空
					cell4.setCellValue(ls.get(0).getLinkmanphone());
					
					//在行里建单元格
					cell5 = row.createCell((short)5);
					//定义单元格为字符串类型
					cell5.setCellType(HSSFCell.CELL_TYPE_STRING);
					//定义这个单元格的样式
					cell5.setCellStyle(style);
					//输入单元格内空
					cell5.setCellValue(ls.get(0).getLinkmanmoblie());
				}
			}
			else
			{
				//在行里建单元格
				cell3 = row.createCell((short)3);
				//定义单元格为字符串类型
				cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
				//定义这个单元格的样式
				cell3.setCellStyle(style);
				//输入单元格内空
				cell3.setCellValue("");
				
				//在行里建单元格
				cell4 = row.createCell((short)4);
				//定义单元格为字符串类型
				cell4.setCellType(HSSFCell.CELL_TYPE_STRING);
				//定义这个单元格的样式
				cell4.setCellStyle(style);
				//输入单元格内空
				cell4.setCellValue("");
				
				//在行里建单元格
				cell5 = row.createCell((short)5);
				//定义单元格为字符串类型
				cell5.setCellType(HSSFCell.CELL_TYPE_STRING);
				//定义这个单元格的样式
				cell5.setCellStyle(style);
				//输入单元格内空
				cell5.setCellValue("");
			}
			
			//在行里建单元格
			cell6 = row.createCell((short)6);
			//定义单元格为字符串类型
			cell6.setCellType(HSSFCell.CELL_TYPE_STRING);
			//定义这个单元格的样式
			cell6.setCellStyle(style);
			//输入单元格内空
			if (com.getLastvisitdate()!=null)
			{
				cell6.setCellValue(com.getLastvisitdate().toString());
			}
			else
			{
				cell6.setCellValue("");
			}
			
			//在行里建单元格
			cell7 = row.createCell((short)7);
			//定义单元格为字符串类型
			cell7.setCellType(HSSFCell.CELL_TYPE_STRING);
			//定义这个单元格的样式
			cell7.setCellStyle(style);
			//输入单元格内空
			cell7.setCellValue("");
			++i;
		}
		
		workbook.write(response.getOutputStream());
	}
}
