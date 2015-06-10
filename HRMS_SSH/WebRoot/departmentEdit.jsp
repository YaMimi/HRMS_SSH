<%@ page import="com.hrms.pojo.Department"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
List<Department> departmentlist = (List<Department>)session.getAttribute("departmentlist");
if(departmentlist==null)
{
	%><jsp:forward page="/UpdateDepartmentImfo"/><% 
}
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


List<Department> DepartmentList = departmentlist;
departmentlist = null;
session.setAttribute("departmentlist", departmentlist);
System.out.println(departmentlist+"进入edit.jsp");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
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
    <title>主页</title>
  </head>
  
  <body>
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
	              <th><strong>父部门编号</strong></th>
	              <th><strong>父部门名称</strong></th>
	              <th colspan="2"><strong>操作</strong></th>
	            </tr>
                <%for(Department department : DepartmentList){ %>
	            <form action="">
		            <tr>
		              <input type='hidden' name='department_oid' value='<%=department.getDepartmentOid()%>'/>
		              <th><input type="text" class="form-control" name="department_no" placeholder="部门编号 " value="<%=department.getDepartmentNo() %>" required></th>
		              <th><input type="text" class="form-control" name="department_name" placeholder="部门名称" value="<%=department.getDepartmentName() %>" required></th>
		              <%if(department.getDepartment()!=null) {%>
		              <th><input type="text" class="form-control" name="father_department_no" placeholder="父部门编号（没有则填写本部门编号） " value="<%=department.getDepartment().getDepartmentNo() %>" required></th>
		              <th><input type="text" class="form-control" name="father_department_name" placeholder="父部门名称（没有则填写本部门名称） " value="<%=department.getDepartment().getDepartmentName() %>" required></th>
		              <%}
	              else{ %>
	                  <th><input type="text" class="form-control" name="father_department_no" placeholder="父部门编号（没有则填写本部门编号） "  required></th>
		              <th><input type="text" class="form-control" name="father_department_name" placeholder="父部门名称（没有则填写本部门名称） "  required></th>
		               <%}%>
		              <th style="width:10px;"><button class="crlbut editbut" type="submit"><i class="icon-large icon-ok"></i></button></th>
		              </form> <%}%>
			          <th style="width:10px;"><button class="crlbut delbut"><a class="delbut" href="AdjustDepartmentPermission"><i class="icon-large icon-remove"></i></a></button></th>
		            </tr>
	            </table>
  </body>
</html>
