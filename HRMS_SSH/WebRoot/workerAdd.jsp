<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="com.hrms.pojo.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 Worker activeWorker = (Worker)session.getAttribute("activeWorker");
 %>
<s:action name="WorkerAdd" executeResult="false" namespace="/"/>
<!DOCTYPE html>
<html>
<head lang="zh-CN">
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <link  href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/font-awesome.min.css" rel="stylesheet"/>
    <link  href="css/dashboard.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="plugin/jquery-ui-1.11.4.custom/jquery-ui.css">
    <script src="./js/jquery-2.1.3.min.js"></script>
    <script src="plugin/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script>
  		$(function() {
  			$( "#datepicker_start" ).datepicker({dateFormat: "yy-mm-dd"});
  		});
  	</script>
  		<script type="text/javascript">

 function addWorker() {//修改

alert("对不起，您没有添加员工权限！");      
    }
   </script>
  	
  	
  	<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <title>添加员工信息</title>
</head>
<body>
   
  
     <br><br><%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
            
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">添加员工</h1>
                <div class="row">
                <div class="col-sm-8">
                <label>请填写员工信息然后点击添加员工按钮进行添加操作：</label>
				</div>
				 <%
              String successAdd=(String)ActionContext.getContext().getSession().get("successAdd");
              String successAdd1=(String)ActionContext.getContext().getSession().remove("successAdd");
                  if(successAdd1!=null){%>
             <script  type="text/javascript">
               alert("添加成功！");
               </script>
              <% }%>
              
				<form action="Add" method="post" onsubmit="return checkValidate()">
				<div class="col-sm-4">
				<%if(activeWorker.getWorkerPermission()==4||activeWorker.getWorkerPermission()==3) {%>
				<button  class='btn btn-primary' type="submit" style="width: 40%; float: right;"><i class="fa fa-check"></i> 添加员工</button>
				<%}else{%>
				<button class='btn btn-primary' type="button" style="width: 40%; float: right;" onclick="addWorker()"><i class="fa fa-check"></i> 添加员工</button>
				<%}%>
				

				</div>
                </div>
                <table class="table table-bordered table-hover">
				<tr style="background-color: #EED5D2;">
	              <th style="padding-left: 21px;"><strong>姓名</strong></th>
	              <th style="padding-left: 21px;"></i>员工号</strong></th>
	              <th style="padding-left: 21px;"><strong>性别</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " name="worker.workerName" placeholder="姓名" value="" required  ></th>
	              <th><input type="text" class="form-control " name="worker.workerNo" placeholder="员工号" value="${WorkerAdmiNo }" readonly="readonly" required></th>
	              <th><select name="worker.workerSex" class="form-control"><option value="男" >男</option><option value="女" >女</option></select></th>
	            </tr>
	            <tr style="background-color: #E0FFFF;">
	              <th style="padding-left: 21px;"><strong>部门</strong></th>
	              <th style="padding-left: 21px;"><strong>职称</strong></th>
	              <th style="padding-left: 21px;"><strong>入职时间</strong></th>
	              
	            </tr>
	            <tr>
	              <th>
	         	<%
	ArrayList<Department> depart=(ArrayList<Department>)ActionContext.getContext().getSession().get("department1");
  out.println("	<select name='department.departmentName' size='1' class='form-control'>");
  for(int i=0;i<depart.size();i++){
    out.println("<option value='"+depart.get(i).getDepartmentName()+"'>"+depart.get(i).getDepartmentName()+"</option>");
       }
         out.println("	</select>");
	        %>
	              </th>
	              <th><select name="worker.workerPermission" class="form-control">
	              <option value="1">普通员工</option>
	              <option value="2">组长</option>
	              <option value="3">部门经理</option>
	              <option value="4">总经理</option>
	              </select></th>
	              <th><input type="text" class="form-control " name="worker.workerEntryDate" placeholder="入职时间 " value="" required  style="width: 98%" class="form-control"     onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></th>
	            </tr>
	            <tr style="background-color: #EED5D2;">
	              <th style="padding-left: 21px;"><strong>身份证号</strong></th>
	              <th style="padding-left: 21px;"><strong>出生日期</strong></th>
	              <th style="padding-left: 21px;"><strong>年龄</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " name="worker.workerId" id="workerId" placeholder="身份证号" value="" required></th>
	              <th><input type="text" class="form-control " name="worker.workerBirthDate" id="workerBirthDate"  placeholder="出生日期 " onchange="CalAge()" value="" required  style="width: 98%" class="form-control"     onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></th>
	              <th><input type="text" class="form-control " name="worker.workerAge" id="workerAge" placeholder="年龄 "  value="0" required></th>
	            </tr>
	            <tr style="background-color: #E0FFFF;">
	              <th style="padding-left: 21px;"><strong>籍贯</strong></th>
	              <th style="padding-left: 21px;"><strong>地址</strong></th>
	              <th style="padding-left: 21px;"><strong>血型</strong></th>
	            </tr>
	            <tr>
	              <th>
	              <select name="worker.workerBirthPlace" class="form-control">
	              <option value="广东">广东</option>
	              <option value="江苏">江苏</option>
	              <option value="山东">山东</option>
	              <option value="浙江">浙江</option>
	              <option value="河南">河南</option>
	              <option value="河北">河北</option>
	              <option value="辽宁">辽宁</option>
	              <option value="上海">上海</option>
	              <option value="四川">四川</option>
	              <option value="湖南">湖南</option>
	              <option value="湖北">湖北</option>
	              <option value="福建">福建</option>
	              <option value="北京">北京</option>
	              <option value="安徽">安徽</option>
	              <option value="内蒙">内蒙</option>
	              <option value="黑龙江">黑龙江</option>
	              <option value="陕西">陕西</option>
	              <option value="广西">广西</option>
	              <option value="江西">江西</option>
	              <option value="天津">天津</option>
	              <option value="吉林">吉林</option>
	              <option value="山西">山西</option>
	              <option value="重庆">重庆</option>
	              <option value="云南">云南</option>
	              <option value="新疆">新疆</option>
	              <option value="贵州">贵州</option>
	              <option value="甘肃">甘肃</option>
	              <option value="海南">海南</option>
	              <option value="宁夏">宁夏</option>
	              <option value="青海">青海</option>
	              <option value="西藏">西藏</option>
	              </select>
	              </th>
	              <th><input type="text" class="form-control " name="worker.workerAddress" placeholder="地址" value="" required></th>
	              <th>
	                 <select name="worker.workerBloodType" class="form-control">
	              <option value="A">A</option>
	              <option value="B">B</option>
	              <option value="O">O</option>
	              <option value="AB">AB</option>
	              </select>
	              </th>
	            </tr>
	            <tr>
	            </tr>
	            <tr style="background-color:#EED5D2;">
	              <th style="padding-left: 21px;"><strong>政治面貌</strong></th>
	              <th style="padding-left: 21px;"><strong>民族</strong></th>
	              <th style="padding-left: 21px;"><strong>教育水平</strong></th>
	            </tr>
	            <tr>
	              <th>
	              <select name="worker.workerPolitical" class="form-control">
	              <option value="党员">党员</option>
	              <option value="预备党员">预备党员</option>
	              <option value="共青团员">共青团员</option>
	              <option value="群众">群众</option>
	              </select>
	              </th>
	              <th>
	              <select name="worker.workerEthnic" class="form-control">
	              <option value="汉族">汉族</option>
	              <option value="回族">回族</option>
	              <option value="白族">白族</option>
	              <option value="保安族">保安族</option>
	              <option value="布朗族">布朗族</option>
	              <option value="布依族">布依族</option>
	              <option value="朝鲜族">朝鲜族</option>
	              <option value="达斡族">达斡族</option>
	              <option value="傣 族">傣 族</option>
	              <option value="德昂族">德昂族</option>
	              <option value="阿昌族">阿昌族</option>
	              <option value="侗 族">侗 族</option>
	              <option value="东乡族">东乡族</option>
	              <option value="独龙族">独龙族</option>
	              <option value="鄂伦春族">鄂伦春族</option>
	              <option value="俄罗斯族">俄罗斯族</option>
	              <option value="鄂温克族">鄂温克族</option>
	              <option value="高山族">高山族</option>
	              <option value="仡佬族">仡佬族</option>
	              <option value="哈尼族">哈尼族</option>
	              <option value="哈萨克族">哈萨克族</option>
	              <option value="赫哲族">赫哲族</option>
	              <option value="基诺族">基诺族</option>
	              <option value="京 族">京 族</option>
	              <option value="景颇族">景颇族</option>
	              <option value="柯尔克孜族">柯尔克孜族</option>
	              <option value="黎 族">黎 族</option>
	              <option value="满 族">满 族</option>
	              <option value="蒙古族">蒙古族</option>
	              <option value="纳西族">纳西族</option>
	              <option value="羌 族">羌 族</option>
	              <option value="土家族">土家族</option>
	              </select>
	              </th>
	              <th>
	              <select name="worker.workerEducation" class="form-control">
	              <option value="研究生">研究生</option>
	              <option value="本科">本科</option>
	              <option value="大专">大专</option>
	              <option value="中专">中专</option>
	              <option value="高中">高中</option>
	              <option value="初中">初中</option>
	              <option value="小学">小学</option>
	              </select>
	              </th>
	            </tr>
	            <tr style="background-color: #E0FFFF;">
	              <th style="padding-left: 21px;"><strong>电话</strong></th>
	              <th style="padding-left: 21px;"><strong>国籍</strong></th>
	              <th style="padding-left: 21px;"><strong>密码</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " name="worker.workerPhone" id="workerPhone" placeholder="电话 " value="" required></th>
	              <th>
	              <select name="worker.workerNationality" class="form-control">
	              <option value="中国">中国</option>
	              <option value="美国">美国</option>
	              <option value="英国">英国</option>
	              <option value="韩国">韩国</option>
	              <option value="朝鲜">朝鲜</option>
	              <option value="新加坡">新加坡</option>
	              <option value="日本">日本</option>
	              <option value="巴西">巴西</option>
	              <option value="古巴">古巴</option>
	              <option value="阿根廷">阿根廷</option>
	              <option value="巴巴多斯">巴巴多斯</option>
	              <option value="厄瓜多尔">厄瓜多尔</option>
	              <option value="墨西哥">墨西哥</option>
	              <option value="巴拿马">巴拿马</option>
	              <option value="秘鲁">秘鲁</option>
	              <option value="多米尼加共和国">多米尼加共和国</option>
	              </select>
	              </th>
	              <th><input type="password" class="form-control " name="worker.password" placeholder="密码 " value="123456" required></th>
	            </tr>
                </table>
                </form>
            </div>
    </div>
   
      <script  type="text/javascript">
      function checkValidate(){
      var workerPhone=document.getElementById("workerPhone").value;
      var card=document.getElementById("workerId").value;
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
   if(reg.test(card) === false)  
   {  
       alert("身份证输入不合法");  
         document.getElementById("workerId").value="";
           document.getElementById("workerId").focus();
       return  false;  
   }  
      
        if(workerPhone.length==0)
        {
           alert("请输入手机号码！");
           document.getElementById("workerPhone").value="";
           document.getElementById("workerPhone").focus();
           return false;
        }    
        if(workerPhone.length!=11)
        {
            alert("请输入有效的手机号码！");
            document.getElementById("workerPhone").value="";
            document.getElementById("workerPhone").focus();
            return false;
        }
        var myreg = /^(((13[0-9]{1})|159|153)+\d{8})$/;
        if(!myreg.test(workerPhone))
        {
            alert("请输入有效的手机号码");
            document.getElementById("workerPhone").value="";
            document.getElementById("workerPhone").focus();
            return false;
        }
        
      }
      
        function CalAge(){
          var workerBirthDate=document.getElementById("workerBirthDate").value;
          var nowData=new Date();
          var newm=nowData.getFullYear()-workerBirthDate.substr(0,4);
           document.getElementById("workerAge").value=newm;
        }
      	</script>
      	
</body>
</html>
