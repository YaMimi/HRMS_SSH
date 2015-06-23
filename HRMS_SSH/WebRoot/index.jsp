<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp"%>
<%@ page import="com.hrms.pojo.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:action name="VacationNum" namespace="/"></s:action>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Worker activeWorker = (Worker)session.getAttribute("activeWorker");
%>
<%
SimpleDateFormat HH = new SimpleDateFormat("HH");
Date date = new Date();
int hour = Integer.parseInt(HH.format(date));
String time = "你好";
if(hour >= 0 && hour < 7)
	time = "夜深了";
else if(hour >= 7 && hour < 12)
	time = "早上好";
else if(hour >= 12 && hour < 14)
time = "中午好";
else if(hour >= 14 && hour < 18)
	time = "下午好";
else time = "晚上好";
String post = null;
switch(activeWorker.getWorkerPermission()) {
case 1 : post = "员工"; break;
case 2 : post = "组长"; break;
case 3 : post = "部门经理"; break;
case 4 : post = "总经理"; break;
}
%>
<!DOCTYPE html>
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
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            	<h1 class="page-header"><%= time%>，<%= activeWorker.getWorkerName()%>。</h1>
                <div class="page-wrapper">
                      <div class="row">
			               <!-- /.col-lg-12 -->
			           </div>
			           <!-- /.row -->
			           <div class="row">
			               <div class="col-lg-4 col-md-4">
			               <a href="./message.jsp">
			                   <div class="panel panel-blue">
			                       <div class="panel-heading">
			                           <div class="row">
			                               <div class="col-xs-3">
			                                   <i class="fa fa-envelope fa-5x"></i>
			                               </div>
			                               <div class="col-xs-9 text-right">
			                                   <div class="huge"><%=activeWorker.getWorkerUnreadMessage() %></div>
			                                   <div>未读信息</div>
			                               </div>
			                           </div>
			                       </div>
			                       <a href="./message.jsp">
			                           <div class="panel-footer">
			                               <span class="pull-left">查看详情</span>
			                               <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                               <div class="clearfix"></div>
			                           </div>
			                       </a>
			                   </div>
			               </div>
			               </a>
			               
			               <a href="./cultivationCheck.jsp">
			               <div class="col-lg-4 col-md-4">
			                   <div class="panel panel-green">
			                       <div class="panel-heading">
			                           <div class="row">
			                               <div class="col-xs-3">
			                                   <i class="fa fa-flag fa-5x"></i>
			                               </div>
			                               <div class="col-xs-9 text-right">
			                                   <div class="huge"><%=cultivationPersonListNum %></div>
			                                   <div>进行中培训</div>
			                               </div>
			                           </div>
			                       </div>
			                       <a href="./cultivationCheck.jsp">
			                           <div class="panel-footer">
			                               <span class="pull-left">查看详情</span>
			                               <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                               <div class="clearfix"></div>
			                           </div>
			                       </a>
			                   </div>
			               </div>
			               </a>
			               
			               <%if(activeWorker.getWorkerPermission()<3) {%>
			               <div class="col-lg-4 col-md-4" style="cursor: not-allowed">
			                   <div class="panel panel-disabled">
			                       <div class="panel-heading">
			                           <div class="row">
			                               <div class="col-xs-3">
			                                   <i class="fa fa-check fa-5x"></i>
			                               </div>
			                               <div class="col-xs-9 text-right">
			                                   <div class="huge">-</div>
			                                   <div>待审批条目</div>
			                               </div>
			                           </div>
			                       </div>
			                       <a>
			                           <div class="panel-footer">
			                               <span class="pull-left">查看详情</span>
			                               <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                               <div class="clearfix"></div>
			                           </div>
			                       </a>
			                   </div>
			               </div>
			               <%} else {%>
			               <a href="./attendanceVctCheck.jsp">
			               <div class="col-lg-4 col-md-4">
			                   <div class="panel panel-red">
			                       <div class="panel-heading">
			                           <div class="row">
			                               <div class="col-xs-3">
			                                   <i class="fa fa-check fa-5x"></i>
			                               </div>
			                               <div class="col-xs-9 text-right">
			                                   <div class="huge"><%=session.getAttribute("VacationNum") %></div>
			                                   <div>待审批条目</div>
			                               </div>
			                           </div>
			                       </div>
			                       <a href="./attendanceVctCheck.jsp">
			                           <div class="panel-footer">
			                               <span class="pull-left">查看详情</span>
			                               <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                               <div class="clearfix"></div>
			                           </div>
			                       </a>
			                   </div>
			               </div>
			               </a>
			               <%} %>
			           </div>
                </div>
                <h2 class="sub-header">个人信息</h2>
				<table class="table table-bordered table-hover">
					<tr>
						<th>所在部门</th>
						<th>职务</th>
						<th>员工号</th>
					</tr>
					<tr>
						<th><%= activeWorker.getDepartment().getDepartmentName()%></th>
						<th><%= post%></th>
						<th><%= activeWorker.getWorkerNo() %></th>
					</tr>
				</table>
            </div>
        </div>
    </div>
  </body>
</html>
