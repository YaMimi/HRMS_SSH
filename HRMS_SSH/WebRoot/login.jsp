<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hrms.pojo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String state = null;
Worker worker = (Worker)session.getAttribute("activeWorker");
state = (String)session.getAttribute("state");
%>

<!DOCTYPE html>
<html>
<head lang="zh-CN">
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <link  href="css/signin.css" rel="stylesheet"/>
    <link  href="css/bootstrap.min.css" rel="stylesheet"/>
    <title>登录</title>
</head>
<body>
<div class="container">
    <div class="div-mid">
            <div class="div-mid-logo">
                <img src="img/logo.png">
            </div>
            <%if(worker!=null) {%>
            <div class="div-mid-login">
                    <img src="img/title.png">
			        <div class="alert alert-success alert-dismissible" style="margin-top:0px; margin-bottom: 5px;" role="alert">
			        	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<i class="icon-remove-sign icon-large"></i>　你已经登录，请勿重复操作！ <a class="alert-link" href="Logout"> 登出系统。</a>
					</div>
                    <input type="text" name="username" class="form-control" placeholder="员工号" disabled="disabled">
                    <input type="password" id="inputPassword" name="password" class="form-control" placeholder="密　码" disabled="disabled">
                    <div class="checkbox">
                        <label >
                            <input type="checkbox" value="remember-me" disabled="disabled"> 记住我的登录状态
                        </label>
                        <label style="float:right">
                        <u><abbr title="如果您忘记了自己的登录密码，请带证件到人事部进行修改。">忘记密码？</abbr></u>
                        </label>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit" disabled="disabled">登录</button>
       		</div>
            <%} else {%>
            <div class="div-mid-login">
                <form class="form-signin" action="Login" method="post">
                    <img src="img/title.png">
                    <%if(state!=null&&state.equals("LOGOUTSUCCESS")) {%>
					<%session.setAttribute("state", null); %>
			        <div class="alert alert-success alert-dismissible" style="margin-top:0px; margin-bottom: 5px;" role="alert">
			        	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<i class="icon-exclamation-sign icon-large"></i>　登出成功！
					</div>
			        <%} %>
			       	<%if(state!=null&&state.equals("LOGINERROR")) {%>
					<%session.setAttribute("state", null); %>
			        <div class="alert alert-danger alert-dismissible" style="margin-top:0px; margin-bottom: 5px;" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<i class="icon-remove-sign icon-large"></i>　密码错误，请检查后重新输入。 <a class="alert-link" href="./register.jsp"> 现在注册。</a>
					</div>
					<%} %>
					<%if(state!=null&&state.equals("LOGINEMPTY")) {%>
					<%session.setAttribute("state", null); %>
			        <div class="alert alert-danger alert-dismissible" style="margin-top:0px; margin-bottom: 5px;" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<i class="icon-remove-sign icon-large"></i>　用户名为空，请检查后重新输入。 <a class="alert-link" href="./register.jsp"> 现在注册。</a>
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
</body>
</html>