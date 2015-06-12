<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String state = (String)session.getAttribute("state"); %>
<!DOCTYPE html>
<html>
<head lang="zh-CN">
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <link  href="css/signin.css" rel="stylesheet"/>
    <link  href="css/bootstrap.min.css" rel="stylesheet"/>
    <title>签到</title>
</head>
<body>
    <div class="container">
    <%if(state==null) {%>
        <div class="div-mid-attend">
            <div style="width:260px;height:260px;margin-bottom: 20px;">
            <button id="attendButton" type="button" class="animation-attend-0"  onclick="sub()" autocomplete="off"></button>
            <script>        
            	function sub() {
                    document.getElementById("attendSubmit").click();
                }
                function loading() {
                    var btn = document.getElementById("attendButton");
                    btn.className="animation-loading";
                    btn.disabled=true;
                    var ipt = document.getElementById("attendInput");
                    ipt.readonly=true;
                }
            </script>
            </div>
        <form action="workerAttendanceInsert" method="post" onsubmit="loading()">
            <input type="text" id="attendInput" class="form-control" name="attendWorkerNo" autofocus required placeholder="请输入您的员工号" style="width: 250px;margin-left: 5px;text-align: center;font-size: 15px;left: 50%">
            <input type="submit" id="attendSubmit" style="display: none;">
        </form>
        </div>
    <%} else if(state.equals("ATTENDSUCCESS")) {%>
    <%session.setAttribute("state", null); %>
		<script language="JavaScript">
			function myrefresh()
			{
			   window.location.reload();
			}
			setTimeout('myrefresh()',3000);
		</script>
    	<div class="div-mid-attend">
            <div style="width:260px;height:260px;margin-bottom: 20px;">
            <button id="attendButton" type="button" class="animation-attend-1" disabled></button>
            </div>
        <form class="has-success">
            <input type="text" id="attendInput" class="form-control" name="attendWorkerNo" autofocus value="签到成功" readonly style="color:#3c763d;width: 250px;margin-left: 5px;text-align: center;font-size: 15px;left: 50%">
        </form>
        </div>
    <%} else if(state.equals("WORKERNULL")) {%>
    <%session.setAttribute("state", null); %>
    	<script language="JavaScript">
			function myrefresh()
			{
			   window.location.reload();
			}
			setTimeout('myrefresh()',3000);
		</script>
    	<div class="div-mid-attend">
            <div style="width:260px;height:260px;margin-bottom: 20px;">
            <button id="attendButton" type="button" class="animation-attend-2" disabled></button>
            </div>
        <form class="has-error">
            <input type="text" id="attendInput" class="form-control" name="attendWorkerNo" autofocus value="员工号不存在" readonly style="color:#a94442;width: 250px;margin-left: 5px;text-align: center;font-size: 15px;left: 50%">
        </form>
        </div>
    <%} else if(state.equals("ATTENDFAILED")) {%>
    <%session.setAttribute("state", null); %>
    	<script language="JavaScript">
			function myrefresh()
			{
			   window.location.reload();
			}
			setTimeout('myrefresh()',3000);
		</script>
    	<div class="div-mid-attend">
            <div style="width:260px;height:260px;margin-bottom: 20px;">
            <button id="attendButton" type="button" class="animation-attend-2" disabled></button>
            </div>
        <form class="has-error">
            <input type="text" id="attendInput" class="form-control" name="attendWorkerNo" autofocus value="数据库插入失败" readonly style="color:#a94442;width: 250px;margin-left: 5px;text-align: center;font-size: 15px;left: 50%">
        </form>
        </div>
    <%} else if(state.equals("ATTENDALREADY")) {%>
    <%session.setAttribute("state", null); %>
    	<script language="JavaScript">
			function myrefresh()
			{
			   window.location.reload();
			}
			setTimeout('myrefresh()',3000);
		</script>
    	<div class="div-mid-attend">
            <div style="width:260px;height:260px;margin-bottom: 20px;">
            <button id="attendButton" type="button" class="animation-attend-2" disabled></button>
            </div>
        <form class="has-error">
            <input type="text" id="attendInput" class="form-control" name="attendWorkerNo" autofocus value="今天签到次数已满" readonly style="color:#a94442;width: 250px;margin-left: 5px;text-align: center;font-size: 15px;left: 50%">
        </form>
        </div>
    <%} else if(state.equals("INVACATION")) {%>
    <%session.setAttribute("state", null); %>
    	<script language="JavaScript">
			function myrefresh()
			{
			   window.location.reload();
			}
			setTimeout('myrefresh()',3000);
		</script>
    	<div class="div-mid-attend">
            <div style="width:260px;height:260px;margin-bottom: 20px;">
            <button id="attendButton" type="button" class="animation-attend-2" disabled></button>
            </div>
        <form class="has-error">
            <input type="text" id="attendInput" class="form-control" name="attendWorkerNo" autofocus value="休假状态不能签到" readonly style="color:#a94442;width: 250px;margin-left: 5px;text-align: center;font-size: 15px;left: 50%">
        </form>
        </div>
    <%} %>
    </div>
</body>
</html>