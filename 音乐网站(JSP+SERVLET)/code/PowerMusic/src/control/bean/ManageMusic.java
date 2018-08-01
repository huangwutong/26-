package control.bean;
/**
 * @管理歌曲 
 * 
 */
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import model.MusicModel;
import control.DataBaseConnector;

public class ManageMusic {
	private Connection con;
	private DataBaseConnector db;
	/**
	 * 构造函数
	 */
	public ManageMusic(){
		db = new DataBaseConnector();
	}
	/**
	 * 分页
	 * 
	 */
	public Vector displayQuery(int noteperpage,int pagecode,
			String condition,String keyfield) 
				throws SQLException{
		con = db.getConnection();
		CallableStatement cst = null;
		String query = "{call sp_getpage(?,?,?,?)}";
		Vector musicvector = null;
		try{
			cst = con.prepareCall(query);
			cst.setInt(1,noteperpage);
			cst.setInt(2,pagecode);
			cst.setString(3,condition);
			cst.setString(4,keyfield);
			ResultSet rs = cst.executeQuery();
			musicvector = new Vector();
			while(rs.next())
			{ 
				MusicModel musicmodel = new MusicModel();
				musicmodel.setMusicid(rs.getInt(1));
				musicmodel.setMusicName(rs.getString(2));
			  	musicmodel.setMusicType(rs.getString(3));
			  	musicmodel.setSingerName(rs.getString(4));
			  	musicmodel.setSubmitime(rs.getDate(5));
			  	musicvector.add(musicmodel);
			}
		}catch(SQLException e){
			e.getMessage();
		 }
		if(con!=null)
		con.close();
		return musicvector;
	}
	/**
	 * 返回表的总行数
	 */
	public int getTotalrow() throws SQLException{
		con = db.getConnection();
		PreparedStatement pst = null;
		String query = "select count(*) from MusicInfo";
		int totalrow = 0;
		try{
			pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				totalrow = rs.getInt(1);
			}
		}catch(SQLException e){
			e.getMessage();
		}
		if(con!=null)
			con.close();
		return totalrow;
	}
	/**
	 * 修改歌曲
	 */
	public int updateMusic(int musicid,String musicname,String musictype,
			String singername) throws SQLException{
		con = db.getConnection();
		PreparedStatement pst = null;
		String update = "update MusicInfo set MusicName=?,MusicType=?,SingerName=? where MusicID = ?";
		int rowaffect = 0;
		try{
			pst = con.prepareStatement(update);
			pst.setString(1,musicname);
			pst.setString(2,musictype);
			pst.setString(3,singername);
			pst.setInt(4,musicid);
			rowaffect = pst.executeUpdate();
		}catch(SQLException e){
			e.getMessage();
		}
		if(con!=null){
			con.close();
		}
		return rowaffect;
	}
	/**
	 * 删除歌曲
	 * 
	 */
	public int deleteMusic(int musicid)throws SQLException{
		con = db.getConnection();
		PreparedStatement pst = null;
		String delete = "delete from MusicInfo where MusicID = ?";
		int rowaffect = 0;
		try{
			pst = con.prepareStatement(delete);
			pst.setInt(1,musicid);
			rowaffect = pst.executeUpdate();
		}catch(SQLException e){
			e.getMessage();
		}
		if(con!=null){
			con.close();
		}
		return rowaffect;
	}
}
