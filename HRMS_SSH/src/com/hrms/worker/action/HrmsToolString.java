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
	
	
    


	/*���ߣ�����Ժ
      * ʱ�䣺2015��6��10��
      * ���ܣ���������ĳ����������Զ����㵱ǰ����
      * 
      * */
	public static int getSubAge(String content, int size, String encoding) throws Exception{
		Calendar c = Calendar.getInstance();//���Զ�ÿ��ʱ���򵥶��޸�
		int year = c.get(Calendar.YEAR); 
		int month = c.get(Calendar.MONTH); 
		
		int NowTime=year;
		
		if(encoding == null || encoding.equals("")){
		    throw new Exception("�ַ����벻��Ϊ��");
		   }
		   if(content == null){
		    throw new Exception("�ַ������ݲ���Ϊ��");
		   }
		   if(size<0){
		    throw new Exception("��ȡ���ֽ�������С��0");
		   }
		   if(content.getBytes().length < size){
		    size = content.getBytes().length;
		   }
		   ByteArrayOutputStream out = new ByteArrayOutputStream();
		   int index = 0; //�ַ������ַ�λ��
		   int count = 0; //Ŀǰ���ֽ���
		   while(count < size){
		    //��ǰ���ֽ���Ŀ
		    count += content.substring(index, index+1).getBytes(encoding).length;
		    if(count<=size){
		      out.write(content.substring(index, index+1).getBytes(encoding));
		    }
		    index++;
		   }
		   String result = new String(out.toByteArray(),encoding);
		   int Result=Integer.parseInt(result);//��������
		   out.close();
		   return NowTime-Result;
		}
	
	
	/*���ߣ�����Ժ
     * ʱ�䣺2015��6��10��
     * ���ܣ������ݿ��ȡ�������ڣ����н�ȡ��ʽ��2015-06-10��ʽ
     * 
     * */
	 public static String getSubString(String content, int size, String encoding) throws Exception{
		 Calendar c = Calendar.getInstance();//���Զ�ÿ��ʱ���򵥶��޸�
			int year = c.get(Calendar.YEAR); 
			int month = c.get(Calendar.MONTH); 
			
			String result;
			
			if(encoding == null || encoding.equals("")){
			    throw new Exception("�ַ����벻��Ϊ��");
			   }
			   if(content == null){
			    throw new Exception("�ַ������ݲ���Ϊ��");
			   }
			   if(size<0){
			    throw new Exception("��ȡ���ֽ�������С��0");
			   }
			   if(content.getBytes().length < size){
			    size = content.getBytes().length;
			   }
			   ByteArrayOutputStream out = new ByteArrayOutputStream();
			   int index = 0; //�ַ������ַ�λ��
			   int count = 0; //Ŀǰ���ֽ���
			   while(count < size){
			    //��ǰ���ֽ���Ŀ
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
		 * ������ݺ�Ա�������Զ�����Ա���˺�
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
