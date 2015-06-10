<%@ page import="com.hrms.pojo.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <link  href="./css/bootstrap.min.css" rel="stylesheet"/>
    <link href="./css/font-awesome.min.css" rel="stylesheet"/>
    <link  href="./css/dashboard.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="./css/jquery-ui.css">
    <script src="./js/jquery-2.1.3.min.js"></script>
    <script src="./js/jquery-ui.js"></script>
    <script src="./js/bootstrap.min.js"></script>
	<style>
        * {
            font-family: 'FontAwesome',"Microsoft YaHei" ! important;
        }
    </style>
    <title>部门添加</title>
  </head>
  
  <body>
               </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">新增部门</h1>
                
                <i>请在以下表单中填写准备新增部门信息：</i>
                <table class="table" style="width:500px;">
	                <tr>
	                		<th>功能简介</th>
						    <th><i class="icon-ok-sign"></i> 保存新增</th>
						    <th><i class="icon-repeat"></i> 重置表单</th>
				    </tr>
			    </table>
                <table class="table table-bordered table-hover">
				<tr>
	              <th><strong>部门编号</strong></th>
	              <th><strong>部门名称</strong></th>
	              <th><strong>父部门编号</strong></th>
	              <th><strong>父部门名称</strong></th>
	              <th colspan="2"><strong>操作</strong></th>
	            </tr>
	            <form action='DepartmentInsert'>
		            <tr>
		              <th><input type="text" class="form-control" name="department.DepartmentNo " placeholder="新增部门编号 " required></th>
		              <th><input type="text" class="form-control" name="department.DepartmentName" placeholder="新增部门名称" required></th>
		              <th><input type="text" class="form-control" name="department.getDepartment().DepartmentNo" placeholder="父部门编号（没有则填写本部门编号） " required></th>
		              <th><input type="text" class="form-control" name="department.getDepartment().DepartmentName" placeholder="父部门名称（没有则填写本部门名称） " required></th>
		              <th style="width:10px;"><button class="crlbut editbut" type="submit"><i class="icon-large icon-ok"></i></button></th>	        
		              </form>
		              <th style="width:10px;"><button class="crlbut delbut" type="reset"><i class="icon-large icon-repeat"></i></button></th>
		            </tr>

                </table>
                </div>
  </body>
</html>
