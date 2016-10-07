package com.zlzkj.app.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class createImg {

 BufferedImage image;

 void createImage(String fileLocation) {
  try {
   FileOutputStream fos = new FileOutputStream(fileLocation);
   BufferedOutputStream bos = new BufferedOutputStream(fos);
   JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(bos);
   encoder.encode(image);
   bos.close();
  } catch (Exception e) {
   e.printStackTrace();
  }
 }

 public void graphicsGeneration(String idnum,String imgurl) {

  int imageWidth = 400;// 图片的宽度

  int imageHeight = 400;// 图片的高度

  image = new BufferedImage(imageWidth, imageHeight,
  BufferedImage.TYPE_INT_RGB);
  Graphics graphics = image.getGraphics();
  graphics.setColor(Color.red);
  
 
  String [] biaohao=idnum.split("G");
  int a=Integer.parseInt(biaohao[1].substring(9));
  int b=Integer.parseInt(biaohao[1].substring(9,18));
 //System.out.print(b);
  int l=0;
  int weishu[]=new int[36];
  for(l=17;l>=9;l--)
  {
	  weishu[l]=b%10;
	  b=b/10;  
	  System.out.print(weishu[l]);
  }
  for(l=8;l>=0;l--)
  {
	  weishu[l]=a%10;
	  a=a/10;  
	  System.out.print(weishu[l]);
  }
  for(l=31;l>=18;l--)
  {
	  weishu[l]=(int) (Math.random()*10);  
	  System.out.print(weishu[l]);
	  
  }
  l=0;
  for(int j=0;j<8;j++)
  for(int k=0;k<4;k++)//b r g b
	  if(l<36)
  {
		  if(weishu[l]==0)
		  {
			  graphics.setColor(Color.black);
			  graphics.fillRect(0+100*k, 0+50*j, 50, 50);  
			  graphics.setColor(Color.black);
			  graphics.fillRect(50+100*k, 0+50*j, 50, 50);
		  }
		  else if(weishu[l]==1)
		  {
			  graphics.setColor(Color.black);
			  graphics.fillRect(0+100*k, 0+50*j, 50, 50);  
			  graphics.setColor(Color.red);
			  graphics.fillRect(50+100*k, 0+50*j, 50, 50);
		  }
	  
		  else if(weishu[l]==2)
		  {
			  graphics.setColor(Color.black);
			  graphics.fillRect(0+100*k, 0+50*j, 50, 50);  
			  graphics.setColor(Color.green);
			  graphics.fillRect(50+100*k, 0+50*j, 50, 50);
		  }
		  else if(weishu[l]==3)
		  {
			  graphics.setColor(Color.black);
			  graphics.fillRect(0+100*k, 0+50*j, 50, 50);  
			  graphics.setColor(Color.blue);
			  graphics.fillRect(50+100*k, 0+50*j, 50, 50);
		  }
	  
		  else if(weishu[l]==4)
		  {
			  graphics.setColor(Color.red);
			  graphics.fillRect(0+100*k, 0+50*j, 50, 50);  
			  graphics.setColor(Color.black);
			  graphics.fillRect(50+100*k, 0+50*j, 50, 50);
		  }
		  else if(weishu[l]==5)
		  {
			  graphics.setColor(Color.red);
			  graphics.fillRect(0+100*k, 0+50*j, 50, 50);  
			  graphics.setColor(Color.red);
			  graphics.fillRect(50+100*k, 0+50*j, 50, 50);
		  }
		  else if(weishu[l]==6)
		  {
			  graphics.setColor(Color.red);
			  graphics.fillRect(0+100*k, 0+50*j, 50, 50);  
			  graphics.setColor(Color.green);
			  graphics.fillRect(50+100*k, 0+50*j, 50, 50);
		  }
		  else if(weishu[l]==7)
		  {
			  graphics.setColor(Color.red);
			  graphics.fillRect(0+100*k, 0+50*j, 50, 50);  
			  graphics.setColor(Color.blue);
			  graphics.fillRect(50+100*k, 0+50*j, 50, 50);
		  }
	  
		  else if(weishu[l]==8)
		  {
			  graphics.setColor(Color.green);
			  graphics.fillRect(0+100*k, 0+50*j, 50, 50);  
			  graphics.setColor(Color.black);
			  graphics.fillRect(50+100*k, 0+50*j, 50, 50);
		  }
	  
		  else if(weishu[l]==9)
		  {
			  graphics.setColor(Color.green);
			  graphics.fillRect(0+100*k, 0+50*j, 50, 50);  
			  graphics.setColor(Color.red);
			  graphics.fillRect(50+100*k, 0+50*j, 50, 50);
		  }	  
	l++;  
  }

  /*graphics.fillRect(100, 100, imageWidth/2, imageHeight/2);
  graphics.setColor(Color.blue);
  graphics.fillRect(0, 0, 50, 50);
  graphics.setColor(Color.ORANGE);
  graphics.setFont(new Font("宋体",Font.BOLD,20));
  graphics.drawString("姓名 : " + name, 50, 75);
  graphics.drawString("学号 : " + id, 50, 150);
  graphics.drawString("班级 : " + classname, 50, 225);*/
  // ImageIcon imageIcon = new ImageIcon(imgurl);
  // graphics.drawImage(imageIcon.getImage(), 230, 0, null);

  // 改成这样:
  BufferedImage bimg = null;
  try {
   bimg = javax.imageio.ImageIO.read(new java.io.File(imgurl));
  } catch (Exception e) {
  }

  if (bimg != null)
   graphics.drawImage(bimg, 230, 0, null);
   graphics.dispose();

  createImage(imgurl);

 }

 public static void main(String[] args) {
  createImg cg = new createImg();
  try {
   cg.graphicsGeneration("#G094544832959464222", "D://2.jpg");
  } catch (Exception e) {
   e.printStackTrace();
  }
 }
}