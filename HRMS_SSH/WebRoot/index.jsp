<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hrms.pojo.*" %>
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
    <script src="./js/jquery-2.1.3.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <style>
        * {
            font-family: 'FontAwesome',"Microsoft YaHei" ! important;
        }
    </style>
    <title>主页</title>
  </head>
  
  <body>
    <%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
  </body>
</html>
