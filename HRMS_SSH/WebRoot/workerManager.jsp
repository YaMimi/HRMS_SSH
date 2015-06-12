<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="com.hrms.pojo.Worker"%>
<%@ page language="java" import="com.hrms.pojo.Department"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
  	<script type="text/javascript">

 function send(workerNo) {//修改
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

</script>
  	
  	
  	<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <title>主页</title>
</head>
<body>
 <%
	            ArrayList<Worker> list=(ArrayList<Worker>)ActionContext.getContext().getSession().get("workers");
	            ArrayList workerDerpart=(ArrayList)ActionContext.getContext().getSession().get("workerDerpart");
	            
	             %>
    <div class="container-fluid">
        <div class="row">
            
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">信息管理</h1>
                <div class="row">
                  <div class="col-sm-4">
                <form action="ResearchWorker">
			      <input type="text" name="worker_no" class="form-control" id="exampleInputAmount" placeholder="请从输入一个员工的编号开始：" style="width: 80%;float: left;">
				  <button type="submit" class="btn btn-primary" style="width: 40px;float: left;"><i class="icon-search"></i></button>
				</form>
				</div>
      
				<form action="SelectAllWorkersManager" method="post">
				<div class="col-sm-8">  <div class="col-sm-8">
                <label>请填写员工信息然后点击添加员工按钮进行添加操作：</label>
				</div>
				<button class="btn btn-success" type="submit" style="width: 40%; float: right;"><i class="icon-ok-sign"></i> 查询全部</button>
				</div>
                </div>
                <table class="table table-bordered table-hover">
				<tr>
				  <th style="padding-left: 21px;"></i>员工号</strong></th>
	              <th style="padding-left: 21px;"><strong>姓名</strong></th>
	              <th style="padding-left: 21px;"><strong>性别</strong></th>
	               <th style="padding-left: 21px;"><strong>部门</strong></th>
	              <th style="padding-left: 21px;"><strong>教育水平</strong></th>
	              
	            </tr>
	            <%--
	            ArrayList list=(ArrayList)ActionContext.getContext().getSession().get("workers");
	            request.setAttribute("workerList", list);
	            
	             --%>
	             
	            
	             <tr>
	         
      <%

for(int i=0;i<list.size();i++)
out.print("<tr>"+"<td><a href='ShowWorkerformation?workerNo="+list.get(i).getWorkerNo()+"' >"+
list.get(i).getWorkerNo()+"</a></td>"+
"<td>"+list.get(i).getWorkerName()+"</td>"+"<td>"+
list.get(i).getWorkerSex()+"</td>"+
"<td>"+workerDerpart.get(i)+"</td>"
+"<td>"+list.get(i).getWorkerEducation()+"</td>"+
"<td><input type='Button' value='修&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;改' class='btn btn-primary' onclick='send("+list.get(i).getWorkerNo()+ "   )'/><input type='Button' value='删&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;除' class='btn btn-primary'  onclick='send_delete("+list.get(i).getWorkerNo()+ ")'/></td>"+"</tr>");
//<input type='Button' value='删&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;除' class='btn btn-primary' onclick=' return send("+list.get(i).getAccount()+ ")'/>
 %>
</tr>
	             <!--  
	          <s:iterator value="#request.workerList"  var="list">                
                <tr>
                    <td><s:property value="#list.workerName"/></td>
                    <td><s:property value="#list.workerNo"/></td>
                    <td><s:property value="#list.workerSex"/></td>
                    <td></td>
                     <td><s:property value="#list.workerPermission"/></td>
                     <td><s:property value="#list.workerEntryDate"/></td>
                    <td><s:property value="#list.workerId"/></td>
                    <td><s:property value="#list.workerBirthDate"/></td>
                    <td></td>
                     <td><s:property value="#list.workerBirthPlace"/></td>
                     <td><s:property value="#list.workerAddress"/></td>
                    <td><s:property value="#list.workerBloodType"/></td>
                    <td><s:property value="#list.workerPolitical"/></td>
                    <td><s:property value="#list.workerEthnic"/></td>
                    <td><s:property value="#list.workerEducation"/></td>
                    <td><s:property value="#list.workerPhone"/></td>
                    <td><s:property value="#list.workerNationality"/></td>
               </tr>
            </s:iterator>
            -->
	            </table>
                </form>
            </div>
        </div>
    </div>
</body>
</html>