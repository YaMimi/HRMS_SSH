<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
        <div class="div-mid-attend">
            <div style="width:260px;height:260px;margin-bottom: 20px;">
            <button id="attendButton" type="button" class="animation-attend-0"  onclick="loading()" autocomplete="off"></button>
            <script>
                function loading() {
                    var btn = document.getElementById("attendButton");
                    btn.className="animation-loading";
                    btn.disabled=true;
                    setTimeout(function () { btn.className="animation-attend-0";btn.disabled=false;document.getElementById("attendSubmit").click(); },2000);
                }
            </script>
            </div>
        <form action="workerAttendanceInsert" method="post">
            <input type="text" class="form-control" name="attendWorkerNo" autofocus required placeholder="请输入您的员工号" style="width: 250px;margin-left: 5px;text-align: center;font-size: 15px;left: 50%">
            <input type="submit" id="attendSubmit" style="display: none;">
        </form>
        </div>
    </div>
</body>
</html>