import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

 class ChangeData extends JFrame implements ActionListener{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static JButton bt3 = new JButton("�޸�");
	public static JButton bt4 = new JButton("ȡ��");
	public static JLabel lb2 = new JLabel("����       �� Ԫ"); 
	public static JLabel lb3 = new JLabel("֧��       �� Ԫ");
	public static JLabel lb4 = new JLabel("ʱ��");
	public static JLabel lb5 = new JLabel("��ע");	
	public static JTextField txt2 = new JTextField();
	public static JTextField txt3 = new JTextField();
	public static JTextField txt4 = new JTextField();
	public static JTextField txt5 = new JTextField();
	String j=JOptionPane.showInputDialog("��������Ҫ�޸ĵ������:");
	public  Integer i=Integer.valueOf(j);	
	public  JDialog f2 = new JDialog(Moneymanager.m.f,"�޸ĵ�"+i+"������",true);
	
public ChangeData(){
	f2.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	f2.setLayout(null);
	f2.setBounds(220, 200, 600, 300);
	f2.setResizable(false);
	bt3.setBounds(180, 200, 60, 30);f2.add(bt3);bt3.addActionListener(this);
	bt4.setBounds(350, 200, 60, 30);f2.add(bt4);bt4.addActionListener(this);
	lb2.setBounds(100,60,200,40);f2.add(lb2);
	lb2.setFont(new Font("Serif",Font.BOLD,18));
	lb3.setBounds(315,60,200,40);f2.add(lb3);
	lb3.setFont(new Font("Serif",Font.BOLD,18));
	lb4.setBounds(100,90,200,40);f2.add(lb4);
	lb4.setFont(new Font("Serif",Font.BOLD,18));
	lb5.setBounds(100,120,250,40);f2.add(lb5);
	lb5.setFont(new Font("Serif",Font.BOLD,18));
	txt2.setBounds(140,70,55,20);f2.add(txt2);
	txt3.setBounds(355,70,55,20);f2.add(txt3);
	txt4.setBounds(140,100,100,20);f2.add(txt4);
	txt5.setBounds(140, 130, 300, 20);f2.add(txt5);
	
	if(i>new Show().xuhao||i<1){
		JOptionPane.showMessageDialog(null,"û�е�"+i+"�м�¼!!!!");f2.setVisible(false);
		}
	else{
		txt2.setText(new Show().playerInfo[i-1][1]);
		txt3.setText(new Show().playerInfo[i-1][2]);
		txt4.setText(new Show().playerInfo[i-1][3]);
		txt5.setText(new Show().playerInfo[i-1][4]);
		f2.setVisible(true);
	}
}

public void actionPerformed(ActionEvent   e){
	if(e.getSource()==bt3){
		//Integer i=Integer.valueOf(txt1.getText());		
		new Show().getplayerInfo();
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); //����access���ݿ�����
            } catch (ClassNotFoundException e2) {
            e2.printStackTrace();
         }
         try{
         Connection c = DriverManager.getConnection("jdbc:odbc:STU"); //������������stuΪ���ݿ���               
         PreparedStatement p = c.prepareStatement("UPDATE Moneymanager set ����=?, ֧��=? ,ʱ��=? ,��ע=? where ���=?");
         p.setInt(1, Integer.valueOf(txt2.getText()));
         p.setInt(2, Integer.valueOf(txt3.getText()));
         p.setString(3, txt4.getText()+" ");
         p.setString(4, txt5.getText()+" ");
         p.setInt(5, i);
         p.executeUpdate();
          p.close();c.close();
          JOptionPane.showMessageDialog(null,"�޸ĵ�"+i+"�����ݳɹ�����    ");
          f2.setVisible(false); 
          //System.exit(0);
         dispose();
     }catch(SQLException e2){
            e2.getStackTrace();
          }      
     }
		else if(e.getSource()==bt4){
		f2.setVisible(false);
		dispose();
	}
}

public static void main(String[] args){
//new ChangeData();
}

}
 