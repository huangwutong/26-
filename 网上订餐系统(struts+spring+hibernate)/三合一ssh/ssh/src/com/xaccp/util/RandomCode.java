package com.xaccp.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
//长生一个随机数的代码
public class RandomCode extends HttpServlet {

	public RandomCode() {
		super();
	}
	
	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	
	private int width=60;
	private int height=20;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 
		response.setContentType("image/jpeg");
		OutputStream out =response.getOutputStream();
		//图片缓存区，我们可以利用这个图片的缓存区来进行图片数据的操作
		BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
		Graphics2D g=image.createGraphics();
		
		g.setColor(Color.WHITE);
		g.fillRect(0,0,width,height);
		
		Font font = new Font("Times New Roman",Font.ROMAN_BASELINE,18);
		
		g.setFont(font);
		
		//画边框
		g.setColor(Color.BLACK);
		g.drawRect(0,0,width-1,height-1);
		
		//随机产生干扰线
		Random random=new Random();
		g.setColor(Color.LIGHT_GRAY);
		for(int i=0;i<100;i++){
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int x1 = random.nextInt(12);
			int y1 = random.nextInt(12);
			g.drawLine(x,y,x+x1,y+y1);
		}
		
		//随机生成4位验证码保存到session中，产生的字符串数组存放在我们的字符串缓存区里面
		StringBuffer randomCode=new StringBuffer();
		for(int i=0;i<4;i++){
			
			String strRand=String.valueOf(random.nextInt(10));
			
			int red=random.nextInt(100);
			int green=random.nextInt(50);
			int bule=random.nextInt(50);
			
			g.setColor(new Color(red,green,bule));
			g.drawString(strRand, 13*i+6, 16);
			//采用这个代码可以把数据都放到字符串缓冲区里面
			randomCode.append(strRand);
		}
		
		HttpSession session=request.getSession();
		session.setAttribute("RandomCode", randomCode);
		//图片压缩工具，在有些版本的jar包中已经被移除了
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
		encoder.encode(image);
		out.close();
	}

	public void init() throws ServletException {
		
	}
}