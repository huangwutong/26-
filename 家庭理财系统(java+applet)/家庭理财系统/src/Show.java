import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


 class Show {
	 String[][] playerInfo= new String[10000][5];
	int xuhao=0;
	 public Show(){
		this.getplayerInfo();
		
			
		
	}

	 public void getplayerInfo(){
		  
	 	try {
					    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); //����access���ݿ�����
				   } catch (ClassNotFoundException e1) {
				    e1.printStackTrace();
				   }
				   try{
				   Connection conn = DriverManager.getConnection("jdbc:odbc:STU"); //������������studentΪ���ݿ���
				   Statement stmt = conn.createStatement();					   ResultSet rs=stmt.executeQuery("select * from Moneymanager");//����ѯ�õ��Ľ������rs
				   int i=0;
				   while(rs.next()){
					   playerInfo[i][0]=String.valueOf(i+1);
					   playerInfo[i][1]=String.valueOf((rs.getInt("����")));
					   playerInfo[i][2]=String.valueOf((rs.getInt("֧��")));
					   playerInfo[i][3]=rs.getString("ʱ��");
					   playerInfo[i][4]=rs.getString("��ע");
						 i++;
					  }
				   xuhao=i;conn.close();stmt.close();
				   }catch(SQLException e1){
		    		   e1.getStackTrace();
				   } 

				  // new Table().table.updateUI();
		 }
	 
	 
	//new Table().table.setValueAt(String.valueOf(i+1), 1, 1);
	 
	public static void main(String[] args) {
		

	}

}
