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
	<style>
        * {
            font-family: 'FontAwesome',"Microsoft YaHei" ! important;
        }
    </style>
    <title>我的培训</title>
  </head>
  
  <body>
  
  	<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">我的培训</h1>
		<h2 class="sub-header">进行中培训</h2>
		<%int i = 1;%>
		<%int listNum = 0; %>
		<%
		if(!cultivationPersonList.isEmpty())
        for(Cultivationperson cultivationperson : cultivationPersonList) {%>
        <%
        Date date = new Date();
        long time1 = date.getTime() - cultivationperson.getCultivation().getCultivationBeginDate().getTime();
        long time2 = cultivationperson.getCultivation().getCultivationEndDate().getTime() - cultivationperson.getCultivation().getCultivationBeginDate().getTime();
        double percent = (double)time1/time2*100;
        if(percent>100||percent<0) continue;
        listNum++;
        %>
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
			        <a data-toggle="collapse" href="#collapse<%=i %>" aria-expanded="false" class="collapsed">
			          	<%=cultivationperson.getCultivation().getCultivationProject() %>
			        </a>
			        <a data-toggle="collapse" href="#collapse<%=i %>" aria-expanded="false" class="collapsed" style="float:right">
			          <%=(int)percent %>%
			        </a>
		      	</h4>
            </div>
            <div class="panel-body collapse" id="collapse<%=i %>" aria-expanded="false" style="height: 30px;">
				<div class="row">
					<div class="col-sm-4" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训时间</h4>
							<p><%=simpledateformat.format(cultivationperson.getCultivation().getCultivationBeginDate()) %>~<%=simpledateformat.format(cultivationperson.getCultivation().getCultivationEndDate()) %></p>
		                </div>
					</div>
					<div class="col-sm-3" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训类型</h4>
							<p><%=cultivationperson.getCultivation().getCultivationType() %></p>
		                </div>
					</div>
					<div class="col-sm-3" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训地点</h4>
							<p><%=cultivationperson.getCultivation().getCultivationLocation() %></p>
		                </div>
					</div>
					<div class="col-sm-2">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>负责人</h4>
							<p><%=cultivationperson.getCultivation().getWorker().getWorkerName() %></p>
		                </div>
					</div>
				</div>
				<%if(cultivationperson.getCultivationPersonMark()==null) {%>
                <div class="well">
                    <h4>培训说明</h4>
                    <p><%=cultivationperson.getCultivation().getCultivationInstruction() %></p>
                </div>
                <form action="DeleteCultivationPerson" method="post">
                <input type="hidden" name=cultivationPersonOid value="<%=cultivationperson.getCultivationPersonOid() %>">
                <button type="submit" class="btn btn-outline btn-danger btn-block" style="margin-bottom: 0px;">退出培训</button>
                </form>
                <%} else {%>
                <div class="well" style="margin-bottom: 0px;">
                    <h4>培训说明</h4>
                    <p><%=cultivationperson.getCultivation().getCultivationInstruction() %></p>
                </div>
                <%} %>
            </div>
            <div class="panel-footer">
            <div class="progress progress-striped active" style="margin-bottom: 0px;">
                <div class="progress-bar" role="progressbar" aria-valuenow="<%=(int)percent %>" aria-valuemin="0" aria-valuemax="100" style="width: <%=percent %>%"></div>
            </div>
			</div>
        </div>
        <%i++;}
        if(listNum==0) { out.print("　无进行中培训。");}%>
        
        <h2 class="sub-header">未开始培训</h2>
		<%
		listNum = 0;
		if(!cultivationPersonList.isEmpty())
        for(Cultivationperson cultivationperson : cultivationPersonList) {%>
        <%
        Date date = new Date();
        long time1 = date.getTime() - cultivationperson.getCultivation().getCultivationBeginDate().getTime();
        long time2 = cultivationperson.getCultivation().getCultivationEndDate().getTime() - cultivationperson.getCultivation().getCultivationBeginDate().getTime();
        double percent = (double)time1/time2*100;
        if(percent>0) continue;
        listNum++;
        %>
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
			        <a data-toggle="collapse" href="#collapse<%=i %>" aria-expanded="false" class="collapsed">
			          	<%=cultivationperson.getCultivation().getCultivationProject() %>
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
							<p><%=simpledateformat.format(cultivationperson.getCultivation().getCultivationBeginDate()) %>~<%=simpledateformat.format(cultivationperson.getCultivation().getCultivationEndDate()) %></p>
		                </div>
					</div>
					<div class="col-sm-3" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训类型</h4>
							<p><%=cultivationperson.getCultivation().getCultivationType() %></p>
		                </div>
					</div>
					<div class="col-sm-3" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训地点</h4>
							<p><%=cultivationperson.getCultivation().getCultivationLocation() %></p>
		                </div>
					</div>
					<div class="col-sm-2">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>负责人</h4>
							<p><%=cultivationperson.getCultivation().getWorker().getWorkerName() %></p>
		                </div>
					</div>
				</div>
				<%if(cultivationperson.getCultivationPersonMark()==null) {%>
                <div class="well">
                    <h4>培训说明</h4>
                    <p><%=cultivationperson.getCultivation().getCultivationInstruction() %></p>
                </div>
                <form action="DeleteCultivationPerson" method="post">
                <input type="hidden" name=cultivationPersonOid value="<%=cultivationperson.getCultivationPersonOid() %>">
                <button type="submit" class="btn btn-outline btn-danger btn-block" style="margin-bottom: 0px;">退出培训</button>
                </form>
                <%} else {%>
                <div class="well" style="margin-bottom: 0px;">
                    <h4>培训说明</h4>
                    <p><%=cultivationperson.getCultivation().getCultivationInstruction() %></p>
                </div>
                <%} %>
            </div>
        </div>
        <%i++;}
        if(listNum==0) { out.print("　无未开始培训。");}%>
		
		<h2 class="sub-header">已完成培训</h2>
		<%
		listNum = 0;
		if(!cultivationPersonList.isEmpty())
        for(Cultivationperson cultivationperson : cultivationPersonList) {%>
        <%
        Date date = new Date();
        long time1 = date.getTime() - cultivationperson.getCultivation().getCultivationBeginDate().getTime();
        long time2 = cultivationperson.getCultivation().getCultivationEndDate().getTime() - cultivationperson.getCultivation().getCultivationBeginDate().getTime();
        double percent = (double)time1/time2*100;
        if(percent<100) continue;
        listNum++;
        %>
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
			        <a data-toggle="collapse" href="#collapse<%=i %>" aria-expanded="false" class="collapsed">
			          	<%=cultivationperson.getCultivation().getCultivationProject() %>
			        </a>
			        <a data-toggle="collapse" href="#collapse<%=i %>" aria-expanded="false" class="collapsed" style="float:right">
			          	<%if(cultivationperson.getCultivationPersonMark()!=null) out.print(returnMark(cultivationperson.getCultivationPersonMark())); else out.print("未评分"); %>
			        </a>
		      	</h4>
            </div>
            <div class="panel-body collapse" id="collapse<%=i %>" aria-expanded="false" style="height: 30px;">
				<div class="row">
					<div class="col-sm-4" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训时间</h4>
							<p><%=simpledateformat.format(cultivationperson.getCultivation().getCultivationBeginDate()) %>~<%=simpledateformat.format(cultivationperson.getCultivation().getCultivationEndDate()) %></p>
		                </div>
					</div>
					<div class="col-sm-3" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训类型</h4>
							<p><%=cultivationperson.getCultivation().getCultivationType() %></p>
		                </div>
					</div>
					<div class="col-sm-3" style="padding-right: 0px;">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>培训地点</h4>
							<p><%=cultivationperson.getCultivation().getCultivationLocation() %></p>
		                </div>
					</div>
					<div class="col-sm-2">
						<div class="well" style="margin-bottom: 15px;">
		                    <h4>负责人</h4>
							<p><%=cultivationperson.getCultivation().getWorker().getWorkerName() %></p>
		                </div>
					</div>
				</div>
                <%if(cultivationperson.getCultivationPersonMark()==null) {%>
                <div class="well">
                    <h4>培训说明</h4>
                    <p><%=cultivationperson.getCultivation().getCultivationInstruction() %></p>
                </div>
                <form action="DeleteCultivationPerson" method="post">
                <input type="hidden" name=cultivationPersonOid value="<%=cultivationperson.getCultivationPersonOid() %>">
                <button type="submit" class="btn btn-outline btn-danger btn-block" style="margin-bottom: 0px;">退出培训</button>
                </form>
                <%} else {%>
                <div class="well" style="margin-bottom: 0px;">
                    <h4>培训说明</h4>
                    <p><%=cultivationperson.getCultivation().getCultivationInstruction() %></p>
                </div>
                <%} %>
            </div>
        </div>
        <%i++;}
        if(listNum==0) { out.print("　无已完成培训。");}%>
  </body>
</html>
