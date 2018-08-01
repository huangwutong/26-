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

import java.io.File;

import javax.servlet.ServletException;

import javazoom.download.util.FileInfo;

/**
 * ��ʼ��Download4J
 * @author liudong
 */
public class DownloadServlet extends javazoom.download.DownloadServlet {

	public void init() throws ServletException {
		super.init();
		String path = getServletContext().getRealPath("/WEB-INF/conf/savings");
		File f = new File(path);
		if(!f.exists())
			f.mkdirs();
		FileInfo.PATH = path;
	}
}
