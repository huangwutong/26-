import java.util.*;
import javax.swing.*;

import java.awt.event.*;
import java.awt.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.*;

public class Moneymanager  implements  ActionListener {
	public static Moneymanager m = new Moneymanager();
	 JFrame f = new JFrame("��ͥ���ϵͳ");
	String[] Names={"���","����","֧��","ʱ��","��ע"};
	JTable table=new JTable(new Show().playerInfo,Names);
	JScrollPane s=new JScrollPane(table);
	static JPanel p = new JPanel();
	static JButton bt1 = new JButton("�޸�����");
	static JButton bt2 = new JButton("�޸�����");
	static JButton bt3 = new JButton("ɾ������");
	static JButton bt4 = new JButton("����ͳ��");
	static JButton bt5 = new JButton("��Ӽ�¼");
	static JButton bt6 = new JButton("����");
	static JButton bt7 = new JButton("�������");
	static JLabel lb1 = new JLabel("����       �� Ԫ"); 
	static JLabel lb2 = new JLabel("֧��       �� Ԫ");
	static JLabel lb3 = new JLabel("ʱ��");
	static JLabel lb4 = new JLabel("��ע");
	static JLabel lb5 = new JLabel("�˺�ǿ����������Ʒ");
	static JLabel lb6 = new JLabel("0");
	static JTextField txt1 = new JTextField("0");
	static JTextField txt2 = new JTextField("0");
	static JTextField txt3 = new JTextField(m.gettime());
	static JTextField txt4 = new JTextField();
	public static String[][]a = new String[10000][5];
	public static Integer[][]b = new Integer[10000][5];
	
	public void MoneymanagerWindow (){
	   f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	   f.setBounds(100, 50, 849, 600); //�����ڴ�С
	   f.setLayout(null);f.setResizable(false);
	   p.add(s);f.add(p);
	   table.setPreferredScrollableViewportSize(new Dimension(770,370));
	   table.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
	   p.setBounds(20,105,800,410);
	   bt1.setBounds(5,5,200,40);f.add(bt1);bt1.addActionListener(this);
	   bt2.setBounds(215,5,200,40);f.add(bt2);bt2.addActionListener(this);
	   bt3.setBounds(425,5,200,40);f.add(bt3);bt3.addActionListener(this);
	   bt4.setBounds(635,5,200,40);f.add(bt4);bt4.addActionListener(this);
	   bt5.setBounds(720,60,100,40);f.add(bt5);bt5.addActionListener(this);
	   bt6.setBounds(40,520,200,40);f.add(bt6);bt6.addActionListener(this);
	   bt7.setBounds(260,520,200,40);f.add(bt7);bt7.addActionListener(this);
	   lb1.setBounds(20,60,200,40);f.add(lb1);
	   lb1.setFont(new Font("Serif",Font.BOLD,18));
	   lb2.setBounds(170,60,200,40);f.add(lb2);
	   lb2.setFont(new Font("Serif",Font.BOLD,18));
	   lb3.setBounds(315,60,200,40);f.add(lb3);
	   lb3.setFont(new Font("Serif",Font.BOLD,18));
	   lb4.setBounds(470,60,200,40);f.add(lb4);
	   lb4.setFont(new Font("Serif",Font.BOLD,18));
	   lb5.setBounds(560,520,250,40);f.add(lb5);
	   lb5.setFont(new Font("Serif",Font.BOLD,24));
	   //lb6.setBounds(710,522,250,40);f.add(lb6);
	   //lb6.setFont(new Font("Serif",Font.BOLD,18));
	   txt1.setBounds(60,70,55,20);f.add(txt1);
	   txt2.setBounds(210,70,55,20);f.add(txt2);
	   txt3.setBounds(355,70,100,20);f.add(txt3);
	   txt4.setBounds(510,70,200,20);f.add(txt4);
	   	   	   f.setVisible(true);
	   }
	
	
	public void actionPerformed(ActionEvent   e){
		if(e.getSource()==bt1){
			new Changepw();
		}
		else if(e.getSource()==bt2){
			new ChangeData();
			//new Show().getplayerInfo();
            m.f5();//table.updateUI(); 
		}
		else if(e.getSource()==bt3){
			new DelData();
			 //table.updateUI();
		}else if(e.getSource()==bt4){
			new Tongji();
			//table.updateUI();
		}
        else if(e.getSource()==bt5){
        	new AddData();
        	m.f5();
        	//table.setValueAt("huihjnmb", 3, 2);
        	//m.f5();
      		 }
         	//new Table().table.updateUI();
  	    else if(e.getSource()==bt6){
			new Help();
  	    	//m.f5();
		}
		else if(e.getSource()==bt7){
			String j=JOptionPane.showInputDialog("����������:");
			if(new GetOldPW().getpw().equals(j)){
			new FormartData();
			}
			else
				JOptionPane.showMessageDialog(null,"������󣡣������ʧ�ܣ���");	
			
			//m.f5();
	}
	}
	 
	
           
	
	public  String gettime(){
		Date now = new Date(); 
	    DateFormat d = DateFormat.getDateInstance(); 
	    return d.format(now); 	
	}
	
	public void f5(){
		try {
		    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); //����access���ݿ�����
	   } catch (ClassNotFoundException e1) {
	    e1.printStackTrace();
	   }
	   try{
	   Connection c = DriverManager.getConnection("jdbc:odbc:STU"); //��������STU���ݿ�
	   Statement s = c.createStatement();					   
	   ResultSet r=s.executeQuery("select * from Moneymanager");//����ѯ�õ��Ľ������rs
	   int i=0;
	   while(r.next()){
		   Moneymanager.m.table.setValueAt(String.valueOf(i+1), i, 0);
		   Moneymanager.m.table.setValueAt(String.valueOf((r.getInt("����"))), i, 1);
		   Moneymanager.m.table.setValueAt(String.valueOf((r.getInt("֧��"))), i, 2);
		   Moneymanager.m.table.setValueAt(r.getString("ʱ��"), i, 3);
		   Moneymanager.m.table.setValueAt(r.getString("��ע"), i, 4);
		   	 i++;
		  }
	  c.close();s.close();
	   }catch(SQLException e1){
		   e1.getStackTrace();
	   } 

		
	}
  
   public static void main(String args[]){
	 new Enter();
	 //m.MoneymanagerWindow(); 
	//System.out.println(m.a[5][2]);
	   
   }
}
