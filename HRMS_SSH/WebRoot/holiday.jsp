<%@page import="com.hrms.pojo.*"%>
<%@ include file="loginCheck.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:action name="SearchHoliday" executeResult="false" namespace="/"></s:action>
<%
Worker activeWorker = (Worker)session.getAttribute("activeWorker");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
List<Holiday> holidays = (List<Holiday>)session.getAttribute("holidays");
%>

<!DOCTYPE html>
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
    <script>
  		$(function() {
  				   $( "#datepicker_start" ).datepicker({dateFormat: "yy-mm-dd", minDate:"-0D"});
  				   $( "#datepicker_end" ).datepicker({dateFormat: "yy-mm-dd", minDate:"-0D"});
  				});
  		$("form").submit(function(e){
		  var frm = $("#frm");
		  var action = "CheckSalary";
		  frm.attr("action",action);  
		});
		$("tr").click(function(){
		  $("form").submit();
		});
  	</script>
    <title>发布假期</title>
  </head>
  
  <body>
  
  	<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <h1 class="page-header">发布假期</h1>
         <div class="panel panel-default">
			<div class="panel-heading">新建假期</div>
			<div class="panel-body">
				<div style="padding-right: 15px; padding-left: 15px;">
				  	<div class="form-horizontal">
					  	<form action="CreateHoliday" method="post">
					  		<div class="form-group form-inline">
					  			<input id="datepicker_start" class="form-control" type="text" name="holidaystart" style="width:40%" placeholder="假日起始时间" required>
			  					<!--<input type="date" class="form-control"  name="" style="width:40%">-->
			  					<label for="apply_start" class="control-label" style="width:10%">至</label>
			  					<input id="datepicker_end" class="form-control pull-right" type="text" name="holidayend" style="width:40%" placeholder="假日结束时间" required>
			  					<!-- <input type="date" class="form-control pull-right" style="width:40%">-->
					  		</div>
					  		<div class="form-group ">
					  			<textarea class="form-control" rows="3" name="holidayContent" placeholder="假日内容" required  autofocus></textarea>
					  		</div>
					  		<div class="form-group form-inline ">
					  			<button class="btn btn-primary" type="submit" style="width:65%;">提交创建</button>
					  			<button class="btn btn-danger pull-right" type="reset" style="width:30%;">重置</button>
					  		</div>
					  	</form>
				  	</div>
			  	</div>
			  	<%
			  		if(session.getAttribute("holidaycreatestate")!=null){
			  			if(Integer.parseInt(session.getAttribute("holidaycreatestate").toString())==1){
			  				out.print("<div class='alert alert-success' style='margin-bottom:0px;' role='alert'><i class='icon-ok-sign' aria-hidden='true'></i> 创建假期成功！</div>");
			  				session.setAttribute("holidaycreatestate",null);
			  			}else if(Integer.parseInt(session.getAttribute("holidaycreatestate").toString())==2){
			  				out.print("<div class='alert alert-danger' style='margin-bottom:0px;' role='alert'><i class='icon-minus-sign' aria-hidden='true'></i> 创建假期失败，日期不合理！</div>");
			  				session.setAttribute("holidaycreatestate",null);
			  			}
			  		}
			  		 %> 
			</div>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading">今年假日信息</div>
			<div class="panel-body ">
			  	<table class="table table-bordered table-hover">
		            <tr>
		              <th><strong>#</strong></th>
		              <th><strong>假日日期</strong></th>
		              <th><strong>假日信息</strong></th>
		            </tr>
		            <%int i = 1; %>
		            <%for(Holiday holiday : holidays){ %>
		            <tr>
			            <form id="frm">
			            	<input type="hidden" value="<%=holiday.getHolidayOid() %>" />
			            </form>
		              <th><%=i %></th>
		              <th><%=sdf.format(holiday.getHolidayDate()) %></th>
		              <th><%=holiday.getHolidayContent() %></th>
		            </tr>
		            <%i++; %>
		            <%} %>
		        </table>
			</div>
		</div>
    </div>
  </body>
</html>
