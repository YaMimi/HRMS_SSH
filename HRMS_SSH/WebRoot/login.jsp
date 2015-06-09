<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hrms.pojo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String state = null;
Worker activeWorker = (Worker)session.getAttribute("activeWorker");
state = (String)session.getAttribute("state");
%>

<!DOCTYPE html>
<html>
<head lang="zh-CN">
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <link  href="./css/signin.css" rel="stylesheet"/>
    <link  href="./css/bootstrap.min.css" rel="stylesheet"/>
    <link  href="./css/font-awesome.min.css" rel="stylesheet"/>
    <title>登录</title>
</head>
<body>
<div class="container">
    <div class="div-mid">
            <div class="div-mid-logo">
                <img src="img/logo.png">
            </div>
            <%if(activeWorker!=null) {%>
            <div class="div-mid-login">
            	<form class="form-signin" action="Logout" method="post">
                    <img src="img/title.png">
			        <div class="alert alert-danger alert-dismissible" style="margin-top:0px; margin-bottom: 5px;" role="alert">
			        	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<i class="icon-remove-sign icon-large"></i> 你已登录！请先<a class="alert-link" href="Logout"> 登出系统。</a>
					</div>
                    <input type="text" name="username" class="form-control" style="margin-bottom: 5px;" placeholder="当前账号：<%=activeWorker.getWorkerNo() %>" disabled="disabled">
                    <a class="btn btn-lg btn-primary btn-block" href="./index.jsp">返回首页</a>
                    <button class="btn btn-lg btn-danger btn-block" type="submit">登出系统</button>
                 </form>
       		</div>
            <%} else {%>
            <div class="div-mid-login">
                <form class="form-signin" action="Login" method="post">
                    <img src="img/title.png">
                    <%if(state!=null&&state.equals("LOGOUTSUCCESS")) {%>
					<%session.setAttribute("state", null); %>
			        <div class="alert alert-success alert-dismissible" style="margin-top:0px; margin-bottom: 5px;" role="alert">
			        	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<i class="icon-exclamation-sign icon-large"></i> 登出成功！
					</div>
			        <%} %>
			       	<%if(state!=null&&state.equals("LOGINERROR")) {%>
					<%session.setAttribute("state", null); %>
			        <div class="alert alert-danger alert-dismissible" style="margin-top:0px; margin-bottom: 5px;" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<i class="icon-remove-sign icon-large"></i> 密码错误，请检查后重新输入。
					</div>
					<%} %>
					<%if(state!=null&&state.equals("LOGINEMPTY")) {%>
					<%session.setAttribute("state", null); %>
			        <div class="alert alert-danger alert-dismissible" style="margin-top:0px; margin-bottom: 5px;" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<i class="icon-remove-sign icon-large"></i> 用户名为空，请检查后重新输入。
					</div>
					<%} %>
                    <label for="inputEmail" class="sr-only">员工号</label>
                    <input type="text" id="inputEmail"  name="worker.workerNo" class="form-control" placeholder="账号" required="" autofocus="">
                    <label for="inputPassword" class="sr-only">密　码</label>
                    <input type="password" id="inputPassword" name="worker.password" class="form-control" placeholder="密码" required="">
                    <div class="checkbox">
                        <label >
                            <input type="checkbox" value="remember-me"> 记住我的登录状态
                        </label>
                        <label style="float:right">
                        <u><abbr title="如果您忘记了自己的登录密码，请带证件到人事部进行修改。">忘记密码？</abbr></u>
                        </label>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
              </form>
	       </div>
	       <%} %>
    </div>
</div>

		<!-- Bootstrap core JavaScript
	    ================================================== -->
	    <!-- Placed at the end of the document so the pages load faster -->
	    <script src="./js/jquery-2.1.3.min.js"></script>
	    <script src="./js/bootstrap.min.js"></script>
</body>
</html>