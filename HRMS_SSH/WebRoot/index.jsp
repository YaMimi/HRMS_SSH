<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String state = null;
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
            <div class="div-mid-login">
                <form class="form-signin" action="checkLogin">
                    <img src="img/title.png">
                    <%
                    	if(state!=null)
                    	{
	                    	out.print("<div class='alert alert-danger' style='margin-top:0px; margin-bottom: 5px;' role='alert'><span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span> 用户名或密码错误</div>");
	                    	session.setAttribute("state",null);
                    	}
                    %>
                    <label for="inputEmail" class="sr-only">账号</label>
                    <input type="text" id="inputEmail"  name="username" class="form-control" placeholder="账号" required="" autofocus="">
                    <label for="inputPassword" class="sr-only">密码</label>
                    <input type="password" id="inputPassword" name="password" class="form-control" placeholder="密码" required="">
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
    </div>
</div>
</body>
</html>
<%session.invalidate();%>