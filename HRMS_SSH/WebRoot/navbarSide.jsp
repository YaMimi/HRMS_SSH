<%@ page pageEncoding="UTF-8"%>
<%path = request.getServletPath(); %>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar"> 
                <li<%if(path.equals("/index.jsp")) {%> class="active"<%} %>><a href="./index.jsp">　个人首页 </a></li>
                
                <li><%if(path.equals("/workerShow.jsp")||path.equals("/attendanceCheck.jsp")||path.equals("/attendanceVct.jsp")||path.equals("/workerChangePassword.jsp")) {%><a href="#workerSystem" class="nav-header"  data-toggle="collapse" aria-expanded="true"><%} else {%><a href="#workerSystem" class="nav-header collapsed" data-toggle="collapse"><%} %>　个人信息<i class="pull-right icon-sidebar-collapse"></i></a>
                    <%if(path.equals("/workerShow.jsp")||path.equals("/attendanceCheck.jsp")||path.equals("/attendanceVct.jsp")||path.equals("/workerChangePassword.jsp")) {%><ul id="workerSystem" class="nav nav-sidebar nav-sec collapse in" aria-expanded="true"><%} else {%><ul id="workerSystem" class="nav nav-sidebar nav-sec collapse"><%} %>
                        <li<%if(path.equals("/workerShow.jsp")) {%> class="active"<%} %>>
                            <a href="workerShow.jsp">我的信息</a>
                        </li>
                        <li<%if(path.equals("")) {%> class="active"<%} %>>
                            <a href="#">我的工资</a>
                        </li>
                        <li<%if(path.equals("")) {%> class="active"<%} %>>
                            <a href="#">我的培训</a>
                        </li>
                        <li<%if(path.equals("/attendanceCheck.jsp")) {%> class="active"<%} %>>
                            <a href="./attendanceCheck.jsp">我的考勤</a>
                        </li>
                        <%//if(activeWorker.getWorkerPermission()<4) {%>
                        <li<%if(path.equals("/attendanceVct.jsp")) {%> class="active"<%} %>>
                            <a href="./attendanceVct.jsp">我的请假</a>
                        </li>
                        <%//} %>
                        
                        <li<%if(path.equals("/workerChangePassword.jsp")) {%> class="active"<%} %>>
                            <a href="workerChangePassword.jsp">修改密码</a>
                        </li>
                    </ul>
                </li>
                
                <li><%if(path.equals("/attendanceVctCheck.jsp")||path.equals("/attendanceDepartment.jsp")) {%><a href="#attendanceSystem" class="nav-header"  data-toggle="collapse" aria-expanded="true"><%} else {%><a href="#attendanceSystem" class="nav-header collapsed" data-toggle="collapse"><%} %>　我的部门<i class="pull-right icon-sidebar-collapse"></i></a>
                    <%if(path.equals("/attendanceVctCheck.jsp")||path.equals("/attendanceDepartment.jsp")) {%><ul id="attendanceSystem" class="nav nav-sidebar nav-sec collapse in" aria-expanded="true"><%} else {%><ul id="attendanceSystem" class="nav nav-sidebar nav-sec collapse"><%} %>
                        <%if(activeWorker.getWorkerPermission()>2) {%>
                        <li<%if(path.equals("/attendanceVctCheck.jsp")) {%> class="active"<%} %>>
                            <a href="attendanceVctCheck.jsp">请假审批</a>
                        </li>
                        <li<%if(path.equals("/attendanceDepartment.jsp")) {%> class="active"<%} %>>
                            <a href="attendanceDepartment.jsp">当日考勤</a>
                        </li>
                        <%} %>
                    </ul>
                </li>
                
                        <%if(activeWorker.getWorkerPermission()>2) {%>
                         <li<%if(path.equals("/workerAdd.jsp")) {%> class="active"<%} %>>
                            <a href="workerAdd.jsp">　员工添加</a>
                        </li>
                        <%} %>
                   <%if(activeWorker.getWorkerPermission()>2) {%>
                <li<%if(path.equals("/workerManager.jsp")) {%> class="active"<%} %>><a href="workerManager.jsp">　员工维护 </a></li>
                <%}else{ %>
                  <li<%if(path.equals("/workerManager.jsp")) {%> class="active"<%} %>><a href="workerManager.jsp">　信息维护 </a></li>
                <%} %>
				<li<%if(path.equals("")) {%> class="active"<%} %>><a href="#">　部门维护 </a></li>
                 
                <li<%if(path.equals("/salaryCheck.jsp")) {%> class="active"<%} %>><a href="salaryCheck.jsp">　工资维护 </a></li>
                 
                <li<%if(path.equals("")) {%> class="active"<%} %>><a href="#">　培训维护 </a></li>
                 
                <li<%if(path.equals("/message.jsp")) {%> class="active"<%} %>><a href="./message.jsp">　公告系统 </a></li>
            </ul>
        </div>
    </div>
</div>
