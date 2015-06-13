<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.hrms.pojo.Worker"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="com.hrms.pojo.Department"%>


<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   

  </head>
  
  <body>

	<s:iterator value="#session.department1">
	  <s:property value="departmentName"/>
	</s:iterator>
	
	<hr>
	<%--
	ArrayList<Department> depart=(ArrayList<Department>)ActionContext.getContext().getSession().get("department1");
  out.println("	<select name='user' size='1'>");
  for(int i=0;i<depart.size();i++){
    out.println("<option value='"+depart.get(i).getDepartmentName()+"'>"+depart.get(i).getDepartmentName()+"</option>");
       }
         out.println("	</select>");
	--%>
    <a href="workerAdd.jsp">注册页面</a><br><!-- WorkerAdd -->
	<a href="workerCheck.jsp">修改页面</a><br><!-- Select -->
	<a href="workerShow.jsp">显示页面</a><!-- SelectManager -->
	<a href="SelectAllWorkersManager">管理页面</a><!-- SelectAllWorkersManager -->
	             
  </body>
</html>
