import java.awt.*;
import java.applet.*;
import java.awt.event.*;

public class Pic_show extends Applet implements MouseListener//,ActionListener
{  

   Button pic_first,pic_next,pic_forword,pic_last,pic_auto,pic_huan;
   	final int number=10; int count=0;
    Image[] card=new Image[number];



   public void init()

   {  setLayout(new BorderLayout());
  
       FlowLayout flow=new FlowLayout();
       flow.setAlignment(FlowLayout.CENTER);
       
       Panel p1=new Panel();
       p1.setLayout(flow);
       
      pic_first=new Button("��һ��");
      pic_forword=new Button("��һ��");
      pic_next=new Button("��һ��");
      pic_last=new Button("���һ��");
      pic_auto=new Button("�Զ�����");
      pic_huan=new Button("�õ�Ƭ");
      
//      add(g,BorderLayout.CENTER);
      add(p1,BorderLayout.SOUTH);
      p1.add(pic_first);
      p1.add(pic_forword);
      p1.add(pic_next);
      p1.add(pic_last);
      p1.add(pic_auto);
      p1.add(pic_huan);
      
      addMouseListener(this);
      for(int i=0;i<number;i++)
          {  card[i]=getImage(getCodeBase(),"jiafei"+i+".jpg");      }
   }
    
    
    public void paint(Graphics g)
     {  if((card[count])!=null)
        g.drawImage(card[count],10,10,
                 card[count].getWidth(this),card[count].getHeight(this),this);
     } 
     
     public void mousePressed(MouseEvent e)
     {  count++;
        if(count>number)
          count=0;
       repaint();
     }
   
   public void mouseReleased(MouseEvent e){}
   public void mouseEntered(MouseEvent e){}
   public void mouseExited(MouseEvent e){}
   public void mouseClicked(MouseEvent e){}
}

class huan extends Applet implements MouseListener

{  final int number=10; int count=0;
   Image[] card=new Image[number];

   public void init()
   {  addMouseListener(this);
      for(int i=0;i<number;i++)
          {  card[i]=getImage(getCodeBase(),"jiafei"+i+".jpg");            }
   }

   public void paint(Graphics g)
   {  if((card[count])!=null)
     g.drawImage(card[count],10,10,
               card[count].getWidth(this),card[count].getHeight(this),this);
   }

   public void mousePressed(MouseEvent e)
   {  count++;
      if(count>number)
       count=0;
     repaint();
   }

   public void mouseReleased(MouseEvent e){}
   public void mouseEntered(MouseEvent e){}
   public void mouseExited(MouseEvent e){}
   public void mouseClicked(MouseEvent e){}
}

