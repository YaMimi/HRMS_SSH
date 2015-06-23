<%@page import="com.hrms.page.bean.PageBean"%>
<%@ include file="loginCheck.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hrms.pojo.*" %>
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
    <title>公告系统</title>
  </head>
  
  <body>
  
  	<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
    <s:action name="ShowMessage" executeResult="false" namespace="/"/>
    <%
	List<Message> messageListFull = (List<Message>)session.getAttribute("messageListFull");
	PageBean pagebean = (PageBean)session.getAttribute("pageBean");
	activeWorker = (Worker)session.getAttribute("activeWorker");
	%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <h1 class="page-header">公告系统</h1>
         <%if(activeWorker.getWorkerPermission()>2) {%>
         <button class="btn btn-primary btn-block" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
         		  发布新公告
	     </button>
	     <div class="collapse" id="collapseExample">
		  <div class="well" style="margin-bottom: 0px;">
		    <form action="NewMessage" method="post">
		    <input type="text" class="form-control" name="message.messageTitle" maxlength="10" placeholder="公告标题，最大长度10字。" required="required" autofocus="autofocus">
		    <br>
		    <textarea class="form-control"  name="message.messageContent" maxlength="50" rows="2" placeholder="公告内容，最大长度50字。" required="required" style="resize: none;"></textarea>
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
         <table class="table table-hover">
         <%if(!messageListFull.isEmpty()) 
         	for(Message message : messageListFull){ %>
      		<tr>
      			<td style="padding-top: 0px;padding-bottom: 15px;">
					<div class="col-sm-12" style="text-align: left;">
							<h3><strong><%=message.getMessageTitle() %></strong></h3>
					</div>
					<div class="col-sm-12" style="text-align: left; margin-bottom: 5px;">
							<h4><%=message.getMessageContent() %></h4>
					</div>
					<div class="col-sm-9" style="text-align: left;">
							<i class="fa fa-user"> <%=message.getWorker().getWorkerName() %></i>
					</div>
					<div class="col-sm-3" style="text-align: right;">
							<i class="fa fa-clock-o"> <%=simpledateformat.format(message.getMessageDate()) %></i>
					</div>
      			</td>
      		</tr>
      		<%} %>
      		<tr><td></td></tr>
      	</table>
      	<div class="container-fluid">
			<nav>
			  <ul class="pagination">
			    <%if(pagebean.getCurrentPage()==1){ %>
			    <li>
			      <a href="#" aria-label="Previous">
			      	上一页
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <%}else{ %>
			    <li>
			      <a href="ShowMessage.action?page=<%=pagebean.getCurrentPage()-1 %>" aria-label="Previous">
			      	上一页
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
		        <%} %>
		        <%for(int j = 1; j <= pagebean.getTotalPage(); j++){ %>
				    <%if(pagebean.getCurrentPage()==j){ %>
				    	<li class="active"><a href="ShowMessage.action?page=<%=j %>"><%=j %></a></li>
				    <%}else{ %>
				    	<li><a href="ShowMessage.action?page=<%=j %>"><%=j %></a></li>
				    <%} %>
			    <%} %>
			    <%if(pagebean.getCurrentPage()!=pagebean.getTotalPage()){ %>
			    <li>
			      <a href="ShowMessage.action?page=<%=pagebean.getCurrentPage()+1 %>" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			        	下一页
			      </a>
			    </li>
			    <%}else{ %>
			    <li>
			      <a href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			        	下一页
			      </a>
			    </li>
			    <%} %>
			  </ul>
			</nav>
		</div>
    </div>
  </body>
</html>
