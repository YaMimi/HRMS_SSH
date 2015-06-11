<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hrms.pojo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Worker activeWorker = (Worker)session.getAttribute("activeWorker");
List<Attendance> departmentattendancelist = (List<Attendance>)session.getAttribute("departmentattendancelist");
if(departmentattendancelist==null)
{
	%><jsp:forward page="/DepartmentAttendanceSearch"/><% 
}
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

List<Attendance> DepartmentAttendanceList = departmentattendancelist;
departmentattendancelist = null;
session.setAttribute("departmentattendancelist", departmentattendancelist);
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
    <title>部门考勤</title>
  </head>
  
  <body>
    <%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">部门考勤</h1>
                <i>本部门当日的签到记录如下：</i>

                <table class="table table-bordered table-hover">
		            <tr>
		              <th><strong>序号</strong></th>
		              <th><strong>姓名</strong></th>
		              <th><strong>日期</strong></th>
		              <th><strong>上班</strong></th>
		              <th><strong>下班</strong></th>
		              <th><strong>特殊情况</strong></th>
		            </tr>
		       		<%int i = 1; %>
		       		<%if(DepartmentAttendanceList.size()>0) {%>
		       			<%for(Attendance attendance : DepartmentAttendanceList) {%>
		       			<tr>
			              <th><%=i %></th>
			              <th><%=attendance.getWorker().getWorkerName() %></th>
			              <th><%=sdf.format(attendance.getAttendanceDate())  %></th>
			              <%if(attendance.getAttendanceState()==0) {%>
			              <th>无考勤</th>
			              <th>无考勤</th>
			          	  <%} %>
			          	  <%if(attendance.getAttendanceState()==1) {%>
			              <th><%=attendance.getAttendanceOnTime() %></th>
			              <th><%=attendance.getAttendanceOffTime() %></th>
			          	  <%} %>
			              <%if(Integer.parseInt(attendance.getAttendanceState().toString())==0 ) {%><th>请假</th><%} %>
			              <%if(Integer.parseInt(attendance.getAttendanceState().toString())==1 ) {%><th>无</th><%} %>
			            </tr>
		       			<%} %>
		       		<%} %>
		        </table>
            </div>
  </body>
</html>
