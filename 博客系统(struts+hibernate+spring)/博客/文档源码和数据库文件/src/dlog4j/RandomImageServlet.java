/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package dlog4j;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dlog4j.util.image.RandomImageGenerator;


/**
 * 用于产生注册用户时的随即图片以防止非法攻击
 * @author Liudong
 */
public class RandomImageServlet extends HttpServlet {

    public final static String RANDOM_LOGIN_KEY = "RANDOM_LOGIN_KEY";

	public void init() throws ServletException {
		System.setProperty("java.awt.headless","true");
	}
	
    public static String getRandomLoginKey(HttpServletRequest req) {
        return (String)req.getSession().getAttribute(RANDOM_LOGIN_KEY);
    }
    
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
    {
        HttpSession ssn = req.getSession();
        if(ssn!=null) {
            String randomString = RandomImageGenerator.random();
            ssn.setAttribute(RANDOM_LOGIN_KEY,randomString);
            res.setContentType("image/jpeg");
            RandomImageGenerator.render(randomString,res.getOutputStream());
        }
    }
}
