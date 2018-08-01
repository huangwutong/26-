package ad.add;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import sys.dao.ConnectManager;

/**
 * Servlet implementation class for Servlet: UploadServlet
 *
 */
public class AddSort extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	File tmpDir = null;//初始化上传文件的临时存放目录
	File saveDir = null;//初始化上传文件后的保存目录

	public AddSort()
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		RequestDispatcher rd=request.getRequestDispatcher("/succ.jsp");
		try
		{
			if (ServletFileUpload.isMultipartContent(request))
			{
				String url ="";
				DiskFileItemFactory dff = new DiskFileItemFactory();//创建该对象
				dff.setRepository(tmpDir);//指定上传文件的临时目录
				dff.setSizeThreshold(1024000);//指定在内存中缓存数据大小,单位为byte
				ServletFileUpload sfu = new ServletFileUpload(dff);//创建该对象
				sfu.setFileSizeMax(102400);//指定单个上传文件的最大尺寸
				sfu.setSizeMax(10000000);//指定一次上传多个文件的总尺寸
				List list = sfu.parseRequest(request);//解析request 请求,并返回List集合
				Iterator fii = list.iterator();
//				FileItemIterator fii = sfu.getItemIterator(request);//解析request 请求,并返回FileItemIterator集合
				//得到服务器绝对路径
				String savePath = request.getSession().getServletContext().getRealPath("");
				String path = "\\ad\\img\\";
				String industry = "";
				String curl = "";
				String imgurl = "";
				while (fii.hasNext())
				{
					FileItem fis = (FileItem)fii.next();
					if (fis.isFormField() && fis.getFieldName().equals("industry"))
					{
						industry = fis.getString();
					}//从集合中获得一个文件流
					if (fis.isFormField() && fis.getFieldName().equals("curl"))
					{
						curl = new String(fis.getString().getBytes("ISO8859_1"),"utf-8");
					}
					if (!fis.isFormField() && fis.getName().length() > 0)//过滤掉表单中非文件域
					{
						String fileName = fis.getName().substring(fis.getName().lastIndexOf("\\"));//获得上传文件的文件名
						//生成服务器保存名
						fileName = new java.text.SimpleDateFormat("yyMMddhhmmss").format(new java.util.Date()).toString()+fileName.substring(fileName.lastIndexOf("."));
						BufferedInputStream in = new BufferedInputStream(fis.getInputStream());//获得文件输入流
						url = fileName.substring(fileName.lastIndexOf("."));
						if (".jpg".equals(url.toLowerCase()) || ".gif".equals(url.toLowerCase()) || ".jpge".equals(url.toLowerCase()))
						{
							BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File(savePath +path+ fileName)));//获得文件输出流
							Streams.copy(in, out, true);//开始把文件写到你指定的上传文件夹
							imgurl = path+fileName;
						}
					}
				}
				if (!"".equals(imgurl) && !"".equals(curl) && !"".equals(industry))
				{
					ConnectManager cm = ConnectManager.newInstance();
					if (cm.getConnection())
					{
						try
						{
							String sql = "insert into sort values("+industry+",'"+curl+"','"+"\\erp"+imgurl+"')";
							cm.executeUpdate(sql);
							request.setAttribute("success", "添加成功了");
						}
						finally
						{
							cm.close();
						}
					}
				}
			}
		}
		catch (Exception e)
		{
			rd = request.getRequestDispatcher("/error.jsp");
			request.setAttribute("error", "添加子页面出错");
			e.printStackTrace();
		}
		rd.forward(request, response);
	}

	public void init() throws ServletException
	{
		super.init();
	}
}
