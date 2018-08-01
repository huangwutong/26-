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
package web.rss;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringReader;
import java.text.MessageFormat;
import java.text.ParseException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.digester.Digester;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 * ������վժҪ��Ϣ��ȡ����
 * ʹ�÷�����
 * Channel channel = RssHunter.parse("http://www.javayou.com/blog/rss1.jsp");
 * @author Winter Lau
 */
public abstract class RssHunter {
	
	static Log log;

	static Hashtable hunters;	
	static{
		log = LogFactory.getLog(RssHunter.class);
		hunters = new Hashtable();
		InputStream in = RssHunter.class.getResourceAsStream("rss.properties");
		if(in!=null){
			Properties props = new Properties();
			try{
				props.load(in);
			}catch(IOException e){
				log.error("load res.properties failed.", e);
			}finally{
				if(in!=null){
					try{
					in.close();
					}catch(Exception e){}
				}
			}
			Enumeration keys = props.keys();
			while(keys.hasMoreElements()){
				String key = (String)keys.nextElement();
				try{
					RssHunter hunter = (RssHunter)Class.forName(props.getProperty(key)).newInstance();
					hunters.put(key.toLowerCase(), hunter);
				}catch(Exception e){
					log.error("initialize RssHunter failure.",e);
				}
			}
		}
	}
	
	protected RssHunter(){		
	}
	
	/**
	 * ��ȡָ��Э���Ӧ��ժҪ��Ϣ������
	 * @param protocol
	 * @return
	 */
	protected static RssHunter getHunter(String protocol){
		return (RssHunter)hunters.get(protocol.toLowerCase());
	}
	
	/**
	 * ��URL��ȡ��Ϣ���ݲ�������Channel������
	 * @param url
	 * @return
	 * @throws Exception
	 */
	public static Channel parse(String url) throws Exception{
		String[] result = getContent(url);		
		String encoding = getEncoding(result[0].substring(0,50));
		try{
			RssHunter hunter = getHunter(result[1]);
			return hunter.parse(new StringReader(result[0].trim()));
		}catch(Exception e){
			System.out.println("in parse mode="+result[1]+",url="+url);
			throw e;
		}
	}
	
	/**
	 * ����XML���õı��뷽ʽ
	 * @param xml
	 * @return
	 * @throws ParseException
	 */
	protected static String getEncoding(String xml) throws ParseException{
		MessageFormat mf = new MessageFormat("{1}encoding=\"{0}\"{2}");
		try{
			return (String)(mf.parse(xml)[0]);
		}catch(Exception e){
			return "UTF-8";
		}
	}
	
