<%@ page import="com.hrms.pojo.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
Worker activeWorker = (Worker)session.getAttribute("activeWorker");
List<Department> departmentlist = (List<Department>)session.getAttribute("departmentlist");
if(departmentlist==null)
{
	%><jsp:forward page="/DepartmentSearch"/><% 
}
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


List<Department> DepartmentList = departmentlist;
departmentlist = null;
session.setAttribute("departmentlist", departmentlist);
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
    <title>部门调整</title>
  </head>
  
  <body>
  	<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <h1 class="page-header">部门列表</h1>
         <i>以下为所有部门的详细信息，请谨慎进行操作：</i>
         <table class="table" style="width:500px;">
	             <tr>
	                <th>功能简介</th>
				    <th><i class="icon-pencil"></i> 修改该部门信息</th>
				    <th><i class="icon-remove"></i> 删除该部门（谨慎使用）</th>
				 </tr> </table>
            <table class="table table-bordered table-hover" >
              <tr>
	              <th><strong>部门编号</strong></th>
	              <th><strong>部门名称</strong></th>
	              <th><strong>父部门编号</strong></th>
	              <th><strong>父部门名称</strong></th>
	              <th><strong>部门人数</strong></th>
	              <th colspan="2"><strong>操作</strong></th>
              </tr>
              <%int i = 1; %>
              <%for(Department department : DepartmentList){ %>
              
              <tr>
	              <th><strong><%=department.getDepartmentNo() %></strong></th>
	              <th><strong><%=department.getDepartmentName() %></strong></th>
	              <%if(department.getDepartment()!=null) {%>
	              <th><strong><%=department.getDepartment().getDepartmentNo() %></strong></th>
	              <th><strong><%=department.getDepartment().getDepartmentName() %></strong></th>
	              <%}
	              else{ %>
	              <th><strong></strong></th>
	              <th><strong></strong></th>
	              <%} %>
	              <th><strong><%=department.getWorkers().size() %></strong></th>
             	  <th style="width:10px;">
				      <form action='UpdateDepartmentImfo'>
			             <input type='hidden' name='alter' value='<%=department.getDepartmentOid()%>'/>
			             <button class='crlbut editbut' type='submit'  ><i class="icon-large icon-pencil"></i></button>
			          </form>
			      </th>
			      <th style="width:10px;">  
			           <form action='DepartmentDelete'>
			             <input type='hidden' name='delete' value='<%=department.getDepartmentOid()%>'/>
			             <button class='crlbut delbut' type='submit'  ><i class="icon-large icon-remove"></i></button>
			           </form>
		          </th>
			  </tr>
			  <%i++; %>
	            <%
	            	}
	             %>
                </table>
  </body>
</html>
