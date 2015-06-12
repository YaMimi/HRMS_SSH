<%
/**
*页面：请假申请和查询界面
*作者：杨明杰
*更新时间：2015-6-10
*/
 %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.hrms.pojo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Worker activeWorker = (Worker)session.getAttribute("activeWorker");
List<Vacation> vacationlist = (List<Vacation>)session.getAttribute("vacationlist");
if(vacationlist==null)
{
	%><jsp:forward page="/WorkerVacationSearch"/><% 
}
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

List<Vacation> VacationList = vacationlist;
vacationlist = null;
session.setAttribute("vacationlist", vacationlist);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <link  href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/font-awesome.min.css" rel="stylesheet"/>
    <link  href="css/dashboard.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
    <script src="./js/jquery-2.1.3.min.js"></script>
    <script src="./js/jquery-ui.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script>
  				$(function() {
  				   $( "#datepicker_start" ).datepicker({dateFormat: "yy-mm-dd", minDate:"-0D"});
  				   $( "#datepicker_end" ).datepicker({dateFormat: "yy-mm-dd", minDate:"-0D"});
  				});
  	</script>
    <style>
        * {
            font-family: 'FontAwesome',"Microsoft YaHei" ! important;
        }
    </style>
    <title>请假系统</title>

  </head>
  
  <body>
    <%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
    		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">请假系统</h1>
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">请假申请</div>
							<div class="panel-body">
							<div style="padding-right: 15px; padding-left: 15px;">
							  	<div class="form-horizontal">
							  		<div class="form-group">
							  			<input type="text" class="form-control " readonly="readonly" name="" placeholder="员工姓名 " value="<%=activeWorker.getWorkerName() %>" required>
							  		</div>
							  		<div class="form-group">
							  			<input type="text" class="form-control" readonly="readonly" name="" placeholder="员工编号 " value="<%=activeWorker.getWorkerNo() %>" required>
							  		</div>
							  	<form action="WorkerVacationApply" method="post">
							  		<div class="form-group">
							  		<!-- ’病假’,’事假’’,’工伤假’,’婚假’,’产假’,’’年休假,’公假’,’丧假’,’其他’ -->
							  			<th>
							  				<select name="vacation.vacationType" class="form-control">
							  					<option value="病假" selected='selected'>病假</option>
							  					<option value="事假">事假</option>
							  					<option value="工伤假">工伤假</option>
							  					<option value="婚假">婚假</option>
							  					<option value="产假">产假</option>
							  					<option value="年休假">年休假</option>
							  					<option value="公假">公假</option>
							  					<option value="丧假">丧假</option>
							  					<option value="其他">其他</option>
							  				</select>
							  			</th>
							  		</div>
							  		<div class="form-group ">
							  			<textarea class="form-control" rows="3" name="vacation.vacationReason" placeholder="请假原因" required  autofocus></textarea>
							  		</div>
							  		<div class="form-group form-inline">
							  			<input id="datepicker_start" class="form-control" type="text" name="vacation.vacationStartDate" style="width:40%" placeholder="请假起始时间" required>
					  					<!--<input type="date" class="form-control"  name="" style="width:40%">-->
					  					<label for="apply_start" class="control-label" style="width:10%">至</label>
					  					<input id="datepicker_end" class="form-control pull-right" type="text" name="vacation.vacationEndDate" style="width:40%" placeholder="请假结束时间" required>
					  					<!-- <input type="date" class="form-control pull-right" style="width:40%">-->
							  		</div>
							  		<div class="form-group form-inline ">
							  			<button class="btn btn-primary" type="submit" style="width:65%;">提交申请</button>
							  			<button class="btn btn-danger pull-right" type="reset" style="width:30%;">重置</button>
							  		</div>
							  	</form>
							  	</div>
							  	</div>
							  	<%
  					  		if(session.getAttribute("status")!=null){
  					  			if(session.getAttribute("status").toString().equals("1")){
  					  				out.print("<div class='alert alert-success' style='margin-bottom:0px;' role='alert'><i class='icon-ok-sign' aria-hidden='true'></i> 申请成功，请等待审核！</div>");
  					  				session.setAttribute("status",null);
  					  			}
  					  		}
  					  		 %>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">请假记录</div>
							<div class="panel-body ">
							  	<table class="table table-bordered table-hover">
						            <tr>
						              <th><strong>序号</strong></th>
						              <th><strong>开始时间</strong></th>
						              <th><strong>结束时间</strong></th>
						              <th><strong>请假类型</strong></th>
						              <th><strong>请假原因</strong></th>
						              <th><strong>请假结果</strong></th>
						            </tr>
						            <%int i = 1 ;%>
						            <%if(VacationList.size()>0) {%>
						            	<%for(Vacation vacation : VacationList) {%>
						            	<tr>
							              <th><%=i++ %></th>
							              <th><%=sdf.format(vacation.getVacationStartDate()) %></th>
							              <th><%=sdf.format(vacation.getVacationEndDate()) %></th>
							              <th><%=vacation.getVacationType() %></th>
							              <th><%=vacation.getVacationReason() %></th>
							              <%if(vacation.getVacationResult().toString().equals("0")) {%><th>待审核</th><%} %>
							              <%if(vacation.getVacationResult().toString().equals("1")) {%><th>批准</th><%} %>
							              <%if(vacation.getVacationResult().toString().equals("2")) {%><th>驳回</th><%} %>
							            </tr>
						            	<%} %>
						            	<%i=1; %>
						            <%} %>
						            
						        </table>
							</div>
						</div>
					</div>
				</div>
            </div>
  </body>
</html>
