/**
 * ��Changepw.class�����޸ĳ������룻
 * 
 * 
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.*;

 class Changepw {
	/**
	 * 
	 */
	 String j =	JOptionPane.showInputDialog("������ԭ����:");
	
	public  Changepw(){
		if(j.equals(new GetOldPW().getpw())){
			String k =	JOptionPane.showInputDialog("������������:");
			String l =	JOptionPane.showInputDialog("��ȷ��������:");
			if(l.equals(k)){
				try{
					Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");//��װ����
				}catch(java.lang.ClassNotFoundException e){
					System.out.println("forname:��" + e.getMessage());
				}
				try{
					Connection c = DriverManager.getConnection("jdbc:odbc:STU");//�������ݿ�
					PreparedStatement s = c.prepareStatement("UPDATE pw set password=?");
					s.setString(1, l);
					s.executeUpdate();
					
					 s.close();
					c.close();
					JOptionPane.showMessageDialog(null,"�����޸ĳɹ�����");
				}catch(SQLException e){
					System.out.println("SQLException: "+ e.getMessage());	
					}
				
				
				
			}else
			JOptionPane.showMessageDialog(null,"�����������벻ͬ���޸�ʧ�ܣ���");
			
		}else
			JOptionPane.showMessageDialog(null,"������󣡣��޸�ʧ�ܣ���  ");
		}
	
	public static void main(String[] args) {
					
		}
	}