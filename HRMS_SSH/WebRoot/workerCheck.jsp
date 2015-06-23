<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="com.hrms.pojo.*"%>
<%@ page language="java" import="com.hrms.pojo.Department"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 Worker activeWorker = (Worker)session.getAttribute("activeWorker");
 %>
<s:action name="Select" executeResult="false" namespace="/"/>
<!DOCTYPE html>
<html>
<head lang="zh-CN">
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
<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
    <div class="container-fluid">
        <div class="row">
            
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">修改员工</h1>
                <div class="row">
                <div class="col-sm-8">
                <label>请填写员工信息然后点击添加员工按钮进行添加操作：</label>
				</div>
		
				
				<!-- 修改 -->
				<form action="UpdateWorkerformation" method="post">
				<div class="col-sm-4">
				<button class="btn btn-default" type="submit" style="width: 40%; float: right;" ><i class="fa fa-check"></i> 确认修改</button>
				<button class="btn btn-default" type="button" style="width: 40%; float: right;" onclick="send_delete(${workerNo})"><i class="fa fa-check"></i> 确认删除</button>
		
				</div>
                </div>
                <input type="hidden" name="workerOid" value="${workeroid}">
                <table class="table table-bordered table-hover">
                
				<tr>
	              <th style="padding-left: 21px;"><strong>姓名</strong></th>
	              <th style="padding-left: 21px;"></i>员工号</strong></th>
	              <th style="padding-left: 21px;"><strong>性别</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " name="worker.workerName" placeholder="姓名" value="${workerName }" required></th>
	              <th><input type="text" class="form-control " name="worker.workerNo" placeholder="员工号" value="${workerNo }" required readonly="readonly"></th>
	              <th><select name="worker.workerSex" class="form-control">
	              <option value="男" <c:if test="${workerSex ==\'男\'}">selected</c:if>>男</option>
	              <option value="女" <c:if test="${workerSex ==\'女\'}">selected</c:if>>女</option>
	              </select></th>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong>部门</strong></th>
	              <th style="padding-left: 21px;"><strong>职称</strong></th>
	              <th style="padding-left: 21px;"><strong>入职时间</strong></th>
	              
	            </tr>
	            <tr>
	              <th>
	         	<%
	ArrayList<Department> depart=(ArrayList<Department>)ActionContext.getContext().getSession().get("department1");
  
  out.println("	<select name='department.departmentName' size='1' class='form-control'>");
  for(int i=0;i<depart.size();i++){
    out.println("<option value='"+depart.get(i).getDepartmentName()+"'>"+depart.get(i).getDepartmentName()+"</option>");
   
       }
         out.println("	</select>");
	        %>
	              </th>
	              <th><select name="worker.workerPermission" class="form-control">
	              <option value="1" <c:if test="${workerPermission ==\'1\'}">selected</c:if>>普通员工</option>
	              <option value="2" <c:if test="${workerPermission ==\'2\'}">selected</c:if>>组长</option>
	              <option value="3" <c:if test="${workerPermission ==\'3\'}">selected</c:if>>部门经理</option>
	              <option value="4" <c:if test="${workerPermission ==\'4\'}">selected</c:if>>总经理</option>
	              </select></th>
	              <th><input type="text" class="form-control " name="worker.workerEntryDate" placeholder="入职时间 " value="${workerEntryDate }" required  style="width: 98%" class="form-control"     onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></th>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong>身份证号</strong></th>
	              <th style="padding-left: 21px;"><strong>出生日期</strong></th>
	              <th style="padding-left: 21px;"><strong>年龄</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " name="worker.workerId" placeholder="身份证号" value="${workerId}" required></th>
	              <th><input type="text" class="form-control " name="worker.workerBirthDate" placeholder="出生日期 " value="${workerBirthDate }" required  style="width: 98%" class="form-control"     onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></th>
	              <th><input type="text" class="form-control " name="worker.workerAge" placeholder="年龄 " value="${workerAge }" required></th>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong>籍贯</strong></th>
	              <th style="padding-left: 21px;"><strong>地址</strong></th>
	              <th style="padding-left: 21px;"><strong>血型</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " name="worker.workerBirthPlace" placeholder="籍贯 " value="<%=activeWorker.getWorkerBirthPlace() %>" required></th>
	              <th><input type="text" class="form-control " name="worker.workerAddress" placeholder="地址" value="${workerAddress }" required></th>
	              <th><input type="text" class="form-control " name="worker.workerBloodType" placeholder="血型" value="${workerBloodType }" required></th>
	            </tr>
	            <tr>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong>政治面貌</strong></th>
	              <th style="padding-left: 21px;"><strong>民族</strong></th>
	              <th style="padding-left: 21px;"><strong>教育水平</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " name="worker.workerPolitical" placeholder="政治面貌" value="${workerPolitical }" required></th>
	              <th><input type="text" class="form-control " name="worker.workerEthnic" placeholder="民族 " value="${workerEthnic }" required></th>
	              <th><input type="text" class="form-control " name="worker.workerEducation" placeholder="教育水平 " value="${workerEducation }" required></th>
	            </tr>
	            <tr>
	              <th style="padding-left: 21px;"><strong>电话</strong></th>
	              <th style="padding-left: 21px;"><strong>国籍</strong></th>
	              <th style="padding-left: 21px;"><strong>密码</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " name="worker.workerPhone" placeholder="电话 " value="${workerPhone }" required></th>
	              <th><input type="text" class="form-control " name="worker.workerNationality" placeholder="国籍" value="${workerNationality }" required></th>
	              <th><input type="text" class="form-control " name="worker.password" placeholder="密码 " value="${password }" required></th>
	            </tr>
                </table>
                </form>
            </div>
        </div>
    </div>
</body>
</html>