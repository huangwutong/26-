import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;


 class Tongji extends JFrame implements ActionListener{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static JFrame f = new JFrame("����ͳ��");
	static JLabel lb1 = new JLabel("�������Ϊ��");
	static JLabel lb2 = new JLabel("");
	static JButton bt1 = new JButton("ȷ��");
	
	public String getlb2(){
		int i=0,k=0;
		 
		try {
		    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); //����access���ݿ�����
		   } catch (ClassNotFoundException e1) {
		    e1.printStackTrace();
		   }
		   try{
		   Connection conn = DriverManager.getConnection("jdbc:odbc:STU"); //������������studentΪ���ݿ���
		   Statement stmt = conn.createStatement();
		   ResultSet rs=stmt.executeQuery("select * from Moneymanager");//����ѯ�õ��Ľ������rs
		   
		   
		   while(rs.next()){
			   i=i+rs.getInt("����");
			   k=k+rs.getInt("֧��");
		   }
		  
		   }catch(SQLException e1){
		   e1.getStackTrace();
		   }   
		
		   
		//���
		
		return String.valueOf(i-k)+"Ԫ";
	}
	Tongji(){
		f.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		   f.setBounds(370, 200,300,200); //�����ڴ�С
		   f.setLayout(null);f.setResizable(false);
		   
		   bt1.setBounds(110, 110, 60, 30);f.add(bt1);bt1.addActionListener(this);
			lb1.setBounds(75, 27, 160, 20);f.add(lb1);
			lb1.setFont(new Font("Serif",Font.BOLD,18));
			lb2.setText(getlb2());
			lb2.setBounds(120, 70, 160, 20);f.add(lb2);
			lb2.setFont(new Font("Serif",Font.BOLD,24));
			f.setVisible(true);
	}

	
	public void actionPerformed(ActionEvent   e){
		f.setVisible(false);
		
	}
	
	public static void main(String[] args) {
		//new Tongji();
	}

}
