import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

 class Help extends JFrame implements ActionListener{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static JFrame hp = new JFrame("��ͥ���ϵͳ����");
	static JPanel help = new JPanel();
	static JButton bt = new JButton("�˳�");
	static JLabel lb1 = new JLabel("������");
	static JLabel lb2 = new JLabel("  1�� �޸����룺�����޸����룬��ֱ�������µ����룬Ȼ��ȷ���Ϳ�����;");
	static JLabel lb3 = new JLabel("  2�� �޸����ݣ������޸����ݣ�Ȼ��ѡ��Ҫ�޸ĵĶ������ţ��ٰ���Ҫ�޸�;");
	static JLabel lb4 = new JLabel("  3�� ɾ�����ݣ�����ɾ�����ݣ�Ȼ��ѡ��Ҫɾ���Ķ������ţ�ֱ�ӵ��ɾ��;");
	static JLabel lb5 = new JLabel("  4�� ����ͳ�ƣ�����ͳ�ƣ����԰��ո����Ĺ��������԰���ĳһʱ�����ͳ��;");
	static JLabel lb6 = new JLabel("  5�� �ܽ��ࡪ����ʾ���������ܼƣ����ֿ�ֱ�Ӷ�Ӧ��������;");
	static JLabel lb7 = new JLabel("  6�� ����ĳ�ʼ����Ϊ:123��");
	static JLabel lb8 = new JLabel("  7�� ������ӣ�������ڸ����ұ�ֱ�Ӱ��������������Ϣ��");
	static JLabel lb9 = new JLabel("  8�� ������Ϊ�˺�ǿ�������󿪷�������Ҷ����Щ���顣");
		
		public  Help(){
		hp.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		help.setLayout(null);hp.setLayout(null);
		hp.setBounds(270, 180, 520, 300);
		help.setBounds(0, 0, 520, 200);
		hp.setResizable(false);
		bt.setBounds(150, 220, 200, 40);	hp.add(bt);	bt.addActionListener(this);
		lb1.setBounds(15, 20, 600, 20);help.add(lb1);	
		lb2.setBounds(15, 40, 600, 20);help.add(lb2);
		lb3.setBounds(15, 60, 600, 20);help.add(lb3);
		lb4.setBounds(15, 80, 600, 20);help.add(lb4);
		lb5.setBounds(15, 100, 600, 20);help.add(lb5);
		lb6.setBounds(15, 120, 600, 20);help.add(lb6);
		lb7.setBounds(15, 140, 600, 20);help.add(lb7);
		lb8.setBounds(15, 160, 600, 20);help.add(lb8);
		lb9.setBounds(15, 180, 600, 20);help.add(lb9);
		hp.add(help);
		hp.setVisible(true);
		help.setVisible(true);
		
	}
		
		public void actionPerformed(ActionEvent   e){
			hp.setVisible(false);
		}
	public static void main(String[] args) {
		//new Help();
	}

}
