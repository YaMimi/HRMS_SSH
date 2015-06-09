<%@ page pageEncoding="UTF-8"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li<%if(nav.equals("index")) {%> class="active"<%} %>><a href="#"><i class="icon-large icon-home"></i> 个人首页 <span class="sr-only">(current)</span></a></li>
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
<%String nav = null; %>