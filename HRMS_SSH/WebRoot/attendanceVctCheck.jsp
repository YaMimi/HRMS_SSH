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
		              <th><strong>请假原因</strong></th>
		              <th><strong>请假结果</strong></th>
		              <th><strong>请假审核</strong></th>
		            </tr>
		            
		            <%
		            //for(int i = VT.length-1; i >= 0 ; i--){
		            //	out.println("<tr>");
		            //	out.print("<th>"+(i+1)+"</th>");
		            //	out.print("<th>"+VT[i].getName()+"</th>");
		            //	out.print("<th>"+VT[i].getStart()+"</th>");
		            //	out.print("<th>"+VT[i].getEnd()+"</th>");
		            //	out.print("<th>"+VT[i].getReason()+"</th>");
		            //	if(VT[i].getResult()==0){
		            //		out.print("<th>待审核</th>");
		            //	}else if(VT[i].getResult()==1){
		            //		out.print("<th>已批准</th>");
		            //	}else if(VT[i].getResult()==2){
		            //		out.print("<th>驳回</th>");
		            //	}
		           	%>
		            <!-- <th style="width:130px;">  -->
            		<%	
						//if(VT[i].getResult()==0){
		            %>
		            <!-- 	<form action='AcceptVacationServlet'>
		            			<input type='hidden' name='accept' value=""/>
		            			<button class='btn btn-success' type='submit' style='float:left;width:50%;'>批准</button>
		            		</form>
		            		<form action='RejectVacationServlet'>
		            			<input type='hidden' name='reject' value=""/>
		            			<button class='btn btn-danger' type='submit' style='float:left;width:50%;'>驳回</button>
		            		</form>
            		<%
		            	//}
		            	//else {
		            %>
		            	<button class='btn btn-default' type='submit' disabled='disabled' style='float:left;width:100%;'>已审核</button>
		            <%
		            	//}
		            %>
		            	</th>
		            <%
		            	//out.println("</tr>");
		           // }
		             %> -->
		        </table>
            </div>
  </body>
</html>
