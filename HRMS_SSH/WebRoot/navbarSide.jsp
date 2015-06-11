<%@ page pageEncoding="UTF-8"%>
<%path = request.getServletPath(); %>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar"> 
                <li<%if(path.equals("/index.jsp")) {%> class="active"<%} %>><a href="#">　个人首页 </a></li>
                
                <li><%if(path.equals("/workerCheck.jsp")||path.equals("/workerManager.jsp")||path.equals("/workerAdd.jsp")) {%><a href="#workerSystem" class="nav-header"  data-toggle="collapse" aria-expanded="true"><%} else {%><a href="#workerSystem" class="nav-header collapsed" data-toggle="collapse"><%} %>　信息系统<i class="pull-right icon-sidebar-collapse"></i></a>
                    <%if(path.equals("/workerCheck.jsp")||path.equals("/workerManager.jsp")||path.equals("/workerAdd.jsp")) {%><ul id="workerSystem" class="nav nav-sidebar nav-sec collapse in" aria-expanded="true"><%} else {%><ul id="workerSystem" class="nav nav-sidebar nav-sec collapse"><%} %>
                        <li<%if(path.equals("/workerCheck.jsp")) {%> class="active"<%} %>>
                            <a href="#">个人信息</a>
                        </li>
                        <li<%if(path.equals("/workerManager.jsp")) {%> class="active"<%} %>>
                            <a href="#">信息管理</a>
                        </li>
                        <li<%if(path.equals("/workerAdd.jsp")) {%> class="active"<%} %>>
                            <a href="#">新增员工</a>
                        </li>
                    </ul>
                </li>
                
                <li><%if(path.equals("/attendanceCheck.jsp")||path.equals("/attendanceVct.jsp")||path.equals("/attendanceVctCheck.jsp")||path.equals("/attendanceDepartment.jsp")) {%><a href="#attendanceSystem" class="nav-header"  data-toggle="collapse" aria-expanded="true"><%} else {%><a href="#attendanceSystem" class="nav-header collapsed" data-toggle="collapse"><%} %>　签到系统<i class="pull-right icon-sidebar-collapse"></i></a>
                    <%if(path.equals("/attendanceCheck.jsp")||path.equals("/attendanceVct.jsp")||path.equals("/attendanceVctCheck.jsp")||path.equals("/attendanceDepartment.jsp")) {%><ul id="attendanceSystem" class="nav nav-sidebar nav-sec collapse in" aria-expanded="true"><%} else {%><ul id="attendanceSystem" class="nav nav-sidebar nav-sec collapse"><%} %>
                        <li<%if(path.equals("/attendanceCheck.jsp")) {%> class="active"<%} %>>
                            <a href="attendanceCheck.jsp">签到查询</a>
                        </li>
                        <li<%if(path.equals("/attendanceVct.jsp")) {%> class="active"<%} %>>
                            <a href="attendanceVct.jsp">请假系统</a>
                        </li>
                        <li<%if(path.equals("/attendanceVctCheck.jsp")) {%> class="active"<%} %>>
                            <a href="attendanceVctCheck.jsp">请假审批</a>
                        </li>
                        <%if(activeWorker.getWorkerPermission()>=2) {%>
                        <li<%if(path.equals("/attendanceDepartment.jsp")) {%> class="active"<%} %>>
                            <a href="attendanceDepartment.jsp">部门考勤</a>
                        </li>
                        <%} %>
                    </ul>
                </li>
                
                <%if(activeWorker.getWorkerPermission()>=2||activeWorker.getDepartment().getDepartmentOid()!=2) {%>
                <li><%if(path.equals("/departmentCheck.jsp")||path.equals("/departmentAdd.jsp")||path.equals("/departmentEdit.jsp")) {%><a href="#departmentSystem" class="nav-header"  data-toggle="collapse" aria-expanded="true"><%} else {%><a href="#departmentSystem" class="nav-header collapsed" data-toggle="collapse"><%} %>　部门系统<i class="pull-right icon-sidebar-collapse"></i></a>
                    <%if(path.equals("/departmentCheck.jsp")||path.equals("/departmentAdd.jsp")||path.equals("/departmentEdit.jsp")) {%><ul id="departmentSystem" class="nav nav-sidebar nav-sec collapse in" aria-expanded="true"><%} else {%><ul id="departmentSystem" class="nav nav-sidebar nav-sec  collapse"><%} %>
                        <li<%if(path.equals("/departmentCheck.jsp")) {%> class="active"<%} %>>
                            <a href="departmentCheck.jsp">部门调整</a>
                        </li>
                        <li<%if(path.equals("/departmentAdd.jsp")) {%> class="active"<%} %>>
                            <a href="#">新增部门</a>
                        </li>
                        <%if(path.equals("/departmentEdit.jsp")) {%>
                        <li class="active">
                            <a href="departmentEdit.jsp">部门修改</a>
                        </li>
                        <%} %>
                    </ul>
                 </li>
                 <%} %>
                 
                 <li><%if(path.equals("/salaryCheck.jsp")||path.equals("/salaryManager.jsp")||path.equals("/salaryROPManager.jsp")) {%><a href="#salarySystem" class="nav-header"  data-toggle="collapse" aria-expanded="true"><%} else {%><a href="#salarySystem" class="nav-header collapsed" data-toggle="collapse"><%} %>　工资系统<i class="pull-right icon-sidebar-collapse"></i></a>
                    <%if(path.equals("/salaryCheck.jsp")||path.equals("/salaryManager.jsp")||path.equals("/salaryROPManager.jsp")) {%><ul id="salarySystem" class="nav nav-sidebar nav-sec collapse in" aria-expanded="true"><%} else {%><ul id="salarySystem" class="nav nav-sidebar nav-sec  collapse"><%} %>
                        <li<%if(path.equals("/salaryCheck.jsp")) {%> class="active"<%} %>>
                            <a href="#">工资查询</a>
                        </li>
                        <li<%if(path.equals("/salaryManager.jsp")) {%> class="active"<%} %>>
                            <a href="#">工资管理</a>
                        </li>
                        <li<%if(path.equals("/salaryROPManager.jsp")) {%> class="active"<%} %>>
                            <a href="#">奖惩管理</a>
                        </li>
                    </ul>
                 </li>
                 
                 <li><%if(path.equals("/cultivationCheck.jsp")||path.equals("/cultivationManager.jsp")||path.equals("/cultivationAdd.jsp")) {%><a href="#cultivationSystem" class="nav-header"  data-toggle="collapse" aria-expanded="true"><%} else {%><a href="#cultivationSystem" class="nav-header collapsed" data-toggle="collapse"><%} %>　培训系统<i class="pull-right icon-sidebar-collapse"></i></a>
                    <%if(path.equals("/cultivationCheck.jsp")||path.equals("/cultivationManager.jsp")||path.equals("/cultivationAdd.jsp")) {%><ul id="cultivationSystem" class="nav nav-sidebar nav-sec collapse in" aria-expanded="true"><%} else {%><ul id="cultivationSystem" class="nav nav-sidebar nav-sec collapse"><%} %>
                        <li<%if(path.equals("/cultivationCheck.jsp")) {%> class="active"<%} %>>
                            <a href="#">培训查询</a>
                        </li>
                        <li<%if(path.equals("/cultivationManager.jsp")) {%> class="active"<%} %>>
                            <a href="#">培训管理</a>
                        </li>
                        <li<%if(path.equals("/cultivationAdd.jsp")) {%> class="active"<%} %>>
                            <a href="#">新增培训</a>
                        </li>
                    </ul>
                 </li>
                 
                 <li><%if(path.equals("/afficheCheck.jsp")||path.equals("/afficheManager.jsp")||path.equals("/afficheAdd.jsp")) {%><a href="#afficheSystem" class="nav-header"  data-toggle="collapse" aria-expanded="true"><%} else {%><a href="#afficheSystem" class="nav-header collapsed" data-toggle="collapse"><%} %>　公告系统<i class="pull-right icon-sidebar-collapse"></i></a>
                    <%if(path.equals("/afficheCheck.jsp")||path.equals("/afficheManager.jsp")||path.equals("/afficheAdd.jsp")) {%><ul id="afficheSystem" class="nav nav-sidebar nav-sec collapse in" aria-expanded="true"><%} else {%><ul id="afficheSystem" class="nav nav-sidebar nav-sec  collapse"><%} %>
                        <li<%if(path.equals("/afficheCheck.jsp")) {%> class="active"<%} %>>
                            <a href="#">公告查询</a>
                        </li>
                        <li<%if(path.equals("/afficheManager.jsp")) {%> class="active"<%} %>>
                            <a href="#">公告管理</a>
                        </li>
                        <li<%if(path.equals("/afficheAdd.jsp")) {%> class="active"<%} %>>
                            <a href="#">新增公告</a>
                        </li>
                    </ul>
                 </li>
                 
                 <li<%if(path.equals("/message.jsp")) {%> class="active"<%} %>><a href="#">　私信系统 </a></li>
            </ul>
        </div>
    </div>
</div>
<%String nav = null; %>