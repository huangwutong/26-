package model;
/**
 * ÐÂÎÅÄ£¿é
 */
import java.sql.Date;
import java.io.Serializable;
public class NewsModel implements Serializable{
	private String newstitle;
	private String newscontent;
	private String promulgator;
	private Date submitime;
	private int newsid;
	
	public void setNewsID(int newsid){
		this.newsid = newsid;
	}
	public int getNewsID(){
		return this.newsid;
	}
	public void setNewsTitle(String newstitle){
		this.newstitle = newstitle;
	}
	public String getNewsTitle(){
		return this.newstitle;
	}
	public void setNewsContent(String newscontent){
		this.newscontent = newscontent;
	}
	public String getNewsContent(){
		return this.newscontent;
	}
	public void setPromulgator(String promulgator){
		this.promulgator = promulgator;
	}
	public String getPromulgator(){
		return this.promulgator;
	}
	public void setSubmitime(Date submitime){
		this.submitime = submitime;
	}
	public Date getSubmitime(){
		return this.submitime;
	}
}
