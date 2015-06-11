<%@page import="com.hrms.pojo.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
Worker activeWorker = (Worker)session.getAttribute("activeWorker");
List<Attendance> attendancelist = (List<Attendance>)session.getAttribute("attendancelist");
if(attendancelist==null)
{
	%><jsp:forward page="/WorkerAttendanceSearch"/><% 
}
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

List<Attendance> AttendanceList = attendancelist;
attendancelist = null;
session.setAttribute("attendancelist", attendancelist);
List<Attendance> AttendanceListDate = (List<Attendance>)session.getAttribute("attendancelistdate");
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
    <script>
  		$(function() {
  			$( "#datepicker_start" ).datepicker({dateFormat: "yy-mm-dd"});
  		});
  	</script>
    <title>签到查询</title>
  </head>
  
  <body>
  
  	<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <h1 class="page-header">签到查询</h1>
         <i>最近5个工作日的签到记录如下：</i>
            <table class="table table-bordered table-hover">
              <tr>
	              <th><strong>序号</strong></th>
	              <th><strong>日期</strong></th>
	              <th><strong>上班</strong></th>
	              <th><strong>下班</strong></th>
	              <th><strong>请假状况</strong></th>
              </tr>
              
              <%int i = 1; %>
              <%if(AttendanceList!=null){ %>
              <%for(Attendance attendance : AttendanceList){ %>
              <tr>
	              <th><%=i %></th>
	              <th><%=sdf.format(attendance.getAttendanceDate()) %></th>
	              <%if(attendance.getAttendanceState()==0) {%>
	              <th>无考勤</th>
	              <th>无考勤</th>
	              <th>请假</th>
	          	  <%} %>
	          	  <%if(attendance.getAttendanceState()==1) {%>
	              <th><%=attendance.getAttendanceOnTime() %></th>
	              <th><%=attendance.getAttendanceOffTime() %></th>
	              <th>无请假</th>
	          	  <%} %>
	          </tr>
              <%i++; %>
              <%if(i>5){i=1;break;} %>
              <% } %>
              <%} %>
            </table>
            
            <h2 class="sub-header">详情查询</h2>

			<i>输入详细日期查询当日考勤信息。</i>
			<form class="form-inline" action="WorkerAttendanceSearchByDate">
			  <div class="form-group">
			    <div class="input-group">
			      <input id="datepicker_start" type="text" class="form-control" name="Date" style="width:291px">
			    </div>
			  </div>
			  <button type="submit" class="btn btn-primary"><i class="icon-search"></i></button>
			</form>
			<br>
			<table class="table table-bordered table-hover">
				<tr>
					<th>日期</th>
					<th>上班时间</th>
					<th>下班时间</th>
					<th>请假状况</th>
				
				</tr>
				<%if(AttendanceListDate!=null){ %>
				<%for(Attendance attendance : AttendanceListDate){ %>
	              <tr>
		              <th><%=sdf.format(attendance.getAttendanceDate()) %></th>
		              <%if(attendance.getAttendanceState()==0) {%>
		              <th>无考勤</th>
		              <th>无考勤</th>
		          	  <%} %>
		          	  <%if(attendance.getAttendanceState()==1) {%>
		              <th><%=attendance.getAttendanceOnTime() %></th>
		              <th><%=attendance.getAttendanceOffTime() %></th>
		          	  <%} %>
		              <th><%if(attendance.getAttendanceState()==0)out.print("请假中"); else out.print("无请假"); %></th>
	              </tr>
	              <%i++; %>
	             <% } %>
	             <%} %>
				<%i=1; session.setAttribute("attendancelistdate", null);%>
			</table>
            
  </body>
</html>
