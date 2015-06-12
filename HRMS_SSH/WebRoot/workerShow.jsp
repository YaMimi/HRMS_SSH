<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="com.hrms.pojo.Worker"%>
<%@ page language="java" import="com.hrms.pojo.Department"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
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
    <div class="container-fluid">
        <div class="row">
            
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">个人信息</h1>
                <div class="row">
                <div class="col-sm-8">
                <label>请填写员工信息然后点击修改按钮进行修改操作：</label>
				</div>
				<form action="Select" method="post">
				<div class="col-sm-4">
				<button class="btn btn-default" type="submit" style="width: 40%; float: right;"><i class="icon-ok-sign"></i> 修改信息</button>
				</div>
                </div>
                <table class="table table-bordered table-hover">
				<tr>
	              <th style="padding-left: 21px;"><strong><center>姓名</center></strong></th>
	              <th style="padding-left: 21px;"></i><center>员工号</center></strong></th>
	              <th style="padding-left: 21px;"><strong><center>性别</center></strong></th>
	            </tr>
	            <tr>
	              <td ><center> ${workername }</center>  </td>
	              <td><center>${workerNo }</center></td>
	              <td><center>
	              ${workerSex}</center>
	              </td>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong><center>部门</center></strong></th>
	              <th style="padding-left: 21px;"><strong><center>职称</center></strong></th>
	              <th style="padding-left: 21px;"><strong><center>入职时间</center></strong></th>
	              
	            </tr>
	            <tr>
	              <td><center>
	         	<%--
	ArrayList<Department> depart=(ArrayList<Department>)ActionContext.getContext().getSession().get("department1");
  
    out.println(depart.get(0).getDepartmentName());
   
	        --%>
	        ${workerDepartment }
	        </center>
	              </td>
	              <td><center>${workerPermission }</center>
	            </td>
	              <td><center>${workerEntryDate }</center></td>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong><center>身份证号</center></strong></th>
	              <th style="padding-left: 21px;"><strong><center>出生日期</center></strong></th>
	              <th style="padding-left: 21px;"><strong><center>年龄</center></strong></th>
	            </tr>
	            <tr>
	              <td><center>${workerId}</center></td>
	              <td><center>${workerBirthDate }</center></td>
	              <td><center>${workerAge }</center></td>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong><center>籍贯</center></strong></th>
	              <th style="padding-left: 21px;"><strong><center>地址</center></strong></th>
	              <th style="padding-left: 21px;"><strong><center>血型</center></strong></th>
	            </tr>
	            <tr>
	              <td><center>${workerBirthPlace }</center></td>
	              <td><center>${workerAddress }</center></td>
	              <td><center>${workerBloodType }</center></td>
	            </tr>
	            <tr>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong><center>政治面貌</center></strong></th>
	              <th style="padding-left: 21px;"><strong><center>民族</center></strong></th>
	              <th style="padding-left: 21px;"><strong><center>教育水平</center></strong></th>
	            </tr>
	            <tr>
	              <td><center>${workerPolitical }</center></td>
	              <td><center>${workerEthnic }</center></td>
	              <td><center>${workerEducation }</center></td>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong><center>电话</center></strong></th>
	              <th style="padding-left: 21px;"><strong><center>国籍</center></strong></th>
	              <th style="padding-left: 21px;"><strong><center>密码</center></strong></th>
	            </tr>
	            <tr>
	              <td><center>${workerPhone }</center></td>
	              <td><center>${workerNationality }</center></td>
	              <td><center>${password }</center></td>
	            </tr>
                </table>
                </form>
            </div>
        </div>
    </div>
</body>
</html>