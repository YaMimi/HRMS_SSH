<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hrms.pojo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Worker activeWorker = (Worker)session.getAttribute("activeWorker");
List<Vacation> approvevacationlist = (List<Vacation>)session.getAttribute("approvevacationlist");
if(approvevacationlist==null)
{
	%><jsp:forward page="/ApproveVacationSearch"/><% 
}
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

List<Vacation> ApproveVacationList = approvevacationlist;
approvevacationlist = null;
session.setAttribute("approvevacationlist", approvevacationlist);
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
    <title>请假审批</title>
  </head>
  
  <body>
    <%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
    		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">请假审批</h1>
                <table class="table table-bordered table-hover">
		            <tr>
		              <th><strong>序号</strong></th>
		              <th><strong>请假人</strong></th>
		              <th><strong>开始时间</strong></th>
		              <th><strong>结束时间</strong></th>
		              <th><strong>请假类型</strong></th>
		              <th><strong>请假原因</strong></th>
		              <th><strong>请假结果</strong></th>
		              <th><strong>请假审核</strong></th>
		            </tr>
		            
		            <%int i = 1; %>
		            <%if(ApproveVacationList!=null){ %>
		              <%for( Vacation vacation : ApproveVacationList){ %>
		              <tr>
			              <th><strong><%=i %></strong></th>
			              <th><strong><%=vacation.getWorker().getWorkerName() %></strong></th>
			              <th><strong><%=sdf.format(vacation.getVacationStartDate()) %></strong></th>
			              <th><strong><%=sdf.format(vacation.getVacationEndDate()) %></strong></th>
			              <th><strong><%=vacation.getVacationType() %></strong></th>
			              <th><strong><%=vacation.getVacationReason() %></strong></th>
			              <%if(vacation.getVacationResult().toString().equals("0")) {%>
			              <th><strong>待审核</strong></th>
			              <th style="width:130px;">
			              <div class="form-inline"> 
				              <form action="VacationApprove">
				              		<input type='hidden' name="vacationOid" value="<%=vacation.getVacationOid() %>"/>
			            			<input type='hidden' name='vacationresult' value='1'/>
			            			<button class='btn btn-success' type='submit' style='float:left;width:50%;'>批准</button>
			            	  </form>
			            	  <form action="VacationApprove">
			            	  		<input type='hidden' name="vacationOid" value="<%=vacation.getVacationOid() %>"/>
			            			<input type='hidden' name='vacationresult' value='2'/>
			            			<button class='btn btn-danger' type='submit' style='float:left;width:50%;'>驳回</button>
			            	  </form>
		            	  </div> 
		            	  </th>
			              <%} %>
						  <%if(vacation.getVacationResult().toString().equals("1")) {%>
						  <th><strong>批准</strong></th>
						  <th style="width:130px;">
						  	<button class='btn btn-default' type='submit' disabled='disabled' style='float:left;width:100%;'>已审核</button>
						  </th>
						  <%} %>
						  <%if(vacation.getVacationResult().toString().equals("2")) {%>
						  <th><strong>驳回</strong></th>
						  <th style="width:130px;">
						  	<button class='btn btn-default' type='submit' disabled='disabled' style='float:left;width:100%;'>已审核</button>
						  </th>
						  <%} %>
					  </tr>
		              <%i++; %>
		              <% } %>
		            <%} %>
		            
		        </table>
            </div>
  </body>
</html>
