<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="com.hrms.pojo.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 Worker activeWorker = (Worker)session.getAttribute("activeWorker");
 %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head lang="zh-CN">
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <link  href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/font-awesome.min.css" rel="stylesheet"/>
    <link  href="css/dashboard.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="plugin/jquery-ui-1.11.4.custom/jquery-ui.css">
    <script src="./js/jquery-2.1.3.min.js"></script>
    <script src="plugin/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <style>
        * {
            font-family: 'FontAwesome',"Microsoft YaHei" ! important;
        }
    </style>
    <script>
  		$(function() {
  			$( "#datepicker_start" ).datepicker({dateFormat: "yy-mm-dd"});
  		});
  	</script>

 <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <title>主页</title>
</head>
  
  <body>

	<!--  
    <a href="workerAdd.jsp">注册页面</a><br><!-- WorkerAdd -->   
	<!--  <a href="workerCheck.jsp">修改页面</a><br><!-- Select -->
	<!-- <a href="workerShow.jsp">显示页面</a><!-- SelectManager -->
	<!-- <a href="SelectAllWorkersManager">管理页面</a><!-- SelectAllWorkersManager -->
	<form action="UpdatePassword" method="post">
	      <input type="hidden" value="<%=activeWorker.getWorkerOid() %>" name="workerOid">
	          <table class="table table-bordered table-hover">
				<tr>
	              <th style="padding-left: 21px;"><strong>旧密码</strong></th>
	              <th><input type="password" class="form-control " name="worker.password" placeholder="旧密码" value="" required></th>
	           </tr>
	            <tr>
	              <th style="padding-left: 21px;"></i>新密码</strong></th>
	              <th><input type="password" class="form-control " name="password1" placeholder="新密码" value="" required></th>
	           </tr>
	              <th style="padding-left: 21px;"><strong>确认密码</strong></th>
	              <th><input type="password" class="form-control " name="password2" placeholder="确认密码" value="" required></th>
	            </tr>
	            </table>
	            <center>
	            <button class="btn btn-default" type="reset" style="width: 40%; float: right;"><i class="icon-ok-sign" "></i> 重置</button>
	            <button class="btn btn-default" type="submit" style="width: 40%; float: right;"><i class="icon-ok-sign"></i> 确认</button>
	           </center>
	    
                </form>
      
  </body>
</html>
