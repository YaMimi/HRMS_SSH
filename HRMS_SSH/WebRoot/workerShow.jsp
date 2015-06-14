<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="com.hrms.pojo.*"%>
<%@ page language="java" import="com.hrms.pojo.Department"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 Worker activeWorker = (Worker)session.getAttribute("activeWorker");

  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 %>
 <s:action name="SelectManager" executeResult="false" namespace="/"/>
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
    <%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>

    <div class="container-fluid">
        <div class="row">
            
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">个人信息</h1>
                
                <i>以下您的全部个人信息：<abbr title="如果您发现自己的信息登记有误或者出现了改动，请到人事部进行修改。">信息有误？</abbr></i><br><br>
                <form class="form-horizontal">
                <table class="table table-bordered table-hover">
				<tr>
	              <th style="padding-left: 21px;"><strong>姓名</strong></th>
	              <th style="padding-left: 21px;"></i>员工号</strong></th>
	              <th style="padding-left: 21px;"><strong>性别</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_name" placeholder="姓名" value="<%=activeWorker.getWorkerName() %>" required></th>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_account" placeholder="员工号" value="<%=activeWorker.getWorkerNo() %>" required></th>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_sex" placeholder="性别" value=" <%=activeWorker.getWorkerSex() %>" required></th>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong>部门</strong></th>
	              <th style="padding-left: 21px;"><strong>职称</strong></th>
	              <th style="padding-left: 21px;"><strong>入职时间</strong></th>
	              
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_department" placeholder="部门" value="<%=activeWorker.getDepartment().getDepartmentName() %>" required></th>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_permission" placeholder="职称" value="<%if(activeWorker.getWorkerPermission()==1) {%>普通员工<%}
	              if(activeWorker.getWorkerPermission()==2) {%>组长<%}
	               if(activeWorker.getWorkerPermission()==3){%>部门经理<%}
	               if(activeWorker.getWorkerPermission()==4) {%>总经理<%} %> " required></th>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_entrytime" placeholder="入职时间 " value="<%=sdf.format(activeWorker.getWorkerEntryDate()) %>" required></th>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong>身份证号</strong></th>
	              <th style="padding-left: 21px;"><strong>出生日期</strong></th>
	              <th style="padding-left: 21px;"><strong>年龄</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_person_id" placeholder="身份证号" value="<%=activeWorker.getWorkerId() %>" required></th>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_born" placeholder="出生日期 " value="<%=sdf.format(activeWorker.getWorkerBirthDate()) %>" required></th>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_age" placeholder="年龄 " value="" required></th>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong>籍贯</strong></th>
	              <th style="padding-left: 21px;"><strong>地址</strong></th>
	              <th style="padding-left: 21px;"><strong>血型</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_origin" placeholder="籍贯 " value="<%=activeWorker.getWorkerBirthPlace()%>" required></th>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_address" placeholder="地址" value="<%=activeWorker.getWorkerAddress()%>" required></th>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_bloodtype" placeholder="血型" value="<%=activeWorker.getWorkerBloodType() %>" required></th>
	            </tr>
	            <tr>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong>政治面貌</strong></th>
	              <th style="padding-left: 21px;"><strong>民族</strong></th>
	              <th style="padding-left: 21px;"><strong>教育水平</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_political" placeholder="政治面貌" value="<%=activeWorker.getWorkerPolitical() %>" required></th>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_nationality" placeholder="民族 " value="<%=activeWorker.getWorkerEthnic() %>" required></th>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_education" placeholder="教育水平 " value="<%=activeWorker.getWorkerEducation()%>" required></th>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong>电话</strong></th>
	              <th style="padding-left: 21px;"><strong>国籍</strong></th>
	              <th style="padding-left: 21px;"><strong>密码</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_tel" placeholder="电话 " value="<%=activeWorker.getWorkerPhone() %>" required></th>
	              <th><input type="text" class="form-control " readonly="readonly" name="worker_lastattend" placeholder="国籍" value="<%=activeWorker.getWorkerNationality() %>" required></th>
	              <th><input type="password" class="form-control " readonly="readonly" name="worker_password" placeholder="密码 " value="<%=activeWorker.getPassword()%>" required></th>
	            </tr>
                </table>
                </form>
            </div>
        </div>
    </div>
</body>
</html>