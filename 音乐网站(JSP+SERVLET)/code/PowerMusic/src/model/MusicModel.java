package model;
import java.sql.Date;
/**
 * 普通用户模块
 */
import java.io.Serializable;

public class MusicModel implements Serializable{
	private int musicid;
	private String musicname;
	private String musictype;
	private String singername;
	private Date submitime;
	
	public MusicModel(){
		
	}
	public void setMusicid(int musicid){
		this.musicid = musicid;
	}
	public int getMusicid(){
		return this.musicid;
	}
	public void setMusicName(String musicname){
		this.musicname = musicname;
	}
	public String getMusicName(){
		return this.musicname;
	}
	public void setMusicType(String musictype){
		this.musictype = musictype;
	}
	public String getMusicType(){
		return this.musictype;
	}
	public void setSingerName(String singername){
		this.singername = singername;
	}
	public String getSingerName(){
		return this.singername;
	}
	
	public void setSubmitime(Date submitime){
		this.submitime = submitime;
	}
	public Date getSubmitime(){
		return this.submitime;
	}
}
