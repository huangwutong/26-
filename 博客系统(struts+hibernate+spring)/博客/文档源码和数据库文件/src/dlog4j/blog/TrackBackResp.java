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
package dlog4j.blog;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;

import org.apache.commons.digester.Digester;
import org.xml.sax.SAXException;

/**
 * TrackBack执行后的回应
 * @author Winter Lau
 */
public class TrackBackResp implements Serializable {

	int error;
	String message;
	String encode = "UTF-8";

	public static  TrackBackResp parse(InputStream in) throws IOException, SAXException{
		Digester digester = new Digester();
		digester.setValidating(false);
		digester.addObjectCreate("response", TrackBackResp.class);
		digester.addBeanPropertySetter("response/error","error");
		digester.addBeanPropertySetter("response/message","message");
		return (TrackBackResp)digester.parse(in);
	}
	
	public static  TrackBackResp parse(String xml) throws IOException, SAXException{
		ByteArrayInputStream bais = new ByteArrayInputStream(xml.getBytes());
		Digester digester = new Digester();
		digester.setValidating(false);
		digester.addObjectCreate("response", TrackBackResp.class);
		digester.addBeanPropertySetter("response/error","error");
		digester.addBeanPropertySetter("response/message","message");
		return (TrackBackResp)digester.parse(bais);
	}
	
	public String toString(){
		StringBuffer xml = new StringBuffer();
		xml.append("<?xml version=\"1.0\" encoding=\"");
		xml.append(encode);
		xml.append("\"?>\n");
		xml.append("<response>\n");
		xml.append("\t<error>");
		xml.append(error);
		xml.append("</error>");
		if(message!=null){
			xml.append("\t<message>");
			xml.append(message);
			xml.append("</message>");
		}
		xml.append("\n</response>");
		return xml.toString();
	}
	
	public int getError() {
		return error;
	}
	public void setError(int error) {
		this.error = error;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getEncode() {
		return encode;
	}
	public void setEncode(String encode) {
		this.encode = encode;
	}
	public static void main(String[] args) throws IOException, SAXException{
		TrackBackResp resp = new TrackBackResp();
		resp.setError(0);
		System.out.println(TrackBackResp.parse(resp.toString()));
	}
}
