<%@page import="com.hrms.page.bean.PageBean"%>
<%@ include file="loginCheck.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hrms.pojo.*" %>
<%!
public String returnMark(int i) {
switch(i) {
case 0 : return "不及格";
case 1 : return "及格";
case 2 : return "中等";
case 3 : return "良好";
case 4 : return "优秀";
}
return null;
}
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Worker activeWorker = (Worker)session.getAttribute("activeWorker");
String state = (String)session.getAttribute("state");
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
  	</script>
    <title>培训维护</title>
  </head>
  
  <body>
  
  	<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">培训维护</h1>
		<%if(activeWorker.getWorkerPermission()>2) {%>
		<%if(state==null) {%>
		<%session.setAttribute("state", null); %>
        <button class="btn btn-primary btn-block" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			 发布新培训
	    </button>
	    <%} %>
	    <%if(state!=null&&state.equals("DATEERROR")) {%>
		<%session.setAttribute("state", null); %>
		<button class="btn btn-danger btn-block" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			 <i class="fa fa-times-circle"> 结束日期不能早于开始日期！</i>
	    </button>
		<%} %>
		<%if(state!=null&&state.equals("INSERTERROR")) {%>
		<%session.setAttribute("state", null); %>
		<button class="btn btn-danger btn-block" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			 <i class="fa fa-times-circle"> 发布失败！请检查输入是否有误</i>
	    </button>
		<%} %>
		<%if(state!=null&&state.equals("INSERTSUCCESS")) {%>
		<%session.setAttribute("state", null); %>
		<button class="btn btn-success btn-block" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			 <i class="fa fa-check-circle"> 发布成功！</i>
	    </button>
		<%} %>
	     <div class="collapse" id="collapseExample">
		  <div class="well" style="margin-bottom: 0px;">
		    <form action="NewCultivation" method="post">
		    <input type="text" class="form-control" name="cultivation.cultivationProject" maxlength="10" placeholder="培训标题，最大长度10字。" required="required" autofocus="autofocus">
		    <br>
		    <input type="text" class="form-control" name="cultivation.cultivationType" maxlength="10" placeholder="培训类型，最大长度10字。" required="required" autofocus="autofocus">
		    <br>
		    <input type="text" class="form-control" name="cultivation.cultivationLocation" maxlength="10" placeholder="培训地点，最大长度10字。" required="required" autofocus="autofocus">
		    <br>
		    <textarea class="form-control"  name="cultivation.cultivationInstruction" maxlength="50" rows="2" placeholder="培训说明，最大长度50字。" required="required" style="resize: none;"></textarea>
		    <br>
		    <div class="form-group form-inline">
	  			<input id="datepicker_start" class="form-control" type="text" name="cultivation.cultivationBeginDate" style="width:40%" placeholder="培训起始时间" required>
				<label class="control-label" style="text-align: center;width: 10%;">至</label>
				<input id="datepicker_end" class="form-control pull-right" type="text" name="cultivation.cultivationEndDate" style="width:40%" placeholder="培训结束时间" required>
	  		</div>
	  		<br>
		    <div class="col-sm-6" style="padding-left: 0px;">
		      	<button type="submit" class="btn btn-primary btn-block">确认发布</button>
		    </div>
		    <div class="col-sm-6" style="padding-right: 0px;">
		    	<button type="reset" class="btn btn-default btn-block">重置内容</a>
		    </div>
		    <br><br>
		    </form>
		  </div>
		 </div>
         <br>
         <%} %>
		<h2 class="sub-header">进行中培训</h2>
		<%int i = 1;%>
		<%int listNum = 0; %>
		<s:action name="ShowCultivation" executeResult="false" namespace="/"/>
		<%
		List<Cultivation> cultivationList = (List<Cultivation>) session.getAttribute("cultivationList");
		if(!cultivationList.isEmpty())
        for(Cultivation cultivation : cultivationList) {%>
        <%
        Date date = new Date();
        long time1 = date.getTime() - cultivation.getCultivationBeginDate().getTime();
        long time2 = cultivation.getCultivationEndDate().getTime() - cultivation.getCultivationBeginDate().getTime();
        double percent = (double)time1/time2*100;
        if(percent>100||percent<0) continue;
        listNum++;
        %>
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
			        <a data-toggle="collapse" href="#collapse<%=i %>" aria-expanded="false" class="collapsed">
			          	<%=cultivation.getCultivationProject() %>
			        </a>
			        <%if(percent<100) {%>
			        <a data-toggle="collapse" href="#collapse<%=i %>" aria-expanded="false" class="collapsed" style="float:right">
			          <%=(int)percent %>%
			        </a>
			        <%} else {%>
			        <a data-toggle="collapse" href="#collapse<%=i %>" aria-expanded="false" class="collapsed" style="float:right">
			          	已完成
			        </a>
			        <%} %>
		      	</h4>
            </div>
            <div class="panel-body collapse" id="collapse<%=i %>" aria-expanded="false" style="height: 30px;">
				<div class="row">
					<div class="col-sm-4" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训时间</h4>
							<p><%=simpledateformat.format(cultivation.getCultivationBeginDate()) %>~<%=simpledateformat.format(cultivation.getCultivationEndDate()) %></p>
		                </div>
					</div>
					<div class="col-sm-3" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训类型</h4>
							<p><%=cultivation.getCultivationType() %></p>
		                </div>
					</div>
					<div class="col-sm-3" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训地点</h4>
							<p><%=cultivation.getCultivationLocation() %></p>
		                </div>
					</div>
					<div class="col-sm-2">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>负责人</h4>
							<p><%=cultivation.getWorker().getWorkerName() %></p>
		                </div>
					</div>
				</div>
				<div class="well" style="margin-bottom: 15px;">
                    <h4>培训说明</h4>
                    <p><%=cultivation.getCultivationInstruction() %></p>
                </div>
                <%if(activeWorker.getWorkerPermission()>2) {%>
                <table class="table table-bordered table-hover" style="margin-bottom: 0px;">
                <thead>
                <tr>
	                <td colspan="4">
	                	<strong>参与培训员工信息</strong>
	                </td>
               	</tr>
               	<tr>
                	<td>
	                	序号
	                </td>
	                <td>
	                	员工号
	                </td>
	                <td>
	                	姓名
	                </td>
	                <td>
	                	评分
	                </td>
               	</tr>
                </thead>
                
                <%int cultivationPersonNum = 1;
                Set<Cultivationperson> cultivationpersonList = cultivation.getCultivationpersons();
                if(cultivationpersonList.isEmpty()) {%>
                <tr>
	                <td colspan="4">
	                	暂无员工报名。
	                </td>
                </tr>
                <%} else 
                for(Cultivationperson cultivationperson : cultivationpersonList) { %>
                <tr>
	                <td>
	                	<%=cultivationPersonNum %>
	                </td>
	                <td>
	                	<%=cultivationperson.getWorker().getWorkerNo() %>
	                </td>
	                <td>
	                	<%=cultivationperson.getWorker().getWorkerName() %>
	                </td>
	                <td style="width:200px;">
	                	<%if(cultivationperson.getCultivationPersonMark()==null) {%>
	                	<%if(cultivation.getWorker().getWorkerOid().equals(activeWorker.getWorkerOid())) {%>
	                	<form action="RankCultivationPerson" method="post">
	                	<input type="hidden" name=cultivationPersonOid value="<%=cultivationperson.getCultivationPersonOid() %>">
	                	<select name="cultivationPersonMark" class="form-control" style=" width:70%; float:left;">
	                	<option value="0">不及格</option>
	                	<option value="1">及格</option>
	                	<option value="2">中等</option>
	                	<option value="3">良好</option>
	                	<option value="4">优秀</option>
	                	</select>
	                	<button type="submit" class="btn btn-outline btn-default" style=" width:30%; float:left;">提交</button>
	                	</form>
	                	<%} else {%>
	                	<button class="btn btn-default btn-block" style="color: #000000; float:left; text-align: left;padding-left: 15px;" disabled="disabled">未评分</button>
	                	<%} %>
	                	<%} else {%>
	                	<button class="btn btn-default btn-block" style="color: #000000; float:left; text-align: left;padding-left: 15px;" disabled="disabled"><%=returnMark(cultivationperson.getCultivationPersonMark()) %></button>
	                	<%} %>
	                </td>
                </tr>
                <%cultivationPersonNum++;} %>
                </table>
                <%} else {%>
                <%if(cultivation.getCultivationpersons().retainAll(activeWorker.getCultivationpersons())) {%>
                 <button class="btn btn-default btn-block" style="margin-bottom: 0px;" disabled="disabled">已经报名</button>
                <%} else {%>
                <button class="btn btn-default btn-block" style="margin-bottom: 0px;" disabled="disabled">已经开始</button>
                <%} }%>
            </div>
            <%if(percent<100) {%>
            <div class="panel-footer">
            <div class="progress progress-striped active" style="margin-bottom: 0px;">
                <div class="progress-bar" role="progressbar" aria-valuenow="<%=(int)percent %>" aria-valuemin="0" aria-valuemax="100" style="width: <%=percent %>%"></div>
            </div>
			</div>
			<%} %>
        </div>
        <%i++;}
        if(listNum==0) { out.print("　无进行中培训。");}%>
        
        <h2 class="sub-header">未开始培训</h2>
		<%
		if(!cultivationList.isEmpty())
        for(Cultivation cultivation : cultivationList) {%>
        <%
        Date date = new Date();
        long time1 = date.getTime() - cultivation.getCultivationBeginDate().getTime();
        long time2 = cultivation.getCultivationEndDate().getTime() - cultivation.getCultivationBeginDate().getTime();
        double percent = (double)time1/time2*100;
        if(percent>0) continue;
        listNum++;
        %>
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
			        <a data-toggle="collapse" href="#collapse<%=i %>" aria-expanded="false" class="collapsed">
			          	<%=cultivation.getCultivationProject() %>
			        </a>
			        <a data-toggle="collapse" href="#collapse<%=i %>" aria-expanded="false" class="collapsed" style="float:right">
			          	即将开始
			        </a>
		      	</h4>
            </div>
            <div class="panel-body collapse" id="collapse<%=i %>" aria-expanded="false" style="height: 30px;">
				<div class="row">
					<div class="col-sm-4" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训时间</h4>
							<p><%=simpledateformat.format(cultivation.getCultivationBeginDate()) %>~<%=simpledateformat.format(cultivation.getCultivationEndDate()) %></p>
		                </div>
					</div>
					<div class="col-sm-3" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训类型</h4>
							<p><%=cultivation.getCultivationType() %></p>
		                </div>
					</div>
					<div class="col-sm-3" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训地点</h4>
							<p><%=cultivation.getCultivationLocation() %></p>
		                </div>
					</div>
					<div class="col-sm-2">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>负责人</h4>
							<p><%=cultivation.getWorker().getWorkerName() %></p>
		                </div>
					</div>
				</div>
				<div class="well" style="margin-bottom: 15px;">
                    <h4>培训说明</h4>
                    <p><%=cultivation.getCultivationInstruction() %></p>
                </div>
                <%if(activeWorker.getWorkerPermission()>2) {%>
                <table class="table table-bordered table-hover" style="margin-bottom: 0px;">
                <thead>
                <tr>
	                <td colspan="4">
	                	<strong>参与培训员工信息</strong>
	                </td>
               	</tr>
               	<tr>
                	<td>
	                	序号
	                </td>
	                <td>
	                	员工号
	                </td>
	                <td>
	                	姓名
	                </td>
	                <td>
	                	评分
	                </td>
               	</tr>
                </thead>
                
                <%int cultivationPersonNum = 1;
                Set<Cultivationperson> cultivationpersonList = cultivation.getCultivationpersons();
                if(cultivationpersonList.isEmpty()) {%>
                <tr>
	                <td colspan="4">
	                	暂无员工报名。
	                </td>
                </tr>
                <%} else 
                for(Cultivationperson cultivationperson : cultivationpersonList) { %>
                <tr>
	                <td>
	                	<%=cultivationPersonNum %>
	                </td>
	                <td>
	                	<%=cultivationperson.getWorker().getWorkerNo() %>
	                </td>
	                <td>
	                	<%=cultivationperson.getWorker().getWorkerName() %>
	                </td>
	                <td style="width:200px;">
	                	<%if(cultivationperson.getCultivationPersonMark()==null) {%>
	                	<%if(cultivation.getWorker().getWorkerOid().equals(activeWorker.getWorkerOid())) {%>
	                	<form action="RankCultivationPerson" method="post">
	                	<input type="hidden" name=cultivationPersonOid value="<%=cultivationperson.getCultivationPersonOid() %>">
	                	<select name="cultivationPersonMark" class="form-control" style=" width:70%; float:left;">
	                	<option value="0">不及格</option>
	                	<option value="1">及格</option>
	                	<option value="2">中等</option>
	                	<option value="3">良好</option>
	                	<option value="4">优秀</option>
	                	</select>
	                	<button type="submit" class="btn btn-outline btn-default" style=" width:30%; float:left;">提交</button>
	                	</form>
	                	<%} else {%>
	                	<button class="btn btn-default btn-block" style="color: #000000; float:left; text-align: left;padding-left: 15px;" disabled="disabled">未评分</button>
	                	<%} %>
	                	<%} else {%>
	                	<button class="btn btn-default btn-block" style="color: #000000; float:left; text-align: left;padding-left: 15px;" disabled="disabled"><%=returnMark(cultivationperson.getCultivationPersonMark()) %></button>
	                	<%} %>
	                </td>
                </tr>
                <%cultivationPersonNum++;} %>
                </table>
                <%} else {%>
                <%if(cultivation.getCultivationpersons().retainAll(activeWorker.getCultivationpersons())) {%>
                 <button class="btn btn-default btn-block" style="margin-bottom: 0px;" disabled="disabled">已经报名</button>
                <%} else {%>
                <form action="NewCultivationPerson" method="post">
                <input type="hidden" name="cultivationOid" value="<%=cultivation.getCultivationOid() %>">
                <button class="btn btn-outline btn-primary btn-block" style="margin-bottom: 0px;">我要报名</button>
                </form>
                <%} }%>
            </div>
        </div>
        <%i++;}
        if(listNum==0) { out.print("　无未开始培训。");}%>
        
        <h2 class="sub-header">已完成培训</h2>
		<%
		if(!cultivationList.isEmpty())
        for(Cultivation cultivation : cultivationList) {%>
        <%
        Date date = new Date();
        long time1 = date.getTime() - cultivation.getCultivationBeginDate().getTime();
        long time2 = cultivation.getCultivationEndDate().getTime() - cultivation.getCultivationBeginDate().getTime();
        double percent = (double)time1/time2*100;
        if(percent<100) continue;
        listNum++;
        %>
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
			        <a data-toggle="collapse" href="#collapse<%=i %>" aria-expanded="false" class="collapsed">
			          	<%=cultivation.getCultivationProject() %>
			        </a>
			        <a data-toggle="collapse" href="#collapse<%=i %>" aria-expanded="false" class="collapsed" style="float:right">
			          	已完成
			        </a>
		      	</h4>
            </div>
            <div class="panel-body collapse" id="collapse<%=i %>" aria-expanded="false" style="height: 30px;">
				<div class="row">
					<div class="col-sm-4" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训时间</h4>
							<p><%=simpledateformat.format(cultivation.getCultivationBeginDate()) %>~<%=simpledateformat.format(cultivation.getCultivationEndDate()) %></p>
		                </div>
					</div>
					<div class="col-sm-3" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训类型</h4>
							<p><%=cultivation.getCultivationType() %></p>
		                </div>
					</div>
					<div class="col-sm-3" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训地点</h4>
							<p><%=cultivation.getCultivationLocation() %></p>
		                </div>
					</div>
					<div class="col-sm-2">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>负责人</h4>
							<p><%=cultivation.getWorker().getWorkerName() %></p>
		                </div>
					</div>
				</div>
				<div class="well" style="margin-bottom: 15px;">
                    <h4>培训说明</h4>
                    <p><%=cultivation.getCultivationInstruction() %></p>
                </div>
                <%if(activeWorker.getWorkerPermission()>2) {%>
                <table class="table table-bordered table-hover" style="margin-bottom: 0px;">
                <thead>
                <tr>
	                <td colspan="4">
	                	<strong>参与培训员工信息</strong>
	                </td>
               	</tr>
               	<tr>
                	<td>
	                	序号
	                </td>
	                <td>
	                	员工号
	                </td>
	                <td>
	                	姓名
	                </td>
	                <td>
	                	评分
	                </td>
               	</tr>
                </thead>
                
                <%int cultivationPersonNum = 1;
                Set<Cultivationperson> cultivationpersonList = cultivation.getCultivationpersons();
                if(cultivationpersonList.isEmpty()) {%>
                <tr>
	                <td colspan="4">
	                	暂无员工报名。
	                </td>
                </tr>
                <%} else 
                for(Cultivationperson cultivationperson : cultivationpersonList) { %>
                <tr>
	                <td>
	                	<%=cultivationPersonNum %>
	                </td>
	                <td>
	                	<%=cultivationperson.getWorker().getWorkerNo() %>
	                </td>
	                <td>
	                	<%=cultivationperson.getWorker().getWorkerName() %>
	                </td>
	                <td style="width:200px;">
	                	<%if(cultivationperson.getCultivationPersonMark()==null) {%>
	                	<%if(cultivation.getWorker().getWorkerOid().equals(activeWorker.getWorkerOid())) {%>
	                	<form action="RankCultivationPerson" method="post">
	                	<input type="hidden" name=cultivationPersonOid value="<%=cultivationperson.getCultivationPersonOid() %>">
	                	<select name="cultivationPersonMark" class="form-control" style=" width:70%; float:left;">
	                	<option value="0">不及格</option>
	                	<option value="1">及格</option>
	                	<option value="2">中等</option>
	                	<option value="3">良好</option>
	                	<option value="4">优秀</option>
	                	</select>
	                	<button type="submit" class="btn btn-outline btn-default" style=" width:30%; float:left;">提交</button>
	                	</form>
	                	<%} else {%>
	                	<button class="btn btn-default btn-block" style="color: #000000; float:left; text-align: left;padding-left: 15px;" disabled="disabled">未评分</button>
	                	<%} %>
	                	<%} else {%>
	                	<button class="btn btn-default btn-block" style="color: #000000; float:left; text-align: left;padding-left: 15px;" disabled="disabled"><%=returnMark(cultivationperson.getCultivationPersonMark()) %></button>
	                	<%} %>
	                </td>
                </tr>
                <%cultivationPersonNum++;} %>
                </table>
                <%} else {%>
                <%if(cultivation.getCultivationpersons().retainAll(activeWorker.getCultivationpersons())) {%>
                 <button class="btn btn-default btn-block" style="margin-bottom: 0px;" disabled="disabled">已经报名</button>
                <%} else {%>
                <button class="btn btn-default btn-block" style="margin-bottom: 0px;" disabled="disabled">已经结束</button>
                <%} }%>
            </div>
        </div>
        <%i++;}
        if(listNum==0) { out.print("　无已完成培训。");}%>
  </body>
</html>