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
 <script type="text/javascript">
 
 </script>
    <title>修改密码</title>
  
</head>
  
  <body>
<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="width: 85%;">
      <h1 class="page-header">工资查询</h1>
                <div class="row">
                <div class="col-sm-8">
                <label>请登录系统点击工资查询查看个人工资详细信息</label>
				</div>
                </div>
             </div>
  </body>
</html>
