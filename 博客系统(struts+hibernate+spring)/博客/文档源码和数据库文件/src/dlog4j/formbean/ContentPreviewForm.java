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
package dlog4j.formbean;

import org.apache.commons.lang.StringUtils;
import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.tags.TableTag;
import org.htmlparser.util.NodeList;

/**
 * 支持内容预览的基类
 * @author Liudong
 */
public class ContentPreviewForm extends DlogActionForm {

	public final static int MAX_COUNT = 400;
	public final static int MAX_COUNT2 = 1000;
	public static int BRIEF_LENGTH = 25;
	
    String content = null;
    
	public String getBrief() {
	    //去除所有尖括号对
		if (content == null)
			return "无内容";
		String ct = StringUtils.replace(content,"&nbsp;","");		
		StringBuffer brief = new StringBuffer(256);
		int cur = 0;
		do {
		    int idx = ct.indexOf('<',cur);
		    if(idx==-1) {
		        brief.append(ct.substring(cur));
		        break;
		    }
		    else {
			    brief.append(ct.substring(cur,idx));
			    cur = ct.indexOf('>',idx);
			    if(cur==-1)
			        break;
			    cur++;
		    }
		}while(true);
		String text = StringUtils.left(brief.toString().trim(),BRIEF_LENGTH);
		if(text==null||text.length()==0)
		    text = "[无文本信息]";
		else
		    text = StringUtils.replace(text,"&nbsp;"," ");
		
		return text.trim();
	}
	
	/**
	 * 获取HTML的预览信息
	 * @return
	 */
	public String getPreviewContent(){
		String ct = StringUtils.left(content,MAX_COUNT);
		try {
		    //截取前N个字符
		if(ct!=null&&content!=null) {
		    int idx2 = ct.lastIndexOf('>');
		    int idx1 = ct.lastIndexOf('<');
		    if((idx2==-1 && idx1>=0) || idx1 > idx2) {
		        String ct2 = content.substring(ct.length());
		        int idx3 = ct2.indexOf('>');
		        if(idx3!=-1 && idx3<(MAX_COUNT2-MAX_COUNT)) {
		            ct += content.substring(ct.length(),ct.length()+idx3+1);
		        }
		    }
		}
		if(ct!=null&&content!=null) {
		    int idx2 = ct.toLowerCase().lastIndexOf("</object>");
		    int idx1 = ct.toLowerCase().lastIndexOf("<object");
		    if((idx2==-1 && idx1>=0) || idx1 > idx2) {
		        String ct2 = content.substring(ct.length()).toLowerCase();
		        int idx3 = ct2.indexOf("</object>");
		        if(idx3!=-1) 
		            ct += content.substring(ct.length(),ct.length()+idx3+9);		            
		        else 
		            ct = ct.substring(0,idx1);		        
		    }
		}
		if(ct!=null&&content!=null) {
		    //System.out.println(ct);
		    int idx1 = ct.toLowerCase().lastIndexOf("<div align='right'><font color='#cccccc' size='1'>[edit");		    
		    int idx2 = ct.toLowerCase().lastIndexOf("]</font></div>");
		    //System.out.println("idx1="+idx1+",idx2="+idx2);
		    if((idx1>=0 && idx2==-1) || idx1 > idx2){
		        String ct2 = content.substring(ct.length());
		        int idx3 = ct2.toLowerCase().indexOf("]</font></div>");
		        if(idx3!=-1) 
		            ct += content.substring(ct.length(),ct.length()+idx3+14);
		        else
		            ct = ct.substring(0,idx1);		        
		    }
		}
		if(ct!=null&&content!=null) {
	        Parser parser = Parser.createParser(new String(ct.getBytes(),ISO8859_1));
	        Node [] tables = parser.extractAllNodesThatAre (TableTag.class);
	        if(tables!=null&&tables.length>0) {
	            TableTag tableTag = (TableTag)tables[0];
	            ct = ct.substring(0,tableTag.getStartPosition()) + new String(tableTag.toHtml().getBytes(ISO8859_1));
	        }
		}
		pc_len = ct.length();
		}catch(NullPointerException e) {
		}catch(Exception e) {
		    e.printStackTrace();
		}
		return ct;
	}
	
	int pc_len = -1;
	
	public String getOtherContent() {
	    if(content!=null) {
	        if(pc_len==-1)
	            pc_len = getPreviewContent().length();
	        int pl = (pc_len==-1)?0:pc_len;
	        int cl = getContent().length()-pl;
	        if(cl>0)
	            return content.substring(pl);
	    }
	    return null;
	}

    public String getContent() {
        return content;
    }
    
    public String getWmlContent(){
    	try{
    		return extractText(content);
    	}catch(Exception e){}
    	return null;
    }
    public void setContent(String content) {
        this.content = content;
    }

    /**
	  * 抽取纯文本信息
	  * 
	  * @param inputHtml
	  * @return
	  */
	protected static String extractText(String inputHtml) throws Exception {
		StringBuffer text = new StringBuffer();
		Parser parser = Parser.createParser(new String(inputHtml.getBytes(),ISO8859_1));
		//遍历所有的节点
		NodeList nodes = parser.extractAllNodesThatMatch(new NodeFilter() {
			public boolean accept(Node node) {
				return true;
			}
		});
		for(int i=0;i<nodes.size();i++){
			Node node = nodes.elementAt(i);
			text.append(new String(node.toPlainTextString().getBytes(ISO8859_1)));
		}
		return text.toString();
	}

    public static void main(String[] args) {
        String ct = "点击<A href=\"http://www.javayou.com/dlog/showlog.asp?log_id=534\" target=_blank><FONT color=#ff0000 size=3><STRONG>这里</STRONG></FONT></A>查看 <DIV align=right><FONT color=#cccccc size=1>[Edit&nbsp;on&nbsp;2004-03-11 14:18:31&nbsp;By&nbsp;管理员]</FONT></DIV>";
        ContentPreviewForm cpf = new ContentPreviewForm();
        cpf.setContent(ct);
        System.out.println(cpf.getPreviewContent());
    }
    private final static String ISO8859_1 = "8859_1";
}