	/**
	 * �ӵ�ַURL��ץȡժҪ��Ϣ�Լ����ݸ�ʽ
	 * @param url
	 * @return ����Ԫ�ص��ַ������ݣ���һ��Ԫ��ΪժҪ���ݣ��ڶ���Ԫ��Ϊ���ݸ�ʽ������rss
	 * @throws Exception
	 */
	protected static String[] getContent(String url) throws Exception
	{
		StringBuffer content = new StringBuffer();
		StringBuffer mode = new StringBuffer();
		long lastReload = load(url, content, mode);
		if(needReload(lastReload) || content.length()==0 || (mode!=null && mode.length()==0))
		{
			HttpClient client = new HttpClient();
			GetMethod get = new GetMethod(url);
			get.addRequestHeader("user-agent","DLOG4J(http://www.javayou.com) RssHunter 1.0");
			try{
				client.executeMethod(get);
				String charset = get.getResponseCharSet();
				if(get.getStatusCode() == HttpStatus.SC_OK){
					String ct = get.getResponseBodyAsString().trim();
					String encoding = getEncoding(ct.substring(0,50));
					DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
					DocumentBuilder db = dbf.newDocumentBuilder();
					Document doc = db.parse(new ByteArrayInputStream(ct.getBytes(charset)));
					String sMode = null;
					Element elem = doc.getDocumentElement();
					if("feed".equals(elem.getNodeName()))
						sMode = "atom";
					else
					if("rss".equals(elem.getNodeName()))
						sMode = "rss";
					else
					if("rdf:RDF".equals(elem.getNodeName()))
						sMode = "rdf";
					else
						throw new IllegalArgumentException(url);						
					
					mode = new StringBuffer(sMode);
					
					ct = new String(ct.getBytes(charset),encoding);
					save(url, ct, sMode);
					content = new StringBuffer(ct);
				}			
			}catch(Exception e){
				log.error("fetch content from " + url +" failed.", e);
			}finally{
				get.releaseConnection();
			}
		}
		return new String[]{content.toString().trim(),mode.toString()};
	}
	/**
	 * ����ָ��վ���ϴεı����ʱ��
	 * @param url ���������վ���URL
	 * @param content ���������������Ϣ������
	 * @return
	 * @throws IOException
	 */
	protected static long load(String url, StringBuffer content, StringBuffer mode) throws IOException{
		String path = getCachePath();
		BufferedReader reader = null;
		long lastModified = 0L;
		try{
			File f = new File(path);
			if(f.exists()){
				final String pattern = Math.abs(url.hashCode()) + ".";
				File[] fs = f.listFiles(new FilenameFilter(){
					public boolean accept(File dir, String name) {
						return name.startsWith(pattern);
					}});
				if(fs.length>0){
					mode.append(fs[0].getName().substring(pattern.length()));
					lastModified = fs[0].lastModified();
					reader = new BufferedReader(new FileReader(fs[0]));
					String lineSep = System.getProperty("line.separator");
					StringBuffer tmpContent = new StringBuffer();
					do{
						String line = reader.readLine();
						if(line==null)
							break;
						tmpContent.append(line);
						tmpContent.append(lineSep);
					}while(true);			
					content.append(tmpContent.toString().trim());
				}
			}			
		}catch(FileNotFoundException e){
		}finally{
			if(reader!=null)
				reader.close();
		}
		return lastModified;
	}
	/**
	 * ����ĳ��վ���������Ϣ
	 * @param url ���������վ��URL
	 * @param content ���������վ��ժҪ��Ϣ
	 * @throws IOException
	 */
	protected static void save(String url, String content, String mode) throws IOException{
		StringBuffer path = new StringBuffer(getCachePath());
		path.append(Math.abs(url.hashCode()));
		path.append('.');
		path.append(mode);
		BufferedWriter writer = null;
		try{
			File f = new File(path.toString());
			if(!f.getParentFile().exists())
				f.getParentFile().mkdirs();
			writer = new BufferedWriter(new FileWriter(f));
			writer.write(content);
		}finally{
			if(writer!=null)
				writer.close();
		}
	}
	/**
	 * ��ȡ��Ż����ļ����ڵ�Ŀ¼,Ĭ��Ϊ��ʱĿ¼�µ�dlog4j_cache��Ŀ¼
	 * @return
	 */
	protected static String getCachePath(){
		String tmpDir = System.getProperty("java.io.tmpdir");
		if(!tmpDir.endsWith(File.separator))
			tmpDir += File.separator;
		tmpDir += "dlog4j_cache";
		tmpDir += File.separator;
		return tmpDir;
	}
	
	/**
	 * Ĭ�ϵ����¼��ز��ԣ���һ�μ��ض�ʮ���Ӻ��������¼���
	 * ����ɸ��Ǹ÷������в��Ե����¶���
	 * @param lastReload
	 * @return
	 */
	protected static boolean needReload(long lastReload){
		long currentTime = System.currentTimeMillis();
		return (currentTime - lastReload) > 3600000;
	}
		
	/**
	 * ���ฺ��ժҪ���ݽ�������Ŀ
	 * @param content
	 * @return
	 * @throws Exception
	 */
	protected abstract Channel parse(Reader content) throws Exception;
	
	/**
	 * ��ȡXML������
	 * @param channel
	 * @return
	 */
	protected Digester getDigester(){
        Digester digester = new Digester();
        digester.push(new Channel());
        digester.setNamespaceAware(true);
        digester.setValidating(false);        
        return digester;
	}

	/**
	 * ��ȡXML������
	 * @param channel
	 * @return
	 */
	protected Digester getDigester(Channel channel){
        Digester digester = new Digester();
        digester.push(channel);
        digester.setNamespaceAware(true);
        digester.setValidating(false);        
        return digester;
	}
	
	public static void main(String[] args) throws Exception{
		Channel site = parse(args[0]);
		System.out.println("site.title:"+site.getTitle());
		System.out.println("site.link:"+site.getLink());
		System.out.println("site.description:"+site.getDescription());
		System.out.println("============ ITEMS ============");
		for(int i=0;i<site.getItems().size();i++){
			Item log = (Item)site.getItems().get(i);
			System.out.println("log.title:"+log.getTitle());
			System.out.println("log.link:"+log.getLink());
			System.out.println("log.description:"+log.getDescription());
			System.out.println("-----------------------------------");
		}
	}
	
}
