import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class TestSlitherMenu 
extends JFrame 
implements ActionListener, MouseListener {
	
	JTextField tf;
	JButton bt;
	SlitherMenu sm1, sm2, sm3;
	
	JPanel panelMain, panelMenu;
	
	public TestSlitherMenu() {
		
		tf = new JTextField("这里是防QQ的滑动菜单的演示程序");
		bt = new JButton("顾俊在这里祝鲜强将来成为：yue han ka ma ke  *^_^*  ");
		panelMain = new JPanel(new BorderLayout(20, 20));
		panelMenu = new JPanel(new GridLayout(1, 3));
		
		sm1 = new SlitherMenu();
		sm2 = new SlitherMenu();
		sm3 = new SlitherMenu();
		
		//第一个菜单////////////////////////////////
		sm1.setMenuLocation(30,10);		//设置坐标
		sm1.setMenuDimension(160, 400);	//设置大小
		sm1.addPanel("I第一个按键模板", "", 0 , 5);
		sm1.addButton("pic/s01.gif", "第1-1个功能键", "第一个提示", 0);
		sm1.addButton("pic/s02.gif", "第1-2个功能键", "第二个提示", 0);
		sm1.addButton("pic/s03.gif", "第1-3个功能键", "第三个提示", 0);
		sm1.addButton("pic/s04.gif", "第1-4个功能键", "第四个提示", 0);
		sm1.addButton("pic/s05.gif", "第1-5个功能键", "第五个提示", 0);
		sm1.addPanel("I第二个按键模板", "", 1 , 4);
		sm1.addButton("pic/s06.gif", "第2-1个功能键", "第2-1个提示", 1);
		sm1.addButton("pic/s07.gif", "第2-2个功能键", "第2-2个提示", 1);
		sm1.addPanel("I第三个按键模板", "", 2 , 5);
		sm1.addButton("pic/s08.gif", "第3-1个功能键", "第3-1个提示", 2);
		sm1.addButton("pic/s09.gif", "第3-2个功能键", "第3-2个提示", 2);
		sm1.addButton("pic/s10.gif", "第3-3个功能键", "第3-3个提示", 2);
		sm1.addPanel("I第五个按键模板", "", 3 , 5);
		sm1.addButton("pic/s11.gif", "第4-1个功能键", "第4-1个提示", 3);
		sm1.addPanel("I没有第四个模板", "", 4 , 5);
		sm1.addButton("pic/s12.gif", "第5-1个功能键", "第5-1个提示", 4);
		sm1.addButton("pic/s13.gif", "第5-2个功能键", "第5-2个提示", 4);
		sm1.addButton("pic/s14.gif", "第5-3个功能键", "第5-3个提示", 4);
		sm1.addButton("pic/s15.gif", "第5-4个功能键", "第5-4个提示", 4);
		sm1.addPanel("I哈哈", "", 5 , 5);
		sm1.addButton("pic/s16.gif", "什么也没有", "指我干嘛？", 5);
		sm1.setButtonPanelBackground(new Color(184, 207, 229));
		
		//第二个菜单////////////////////////////////
		sm2.setMenuLocation(40,10);		//设置坐标
		sm2.setMenuDimension(128, 400);	//设置大小
		sm2.setTitleHeight(35);
		sm2.addPanel("II第一个按键模板", "pic/titlebar021.gif", 0 , 5);
		sm2.addButton("pic/s01.gif", "第A-1个功能键", "第一个提示", 0);
		sm2.addButton("pic/s02.gif", "第A-2个功能键", "第二个提示", 0);
		sm2.addButton("pic/s03.gif", "第A-3个功能键", "第三个提示", 0);
		sm2.addPanel("II第二个按键模板", "pic/titlebar021.gif", 1 , 4);
		sm2.addButton("pic/s04.gif", "第B-1个功能键", "第2-1个提示", 1);
		sm2.addButton("pic/s05.gif", "第B-2个功能键", "第2-2个提示", 1);
		sm2.addButton("pic/s06.gif", "第B-3个功能键", "第2-3个提示", 1);
		sm2.addButton("pic/s07.gif", "第B-4个功能键", "第2-4个提示", 1);
		sm2.addPanel("II第三个按键模板", "pic/titlebar021.gif", 2 , 5);
		sm2.addButton("pic/s08.gif", "第C-1个功能键", "第3-1个提示", 2);
		sm2.addButton("pic/s09.gif", "第C-2个功能键", "第3-2个提示", 2);
		sm2.addButton("pic/s10.gif", "第C-3个功能键", "第3-3个提示", 2);
		sm2.addPanel("II哈哈", "pic/titlebar021.gif", 3 , 6);
		sm2.addButton("pic/s11.gif", "第D-1个功能键", "第4-1个提示", 3);
		sm2.addButton("pic/s12.gif", "第D-1个功能键", "第5-1个提示", 3);
		sm2.addButton("pic/s13.gif", "第D-2个功能键", "第5-2个提示", 3);
		sm2.addButton("pic/s14.gif", "第D-3个功能键", "第5-3个提示", 3);
		sm2.addButton("pic/s15.gif", "第D-4个功能键", "第5-4个提示", 3);
		sm2.addButton("pic/s16.gif", "D什么也没有", "指我干嘛？", 3);
		sm2.setButtonPanelBackground(new Color(222, 210, 252));
		
		
		//第三个菜单////////////////////////////////
		sm3.setMenuLocation(30,10);		//设置坐标
		sm3.setMenuDimension(123, 400);	//设置大小
		sm3.setTitleHeight(32);
		sm3.addPanel("III第一个按键模板", "pic/title.gif", 0 , 5);
		sm3.addButton("pic/s01.gif", "第A-1个功能键", "第一个提示", 0);
		sm3.addButton("pic/s02.gif", "第A-2个功能键", "第二个提示", 0);
		sm3.addButton("pic/s03.gif", "第A-3个功能键", "第三个提示", 0);
		sm3.addPanel("III第二个按键模板", "pic/title.gif", 1 , 4);
		sm3.addButton("pic/s04.gif", "第B-1个功能键", "第2-1个提示", 1);
		sm3.addButton("pic/s05.gif", "第B-2个功能键", "第2-2个提示", 1);
		sm3.addButton("pic/s06.gif", "第B-3个功能键", "第2-3个提示", 1);
		sm3.addButton("pic/s07.gif", "第B-4个功能键", "第2-4个提示", 1);
		sm3.addPanel("III第三个按键模板", "pic/title.gif", 2 , 5);
		sm3.addButton("pic/s08.gif", "第C-1个功能键", "第3-1个提示", 2);
		sm3.addButton("pic/s09.gif", "第C-2个功能键", "第3-2个提示", 2);
		sm3.addButton("pic/s10.gif", "第C-3个功能键", "第3-3个提示", 2);
		sm3.addPanel("III第五个按键模板", "pic/title.gif", 3 , 5);
		sm3.addButton("pic/s11.gif", "第D-1个功能键", "第4-1个提示", 3);
		sm3.addPanel("III没有第四个模板", "pic/title.gif", 4 , 5);
		sm3.addButton("pic/s12.gif", "第D-1个功能键", "第5-1个提示", 4);
		sm3.addButton("pic/s13.gif", "第D-2个功能键", "第5-2个提示", 4);
		sm3.addButton("pic/s14.gif", "第D-3个功能键", "第5-3个提示", 4);
		sm3.addButton("pic/s15.gif", "第D-4个功能键", "第5-4个提示", 4);
		sm3.addPanel("III哈哈", "pic/title.gif", 5 , 5);
		sm3.addButton("pic/s16.gif", "E什么也没有", "指我干嘛？", 5);
		sm3.setButtonPanelBackground(Color.WHITE);
		
		
		////////////////////////////////////
		sm1.initButtonPanelDimension();
		sm2.initButtonPanelDimension();
		sm3.initButtonPanelDimension();
		
		sm1.addMouseListener(this);
		sm2.addMouseListener(this);
		sm3.addMouseListener(this);
		bt.addActionListener(this);
		
		panelMenu.add(sm1);
		panelMenu.add(sm2);
		panelMenu.add(sm3);
		
		panelMain.add("North", tf);
		panelMain.add("South", bt);
		panelMain.add("Center", panelMenu);
		
		tf.setHorizontalAlignment( JTextField.CENTER );
		tf.setEditable(false);
		
		this.setContentPane(panelMain);
		this.setBounds(100, 50, 650, 600);
		this.setVisible(true);
		
		sm1.setInitMenu();
		sm2.setInitMenu();
		sm3.setInitMenu();
	}
	
	
	public void actionPerformed (ActionEvent ae) {
		System.out.println (":)" + sm1.getSelectButtonName());
	}
	
	/**=======================================================================**
	 *			MouseListener 监听
	 **=======================================================================**
	 */
	public void mouseClicked (MouseEvent me) {
		Object o = me.getSource();
	//	if(o == sm1) {
			System.out.println (sm1.getSelectButtonName());
	//	}
		if(o == sm2) {
			System.out.println (sm2.getSelectButtonName());
		}
		if(o == sm3) {
			System.out.println (sm3.getSelectButtonName());
		}
	}

	public void mousePressed (MouseEvent me) {
	}

	public void mouseReleased(MouseEvent me) {
	}

	public void mouseEntered (MouseEvent me) {
	}
	
	public void mouseExited (MouseEvent me) {
	}
	
	
	
	public static void main (String sd[]) {
		new TestSlitherMenu();
	}
	
	
}
