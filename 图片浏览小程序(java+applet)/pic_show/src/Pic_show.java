import java.awt.*;
import java.applet.*;
import java.awt.event.*;

public class Pic_show extends Applet implements ActionListener
{  

   Button pic_first,pic_next,pic_forword,pic_last,pic_goto,pic_fangda,pic_suoxiao,
          mid_play,mid_loop,mid_stop;  
   static int number=10; 
   static int count=0;
   static int pan;
   Label yeshu;
   AudioClip clip;
   TextField text1;
   static Image[] card=new Image[number];
   Mycanvas canvas;    
   static String str=String.valueOf(count);
   public void init()

   {  setLayout(new BorderLayout());
  
      FlowLayout flow=new FlowLayout();
      flow.setAlignment(FlowLayout.CENTER);
     
      clip=getAudioClip(getCodeBase(),"mytest.mid");
      text1=new TextField("1",2);
      Panel p1=new Panel();
      Panel p2=new Panel();
      p1.setLayout(flow);
      p2.setLayout(flow);
      pic_first=new Button("第一张");
      pic_forword=new Button("上一张");
      pic_next=new Button("下一张");
      pic_last=new Button("最后一张");
      pic_goto=new Button("转到");
      pic_fangda=new Button("放大");
      pic_suoxiao=new Button("缩小");
      mid_play=new Button("开始播放");
      mid_loop=new Button("循环播放");
      mid_stop=new Button("停止播放");
      canvas=new Mycanvas();
      add(p2,BorderLayout.SOUTH);
      add(canvas,BorderLayout.CENTER);
      add(p1,BorderLayout.NORTH);
      String bbb=String.valueOf(number);
      yeshu=new Label("1");
      p1.add(yeshu);
      p1.add(new Label("/"));
      p1.add(new Label(bbb));
      p1.add(pic_first);
      p1.add(pic_forword);
      p1.add(pic_next);
      p1.add(pic_last);
      p1.add(text1);
      p1.add(pic_goto);
      p1.add(pic_fangda);
      p1.add(pic_suoxiao);
      p2.add(mid_play);
      p2.add(mid_loop);
      p2.add(mid_stop);
      pic_first.addActionListener(this);
      pic_forword.addActionListener(this);
      pic_next.addActionListener(this);
      pic_last.addActionListener(this);
      pic_goto.addActionListener(this);
      pic_fangda.addActionListener(this);
      pic_suoxiao.addActionListener(this);
      mid_play.addActionListener(this);
      mid_loop.addActionListener(this);
      mid_stop.addActionListener(this);

        for(int i=0;i<number;i++)
          {  card[i]=getImage(getCodeBase(),"a"+(i+1)+".gif"); }      
    }

   public void stop()
   {clip.stop();}

   public void actionPerformed(ActionEvent e)

   {          
      if(e.getSource()==pic_first)
      {   pan=0;
      	  count=0;
      	  yeshu.setText(String.valueOf(count+1));
      	  text1.setText(String.valueOf(count+1));
      	  pic_forword.setEnabled(false);
          canvas.repaint(); 
          pic_next.setEnabled(true);
          	
      }
       else if(e.getSource()==pic_forword)
      {    pan=0;     		
      		if(count<=0)
      		{pic_forword.setEnabled(false);}
      		else
      		{count--;
      		yeshu.setText(String.valueOf(count+1));
      		text1.setText(String.valueOf(count+1));
			canvas.repaint();
			pic_next.setEnabled(true);}
			      		
      }
       else if(e.getSource()==pic_next)
      {   pan=0;
      		if (count>=number-1)
      		{pic_next.setEnabled(false);}
      		else
      		{count++;
      		yeshu.setText(String.valueOf(count+1));
      		text1.setText(String.valueOf(count+1));
			canvas.repaint();
			pic_forword.setEnabled(true);
      		}
      		
      }
      else if(e.getSource()==pic_last)
      {   pan=0;
            count = number-1;
      		pic_next.setEnabled(false);
			canvas.repaint();	
			pic_forword.setEnabled(true);
			yeshu.setText(String.valueOf(count+1));
			text1.setText(String.valueOf(count+1));
      		
      }
      else if(e.getSource()==pic_goto||e.getSource()==text1)
      {   pan=0;
        int num=0;
        try
        {num=Integer.parseInt(text1.getText());}
        catch(NumberFormatException event)
        {text1.setText("张数");}
        count=num-1;
        yeshu.setText(String.valueOf(count+1));
        canvas.repaint(); 
      }
      else if(e.getSource()==pic_fangda)
      {
        pan=1;
        canvas.repaint(); 
      }
       else if(e.getSource()==pic_suoxiao)
      {
        pan=2;
        canvas.repaint();      
      }
      else if(e.getSource()==mid_play)
      {
        clip.play();
      }
      else if(e.getSource()==mid_loop)
      {
         clip.loop();
      }
      if(e.getSource()==mid_stop)
      {
         clip.stop();
      }

   }
    
}
class Mycanvas extends Canvas
{
	float width, height, pWidth, pHeight,bi;

	public void paint(Graphics g)
	{   
	if((Pic_show.card[Pic_show.count])!=null)
		{
			if(Pic_show.pan==0)
			{
			width = Pic_show.card[Pic_show.count].getWidth(this);
			height = Pic_show.card[Pic_show.count].getHeight(this);
			pWidth = getSize().width-20;
			pHeight = getSize().height-20;

			if(width>=pWidth || height>=pHeight)
			{
				float x = height/width;
				if(x >= 0.75)
				{
					width = width*pHeight/height;
					height = pHeight;
				}
				else
				{
					height = height*pWidth/width;
					width = pWidth;
				}
			}
			g.drawImage(Pic_show.card[Pic_show.count], (int)(pWidth-width+20)/2, 10, (int)width,  (int)height, this);}
		    else if(Pic_show.pan==1)
		    {   bi=width/height;
		        height=(int)(width*1.1/bi);
		        width=(int)(width*1.1);
		    	g.drawImage(Pic_show.card[Pic_show.count], (int)(pWidth-width+20)/2, 10, (int)width,  (int)height, this);
		    }
		    else if(Pic_show.pan==2)
		    {   bi=width/height;
		        height=(int)(width*0.9/bi);
		        width=(int)(width*0.9);
		    	g.drawImage(Pic_show.card[Pic_show.count], (int)(pWidth-width+20)/2, 10, (int)width,  (int)height, this);
		    }
		}
	}
}




