<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="com.hrms.pojo.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link rel="stylesheet" type="text/css" href="plugin/jquery-ui-1.11.4.custom/jquery-ui.css">
    <script src="./js/jquery-2.1.3.min.js"></script>
    <script src="plugin/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script>
  		$(function() {
  			$( "#datepicker_start" ).datepicker({dateFormat: "yy-mm-dd"});
  		});
  	</script>
  		
 <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
 <script type="text/javascript">
 
 </script>
    <title>修改密码</title>
  
</head>
  
  <body>
<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="width: 50%;">
      <h1 class="page-header">修改密码</h1>
                <div class="row">
                <div class="col-sm-8">
                <label>请填写员工信息然后点击修改员工密码按钮进行修改操作：</label>
				</div>
                </div>
              <%
              String old=(String)ActionContext.getContext().getSession().get("oldPassword");
              String old2=(String)ActionContext.getContext().getSession().remove("oldPassword");
              String success=(String)ActionContext.getContext().getSession().get("successPassword");
              String success2=(String)ActionContext.getContext().getSession().remove("successPassword");
              if(old2!=null){%>
               <script  type="text/javascript">
               alert("旧密码输入不正确，请重新输入！");
               </script>
              <% }
              if(success2!=null){%>
              <script  type="text/javascript">
               alert("密码修改成功！");
               </script>
              <%} %>              
	<form action="UpdatePassword"  method="post" name="updatepassword" onsubmit="return checkReg(this);">
	      <input type="hidden" value="<%=activeWorker.getWorkerOid() %>" name="workerOid">
	          <table class="table table-bordered table-hover">
				<tr>
	              <th style="padding-left: 21px;"><strong>旧密码</strong></th>
	              <th><input type="password" class="form-control " style="width: 100%; float: center;"name="worker.password" id="password" placeholder="旧密码" value="" required></th>
	           </tr>
	            <tr>
	              <th style="padding-left: 21px;"></i>新密码</strong></th>
	              <th><input type="password" class="form-control " style="width: 100%; float: center;"name="password1" placeholder="新密码" value="" required></th>
	           </tr>
	              <th style="padding-left: 21px;"><strong>确认密码</strong></th>
	              <th><input type="password" class="form-control " style="width: 100%; float: center;"name="password2" placeholder="确认密码" value="" required></th>
	            </tr>
	            </table>
	            <center>
	            <button class="btn btn-default" type="submit" style="width: 20%; float: center;"><i class="icon-ok-sign"></i> 确认</button>
	            <button class="btn btn-default" type="reset" style="width: 20%; float:center;"><i class="icon-ok-sign" "></i> 重置</button>
	           </center>
                </form>
             </div>
      <br><br><br><br><br><br>
     	<div class="col-md-6" style="width: 30%; float:left;">
						<div class="panel panel-default">
							<div class="panel-heading">注意事项</div>
							<div class="panel-body ">
							  <ul class="pagination" style="color: red;">
							  <li >①密码长度不能小于6位并且大于8位</li><br>
							  <li>②必须旧密码有效才可修改</li><br>
							  </ul>
							</div>
						</div>
					
					</div>
						</div>
	  <script  type="text/javascript">
				function checkReg(updatepassword)
			{
			var password1=updatepassword.password1.value;
			var password2=updatepassword.password2.value;
				 if(password1.length<6){
				alert("密码长度必须大于6位"+Password);  
                            return false;  
				}else if(password1.length>8){
				alert("密码长度不能大于8位");  
                            return false;  
				}else if (password1!=password2){
				alert("两次输入密码不相等");  
                            return false;  
				}
				return true;  
				
				}
		</script>
  </body>
</html>
