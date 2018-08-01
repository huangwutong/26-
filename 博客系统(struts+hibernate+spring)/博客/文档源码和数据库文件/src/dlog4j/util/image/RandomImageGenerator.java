/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package dlog4j.util.image;

import java.awt.*;
import java.awt.image.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import org.apache.commons.lang.RandomStringUtils;
/**
 * 随即图片生成器
 * 该类用于用户注册时候需要用户根据图片内容进行填写正确后方可注册
 * @author Liudong
 */
public class RandomImageGenerator {
    
    public static String random() {
        return RandomStringUtils.randomNumeric(4);
    }
    /**
     * 根据要求的数字生成图片,背景为白色,字体大小16,字体颜色黑色粗体
     * @param num	要生成的数字
     * @param out	输出流
     * @throws IOException
     */
    public static void render(String num, OutputStream out) throws IOException{
        if(num.getBytes().length>4)
            throw new IllegalArgumentException("The length of param num cannot exceed 4.");
        int width = 40;
        int height = 15;
        BufferedImage bi = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);        
        Graphics2D g = (Graphics2D)bi.getGraphics();
        g.setColor(Color.WHITE);
        g.fillRect(0,0,width,height);
        Font mFont = new Font("Tahoma", Font.PLAIN, 14);
        g.setFont(mFont);
        g.setColor(Color.BLACK);
        g.drawString(num,2,13);
        ImageIO.write(bi,"jpg",out);
    }
    
    public static void main(String[] args) throws IOException{
        String num = random();
        System.out.println(num);
        render(num,new FileOutputStream("D:\\test.jpg"));
        System.out.println("Image generated.");
    }
}
