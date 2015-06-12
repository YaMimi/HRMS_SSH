<%@ page import="com.hrms.pojo.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

Worker activeWorker = (Worker)session.getAttribute("activeWorker");

List<Department> departmentlist = (List<Department>)session.getAttribute("departmentlist");
List<Department> departmentlist1 = (List<Department>)session.getAttribute("departmentlist1");
if(departmentlist==null)
{
	%><jsp:forward page="/UpdateDepartmentImfo"/><% 
}
List<Department> DepartmentList = departmentlist;
departmentlist = null;
session.setAttribute("departmentlist", departmentlist);
List<Department> DepartmentList1 = departmentlist1;
departmentlist1 = null;
session.setAttribute("departmentlist1", departmentlist1);
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
    <title>部门修改</title>
  </head>
  
  <body>
  
  	<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">部门修改</h1>
                
                <i>以下为该部门的详细信息，请谨慎进行操作：</i>
                <table class="table" style="width:500px;">
	                <tr>
	                		<th>功能简介</th>
						    <th><i class="icon-ok-sign"></i> 保存修改</th>
						    <th><i class="icon-remove-sign"></i> 放弃修改</th>
				    </tr>
			    </table>
                <table class="table table-bordered table-hover">
				<tr>
	              <th><strong>部门编号</strong></th>
	              <th><strong>部门名称</strong></th>
	              <th><strong>父部门名称</strong></th>
	              <th colspan="2"><strong>操作</strong></th>
	            </tr>
                <%for(Department department : DepartmentList){ %>
	             <form action='departmentUpdate' method='post'>
		            <tr>
		              <input type='hidden' name='department_oid' value='<%=department.getDepartmentOid()%>'/>
		              <th><input type="text" class="form-control" name="department.DepartmentNo" placeholder="部门编号 " value="<%=department.getDepartmentNo() %>" required></th>
		              <th><input type="text" class="form-control" name="department.DepartmentName" placeholder="部门名称" value="<%=department.getDepartmentName() %>" required></th>
		              <%if(department.getDepartment()!=null) {%>
		              <th>
		              <select name="FatherDepartmentOid" class="form-control">
							 <option value="<%=department.getDepartment().getDepartmentOid()%>" selected='selected'><%=department.getDepartment().getDepartmentName() %></option>
			                 <option value="0">无</option>
			         <%int i = 1; %>
                     <%for(Department department1 : DepartmentList1){ %>
							 <option value="<%=department1.getDepartmentOid()%>"><%=department1.getDepartmentName() %></option>
					  <%i++; %>
	                  <%
	            	      }
	                  %> 
					  </select>
					  </th>
		              
		              <%}
	              else{ %>
	                  
	                   <th>
		              <select name="FatherDepartmentOid" class="form-control">
			                 <option value="0" selected='selected'>无</option>
			         <%int i = 1; %>
                     <%for(Department department1 : DepartmentList1){ %>
							 <option value="<%=department1.getDepartmentOid()%>"><%=department1.getDepartmentName() %></option>
					  <%i++; %>
	                  <%
	            	      }
	                  %> 
					  </select>
					  </th>
		              
		               <%}%>
		               
			             <input type='hidden' name='alter' value='<%=department.getDepartmentOid()%>'/>
		              <th style="width:10px;"><button class="crlbut editbut" type="submit"><i class="icon-large icon-ok"></i></button></th>
		              </form>  
		              <%}%>
			          <th style="width:10px;"><button class="crlbut delbut"><a class="delbut" href="departmentCheck.jsp"><i class="icon-large icon-remove"></i></a></button></th>
		            </tr>
	            </table>
  </body>
</html>
