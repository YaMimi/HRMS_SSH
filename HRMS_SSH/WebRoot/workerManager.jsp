<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="com.hrms.pojo.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 Worker activeWorker = (Worker)session.getAttribute("activeWorker");
 %>
 
  <%
	            ArrayList<Worker> list=(ArrayList<Worker>)ActionContext.getContext().getSession().get("workers");
	            ArrayList workerDerpart=(ArrayList)ActionContext.getContext().getSession().get("workerDerpart");
	            if(list==null&&workerDerpart==null){
	            	%><s:action name="SelectAllWorkersManager" executeResult="false" namespace="/" /><% 
	            }
	            list=(ArrayList<Worker>)ActionContext.getContext().getSession().get("workers");
	            workerDerpart=(ArrayList)ActionContext.getContext().getSession().get("workerDerpart");
	             %>
<!DOCTYPE html>
<html>
<head lang="zh-CN">
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, list-scalable=no">
    <meta charset="UTF-8">
    <link  href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/font-awesome.min.css" rel="stylesheet"/>
    <link  href="css/dashboard.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="plugin/jquery-ui-1.11.4.custom/jquery-ui.css">
    <script src="./js/jquery-2.1.3.min.js"></script>
    <script src="plugin/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script>
  		$(function() {
  			$( "#datepicker_start" ).datepicker({dateFormat: "yy-mm-dd"});
  		});
  	</script>
  	<script type="text/javascript">

 function send(workerNo) {//管理
window.location.href="ShowUpdateWorkerformation?workerNo="+workerNo; 
      
    }
    
     function send_delete(workerNo) {//删除

       // window.open(encodeURI(url + "?userName=" + userName));
        var r=confirm("确定删除吗？");
           if(r==false){
       return false;
         }else{

          window.location.href="DeleteWorker?workerNo="+workerNo; 

alert("删除成功！");
return true;
}

    }

function updateManager(workerNo){

window.location.href=""; 
}

function addWorker() {//修改

alert("对不起，只有部门经理或者总经理可以管理员工信息");      
    }
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
                <h1 class="page-header">信息管理</h1>
                <div class="row">
                  <div class="col-sm-4">
                <form action="ResearchWorker">
			      <input type="text" name="worker_no" class="form-control" id="exampleInputAmount" placeholder="请从输入一个员工的编号开始：" style="width: 80%;float: left;">
				  <button type="submit" class="btn btn-primary" style="width: 40px;float: left;"><i class="fa fa-search"></i></button>
				</form>
				</div>
      
				<form action="SelectAllWorkersManager" method="post">
				<div class="col-sm-8">  <div class="col-sm-8">
                <label>普通员工登录成功之后点击管理按钮可以查看自己的信息</label>
				</div>
				<button class="btn btn-success" type="submit" style="width: 40%; float: right;"><i class="fa-check"></i> 查询全部</button>
				</div>
                </div>
                <table class="table table-bordered table-hover">
				<tr  style="background-color: #E8E8E8;">
				  <th style="padding-left: 21px;"></i>员工号</strong></th>
	              <th style="padding-left: 21px;"><strong>姓名</strong></th>
	              <th style="padding-left: 21px;"><strong>性别</strong></th>
	               <th style="padding-left: 21px;"><strong>部门</strong></th>
	              <th style="padding-left: 21px;"><strong>教育水平</strong></th>
	              
	            </tr>
	             
	            
	             <tr>
	         
</tr>
<!-- workerDerpart.get(i)activeWorker -->
<%
for(int i=0;i<list.size();i++){
if(list.get(i).getDepartment().getDepartmentName().equals(activeWorker.getDepartment().getDepartmentName().toString())){
out.println("<tr ><td>"+list.get(i).getWorkerNo()+"</td>");
out.println("<td>"+list.get(i).getWorkerName()+"</td>");
out.println("<td>"+list.get(i).getWorkerSex()+"</td>");
out.println("<td>"+list.get(i).getDepartment().getDepartmentName()+"</td>");
out.println("<td>"+list.get(i).getWorkerEducation()+"</td>");
//if(activeWorker.getWorkerNo().equals(list.get(i).getWorkerNo())){
if(activeWorker.getWorkerPermission()==3||activeWorker.getWorkerPermission()==4){%>
<td>
<input type='Button' value='管&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;理' class='btn btn-primary' onclick='send(<%=list.get(i).getWorkerNo()%> )'/>
</td>
<% }else if(activeWorker.getWorkerNo().equals(list.get(i).getWorkerNo())){ %>
<td>
<input type='Button' value='管&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;理' class='btn btn-primary' onclick='send(<%=list.get(i).getWorkerNo()%> )'/>
</td>
<%
}else{%>
<td>
<input type='Button' value='管&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;理' class='btn btn-primary' onclick='addWorker()' disabled="disabled"/> 
</td>
<%
}
}}
 %>
 </table>

                </form>
                                <center >
  <ul class="pagination">
								    <li>
								      <a href="SelectAllWorkersManager?pageNo=1"  aria-label="Previous">
								      	上一页
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
								    <li>
								     <a href="SelectAllWorkersManager.action?pageNo=2" aria-label="Previous">
								      	下一页
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								    </li>
								    </ul>
								    </center>
            </div>
        </div>
    </div>
</body>
</html>
