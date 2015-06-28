package com.hrms.worker.action;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;


public class HrmsToolString {

	 
	/**
	 * @param args
	 */
	public static void main(String[] args) {

//		try {
//			String  age=StringAge("1978-06-01 00:00:00.0", 10, "UTF-8");
//			System.out.println(age);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		System.out.println(randomAccount(5,"02"));
		
	}
	
	
    


	/*编者：徐新院
      * 时间：2015年6月10号
      * 功能：根据输入的出生日期来自动计算当前年龄
      * 
      * */
	public static int getSubAge(String content, int size, String encoding) throws Exception{
		Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
		int year = c.get(Calendar.YEAR); 
		int month = c.get(Calendar.MONTH); 
		
		int NowTime=year;
		
		if(encoding == null || encoding.equals("")){
		    throw new Exception("字符编码不能为空");
		   }
		   if(content == null){
		    throw new Exception("字符串内容不能为空");
		   }
		   if(size<0){
		    throw new Exception("获取的字节数不能小于0");
		   }
		   if(content.getBytes().length < size){
		    size = content.getBytes().length;
		   }
		   ByteArrayOutputStream out = new ByteArrayOutputStream();
		   int index = 0; //字符串的字符位置
		   int count = 0; //目前的字节数
		   while(count < size){
		    //当前的字节数目
		    count += content.substring(index, index+1).getBytes(encoding).length;
		    if(count<=size){
		      out.write(content.substring(index, index+1).getBytes(encoding));
		    }
		    index++;
		   }
		   String result = new String(out.toByteArray(),encoding);
		   int Result=Integer.parseInt(result);//出身日期
		   out.close();
		   return NowTime-Result;
		}
	
	
	/*编者：徐新院
     * 时间：2015年6月10号
     * 功能：从数据库获取出生日期，进行截取格式成2015-06-10形式
     * 
     * */
	 public static String getSubString(String content, int size, String encoding) throws Exception{
		 Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
			int year = c.get(Calendar.YEAR); 
			int month = c.get(Calendar.MONTH); 
			
			String result;
			
			if(encoding == null || encoding.equals("")){
			    throw new Exception("字符编码不能为空");
			   }
			   if(content == null){
			    throw new Exception("字符串内容不能为空");
			   }
			   if(size<0){
			    throw new Exception("获取的字节数不能小于0");
			   }
			   if(content.getBytes().length < size){
			    size = content.getBytes().length;
			   }
			   ByteArrayOutputStream out = new ByteArrayOutputStream();
			   int index = 0; //字符串的字符位置
			   int count = 0; //目前的字节数
			   while(count < size){
			    //当前的字节数目
			    count += content.substring(index, index+1).getBytes(encoding).length;
			    if(count<=size){
			      out.write(content.substring(index, index+1).getBytes(encoding));
			    }
			    index++;
			   }
			    result = new String(out.toByteArray(),encoding);
			 
			   out.close();
			   return result;
		
	  }
	 
	 
	 /*
		 * 根据年份和员工数量自动生成员工账号
		 * */
		 public static String randomAccount(int num,String departNo){
			String tempAccout;
			  Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR); 
				if(num<=9){
					tempAccout=year+departNo+"00"+num;
				}else if(num>=10&&num<=99){
					tempAccout=year+departNo+"0"+num;
				}else{
					tempAccout=year+departNo+""+num;
				}
				return tempAccout;
		  }
}
