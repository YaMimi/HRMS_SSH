<%@page import="com.hrms.pojo.Worker"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

%>


<!DOCTYPE html>
<html>
<head lang="zh-CN">
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <link  href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/font-awesome.min.css" rel="stylesheet"/>
    <link  href="css/dashboard.css" rel="stylesheet"/>
    <script src="./js/jquery-2.1.3.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <style>
        * {
            font-family: 'FontAwesome',"Microsoft YaHei" ! important;
        }
    </style>
    <title>主页</title>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"><img src="./img/brand.png" style="height: 20px;"></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right  ">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-large icon-envelope"></i>  <i class="icon-large icon-sort-down"></i></a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>部门公告</strong>
                                    <span class="pull-right text-muted">
                                        <em>昨日</em>
                                    </span>
                                    </div>
                                    <div>请人事部员工与周四下午3点与会议三室进行周会。</div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>系统公告</strong>
                                    <span class="pull-right text-muted">
                                        <em>1周前</em>
                                    </span>
                                    </div>
                                    <div>系统将于4月14号13-16点进行维护，届时将无法登陆。</div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>系统公告</strong>
                                    <span class="pull-right text-muted">
                                        <em>3周前</em>
                                    </span>
                                    </div>
                                    <div>请未更新员工ID卡的员工带ID卡到技术部进行更新。否则将无法正常使用。</div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a class="text-center" href="#">
                                    <strong>阅读所有信息</strong>
                                    <i class="icon-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                        <!-- /.dropdown-messages -->
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-large icon-flag"></i>  <i class="icon-large icon-sort-down"></i></a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>总经理</strong>
                                    <span class="pull-right text-muted">
                                        <em>前日</em>
                                    </span>
                                    </div>
                                    <div>小张，明天之前把这周的周报发到我的邮箱。</div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>总经理</strong>
                                    <span class="pull-right text-muted">
                                        <em>一周前</em>
                                    </span>
                                    </div>
                                    <div>小张，明天之前把周报发到我的邮箱。</div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>李小花</strong>
                                    <span class="pull-right text-muted">
                                        <em>一周前</em>
                                    </span>
                                    </div>
                                    <div>张哥，叫你下属帮我核实下我们部门新入职的员工信息，谢啦。</div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a class="text-center" href="#">
                                    <strong>阅读所有任务</strong>
                                    <i class="icon-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                        <!-- /.dropdown-messages -->
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-large icon-user"></i>  <i class="icon-large icon-sort-down"></i></a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="icon-user"></i> <%out.print("杨明杰"); %></a>
                            </li>
                            <li><a href="#" data-toggle="modal" data-target="#aboutModal"><i class="icon-info-sign"></i> 关于</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="#"><i class="icon-signout"></i> 登出系统</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="#"><i class="icon-large icon-home"></i> 个人首页 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#infoSystem" class="nav-header collapsed"  data-toggle="collapse"><i class="icon-large icon-user"></i> 信息系统<i class="pull-right icon-sidebar-collapse"></i></a>
                        <ul id="infoSystem" class="nav nav-sidebar nav-sec  collapse">
                            <li>
                                <a href="#">个人信息</a>
                            </li>
                            <li>
                                <a href="#">信息管理</a>
                            </li>
                            <li>
                                <a href="#">添加员工</a>
                            </li>
                        </ul>
                    <li><a href="#attendSystem" class="nav-header collapsed"  data-toggle="collapse"><i class="icon-large icon-check"></i> 签到系统<i class="pull-right icon-sidebar-collapse"></i></a>
                        <ul id="attendSystem" class="nav nav-sidebar nav-sec  collapse">
                            <li>
                                <a href="#">签到查询</a>
                            </li>
                            <li>
                                <a href="#">请假系统</a>
                            </li>
                            <li>
                                <a href="#">请假审批</a>
                            </li>
                            <li>
                                <a href="#">部门考勤</a>
                            </li>
                        </ul>
                    <li><a href="#departmentSystem" class="nav-header collapsed"  data-toggle="collapse"><i class="icon-large icon-group"></i> 部门系统<i class="pull-right icon-sidebar-collapse"></i></a>
                        <ul id="departmentSystem" class="nav nav-sidebar nav-sec  collapse">
                            <li>
                                <a href="#">部门调整</a>
                            </li>
                            <li>
                                <a href="#">新增部门</a>
                            </li>
                        </ul>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>