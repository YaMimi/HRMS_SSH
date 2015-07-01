<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="com.hrms.pojo.*"%>
<%@ page language="java" import="com.hrms.pojo.Department"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
 Worker activeWorker = (Worker)session.getAttribute("activeWorker");
 %>
<%
List<Worker> workerlist = (List<Worker>)session.getAttribute("listworker");
if(workerlist==null)
{
	%><jsp:forward page="/Select"/><%
}
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
List<Worker> WorkerList = workerlist;
workerlist = null;
session.setAttribute("workerlist", workerlist);
 %>  

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
    <script>
  		$(function() {
  			$( "#datepicker_start" ).datepicker({dateFormat: "yy-mm-dd"});
  		});
  	</script>
	<script type="text/javascript">

 function send(workerNo) {//修改
window.location.href="ShowUpdateWorkerformation?workerNo="+workerNo; 
      
    }
    
     function send_delete(workerNo) {//删除

       // window.open(encodeURI(url + "?userName=" + userName));
        var r=confirm("确定删除吗？");
           if(r==false){
       return false;
         }else{

          window.location.href="DeleteWorker?workerNo="+workerNo; 

alert("删除成功！");
return true;
}

    }

function DeleteManager(){

alert("对不起，您没有权限删除个人信息！");
}
function SuccessUpdate(){

alert("信息修改成功！");
}
</script>
  	
  	<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <title>修改信息</title>
</head>
<body>
<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
     
    <div class="container-fluid">
        <div class="row">
            
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">修改员工</h1>
                <div class="row">
                <div class="col-sm-8">
                <label>请完善员工或者个人信息点击删除或者修改按钮操作：</label>
				</div>
				<!-- 修改 Select-->
				<form action="UpdateWorkerformation" method="post" onsubmit="return checkValidate()">
				<div class="col-sm-4">

				<%
	               for(Worker worker : WorkerList){ 
	               request.setAttribute("workerBirthPlace", worker.getWorkerBirthPlace());
	               request.setAttribute("workerBloodType", worker.getWorkerBloodType());
	               request.setAttribute("workerPolitical", worker.getWorkerPolitical());
	               request.setAttribute("workerEthnic", worker.getWorkerEthnic());
	               request.setAttribute("workerEducation", worker.getWorkerEducation());
	               request.setAttribute("workerNationality", worker.getWorkerNationality());
	               %>
				<button class='btn btn-primary' type="submit" style="width: 40%; float: right;" ><i class="fa fa-check"></i> 确认修改</button>
				<%
				if(activeWorker.getWorkerPermission()==3||activeWorker.getWorkerPermission()==4){
				 %>
				 <button  type="button" class='btn btn-primary' style="width: 40%; float: right;background-color: #B22222;" onclick="send_delete(<%=worker.getWorkerNo()%>)"><i class="fa fa-check"></i> 确认删除</button>
				 <%}else{%>
				 <button  type="button" class='btn btn-primary' style="width: 40%; float: right;background-color: #B22222;" onclick="DeleteManager()"><i class="fa fa-check"></i> 确认删除</button>
				 <%} %>

				</div>
                </div>
                
                <input type="hidden" name="workerOid" value="<%=worker.getWorkerOid()%>">
                <table class="table table-bordered table-hover">
                
				<tr style="background-color: #EED5D2;">
	              <th style="padding-left: 21px;"><strong>姓名</strong></th>
	              <th style="padding-left: 21px;"></i>员工号</strong></th>
	              <th style="padding-left: 21px;"><strong>性别</strong></th>
	            </tr>
	            
	            <tr>
	              <th><input type="text" class="form-control " name="worker.workerName" placeholder="姓名" value="<%=worker.getWorkerName()%>" required></th>
	              <th><input type="text" class="form-control " name="worker.workerNo" placeholder="员工号" value="<%=worker.getWorkerNo()%>" required readonly="readonly"></th>
	              <th><select name="worker.workerSex" class="form-control">
	              <option value="男" <c:if test="${workerSex ==\'男\'}">selected</c:if>>男</option>
	              <option value="女" <c:if test="${workerSex ==\'女\'}">selected</c:if>>女</option>
	              </select></th>
	            </tr>
	             
	            <tr style="background-color:#E0FFFF;">
	              <th style="padding-left: 21px;"><strong>部门</strong></th>
	              <th style="padding-left: 21px;"><strong>职称</strong></th>
	              <th style="padding-left: 21px;"><strong>入职时间</strong></th>
	              
	            </tr>
	            
	            <tr>
	              <th>
	         	<%
	ArrayList<Department> depart=(ArrayList<Department>)ActionContext.getContext().getSession().get("department");
  
  out.println("	<select name='department.departmentName' size='1' class='form-control'>");
  for(int i=0;i<depart.size();i++){
    out.println("<option value='"+depart.get(i).getDepartmentName()+"'>"+depart.get(i).getDepartmentName()+"</option>");
   
       }
         out.println("	</select>");
	        %>
	      
	         </select>
	              </th>
	              <th>
	             <%if(activeWorker.getWorkerPermission()==3||activeWorker.getWorkerPermission()==4) {%>
	              <select name="worker.workerPermission" class="form-control">
	              <option value="1" <c:if test="${workerPermission ==\'普通员工\'}">selected</c:if>>普通员工</option>
	              <option value="2" <c:if test="${workerPermission ==\'组长\'}">selected</c:if>>组长</option>
	              <option value="3" <c:if test="${workerPermission ==\'部门经理\'}">selected</c:if>>部门经理</option>
	              <option value="4" <c:if test="${workerPermission ==\'总经理\'}">selected</c:if>>总经理</option>
	              </select>
	              <%}else{ %>
	               <select name="worker.workerPermission" class="form-control">
	              <option value="1" <c:if test="${workerPermission ==\'普通员工\'}">selected</c:if>>普通员工</option>
	              <option value="2" <c:if test="${workerPermission ==\'组长\'}">selected</c:if>>组长</option>
	              </select>
	              <%} %>
	              </th>
	              <th><input type="text" class="form-control " name="worker.workerEntryDate" placeholder="入职时间 " value="<%=sdf.format(worker.getWorkerEntryDate())%>" required  style="width: 98%" class="form-control"     onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></th>
	            </tr>
	            <tr style="background-color:  #EED5D2;">
	              <th style="padding-left: 21px;"><strong>身份证号</strong></th>
	              <th style="padding-left: 21px;"><strong>出生日期</strong></th>
	              <th style="padding-left: 21px;"><strong>年龄</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " name="worker.workerId" placeholder="身份证号" id="workerId"  value="<%=worker.getWorkerId()%>" required></th>
	              <th><input type="text" class="form-control " name="worker.workerBirthDate" placeholder="出生日期 " value="<%=sdf.format(worker.getWorkerBirthDate())%>" required  style="width: 98%" class="form-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'});" ></th>
	              <th><input type="text" class="form-control " name="worker.workerAge" placeholder="年龄 " value="${workerAge }" required></th>
	            </tr>
	            <tr style="background-color: #E0FFFF;">
	              <th style="padding-left: 21px;"><strong>籍贯</strong></th>
	              <th style="padding-left: 21px;"><strong>地址</strong></th>
	              <th style="padding-left: 21px;"><strong>血型</strong></th>
	            </tr>
	            <tr>
	              <th>
	               <select name="worker.workerBirthPlace" class="form-control">
	              <option value="广东"<c:if test="${workerBirthPlace ==\'广东\'}">selected</c:if>>广东</option>
	              <option value="江苏"<c:if test="${workerBirthPlace ==\'江苏\'}">selected</c:if>>江苏</option>
	              <option value="山东"<c:if test="${workerBirthPlace ==\'山东\'}">selected</c:if>>山东</option>
	              <option value="浙江"<c:if test="${workerBirthPlace ==\'浙江\'}">selected</c:if>>浙江</option>
	              <option value="河南"<c:if test="${workerBirthPlace ==\'河南\'}">selected</c:if>>河南</option>
	              <option value="河北"<c:if test="${workerBirthPlace ==\'河北\'}">selected</c:if>>河北</option>
	              <option value="辽宁"<c:if test="${workerBirthPlace ==\'辽宁\'}">selected</c:if>>辽宁</option>
	              <option value="上海"<c:if test="${workerBirthPlace ==\'上海\'}">selected</c:if>>上海</option>
	              <option value="四川"<c:if test="${workerBirthPlace ==\'四川\'}">selected</c:if>>四川</option>
	              <option value="湖南"<c:if test="${workerBirthPlace ==\'湖南\'}">selected</c:if>>湖南</option>
	              <option value="湖北"<c:if test="${workerBirthPlace ==\'湖北\'}">selected</c:if>>湖北</option>
	              <option value="福建"<c:if test="${workerBirthPlace ==\'福建\'}">selected</c:if>>福建</option>
	              <option value="北京"<c:if test="${workerBirthPlace ==\'北京\'}">selected</c:if>>北京</option>
	              <option value="安徽"<c:if test="${workerBirthPlace ==\'安徽\'}">selected</c:if>>安徽</option>
	              <option value="内蒙"<c:if test="${workerBirthPlace ==\'内蒙\'}">selected</c:if>>内蒙</option>
	              <option value="黑龙江"<c:if test="${workerBirthPlace ==\'黑龙江\'}">selected</c:if>>黑龙江</option>
	              <option value="陕西"<c:if test="${workerBirthPlace ==\'陕西\'}">selected</c:if>>陕西</option>
	              <option value="广西"<c:if test="${workerBirthPlace ==\'广西\'}">selected</c:if>>广西</option>
	              <option value="江西"<c:if test="${workerBirthPlace ==\'江西\'}">selected</c:if>>江西</option>
	              <option value="天津"<c:if test="${workerBirthPlace ==\'天津\'}">selected</c:if>>天津</option>
	              <option value="吉林"<c:if test="${workerBirthPlace ==\'吉林\'}">selected</c:if>>吉林</option>
	              <option value="山西"<c:if test="${workerBirthPlace ==\'山西\'}">selected</c:if>>山西</option>
	              <option value="重庆"<c:if test="${workerBirthPlace ==\'重庆\'}">selected</c:if>>重庆</option>
	              <option value="云南"<c:if test="${workerBirthPlace ==\'云南\'}">selected</c:if>>云南</option>
	              <option value="新疆"<c:if test="${workerBirthPlace ==\'新疆\'}">selected</c:if>>新疆</option>
	              <option value="贵州"<c:if test="${workerBirthPlace ==\'贵州\'}">selected</c:if>>贵州</option>
	              <option value="甘肃"<c:if test="${workerBirthPlace ==\'甘肃\'}">selected</c:if>>甘肃</option>
	              <option value="海南"<c:if test="${workerBirthPlace ==\'海南\'}">selected</c:if>>海南</option>
	              <option value="宁夏"<c:if test="${workerBirthPlace ==\'宁夏\'}">selected</c:if>>宁夏</option>
	              <option value="青海"<c:if test="${workerBirthPlace ==\'青海\'}">selected</c:if>>青海</option>
	              <option value="西藏"<c:if test="${workerBirthPlace ==\'西藏\'}">selected</c:if>>西藏</option>
	              </select>
	              </th>
	              <th><input type="text" class="form-control " name="worker.workerAddress" placeholder="地址" value="<%=worker.getWorkerAddress()%>" required></th>
	              <th>
	              <select name="worker.workerBloodType" class="form-control">
	              <option value="A"<c:if test="${workerBloodType ==\'A\'}">selected</c:if>>A</option>
	              <option value="B"<c:if test="${workerBloodType ==\'B\'}">selected</c:if>>B</option>
	              <option value="O"<c:if test="${workerBloodType ==\'O\'}">selected</c:if>>O</option>
	              <option value="AB"<c:if test="${workerBloodType ==\'AB\'}">selected</c:if>>AB</option>
	              </select>
	              </th>
	            </tr>
	            <tr style="background-color:  #EED5D2;">
	              <th style="padding-left: 21px;"><strong>政治面貌</strong></th>
	              <th style="padding-left: 21px;"><strong>民族</strong></th>
	              <th style="padding-left: 21px;"><strong>教育水平</strong></th>
	            </tr>
	            <tr>
	              <th>
	               <select name="worker.workerPolitical" class="form-control">
	              <option value="党员"<c:if test="${workerPolitical ==\'党员\'}">selected</c:if>>党员</option>
	              <option value="预备党员"<c:if test="${workerPolitical ==\'预备党员\'}">selected</c:if>>预备党员</option>
	              <option value="共青团员"<c:if test="${workerPolitical ==\'共青团员\'}">selected</c:if>>共青团员</option>
	              <option value="群众"<c:if test="${workerPolitical ==\'群众\'}">selected</c:if>>群众</option>
	              </select>
	              </th>
	              <th>
	                <select name="worker.workerEthnic" class="form-control">
	              <option value="汉族"<c:if test="${workerEthnic ==\'汉族\'}">selected</c:if>>汉族</option>
	              <option value="回族"<c:if test="${workerEthnic ==\'回族\'}">selected</c:if>>回族</option>
	              <option value="白族"<c:if test="${workerEthnic ==\'白族\'}">selected</c:if>>白族</option>
	              <option value="保安族"<c:if test="${workerEthnic ==\'保安族\'}">selected</c:if>>保安族</option>
	              <option value="布朗族"<c:if test="${workerEthnic ==\'布朗族\'}">selected</c:if>>布朗族</option>
	              <option value="布依族"<c:if test="${workerEthnic ==\'布依族\'}">selected</c:if>>布依族</option>
	              <option value="朝鲜族"<c:if test="${workerEthnic ==\'朝鲜族\'}">selected</c:if>>朝鲜族</option>
	              <option value="达斡族"<c:if test="${workerEthnic ==\'达斡族\'}">selected</c:if>>达斡族</option>
	              <option value="傣 族"<c:if test="${workerEthnic ==\'傣 族\'}">selected</c:if>>傣 族</option>
	              <option value="德昂族"<c:if test="${workerEthnic ==\'德昂族\'}">selected</c:if>>德昂族</option>
	              <option value="阿昌族"<c:if test="${workerEthnic ==\'阿昌族\'}">selected</c:if>>阿昌族</option>
	              <option value="侗 族"<c:if test="${workerEthnic ==\'侗 族\'}">selected</c:if>>侗 族</option>
	              <option value="东乡族"<c:if test="${workerEthnic ==\'东乡族\'}">selected</c:if>>东乡族</option>
	              <option value="独龙族"<c:if test="${workerEthnic ==\'独龙族\'}">selected</c:if>>独龙族</option>
	              <option value="鄂伦春族"<c:if test="${workerEthnic ==\'鄂伦春族\'}">selected</c:if>>鄂伦春族</option>
	              <option value="俄罗斯族"<c:if test="${workerEthnic ==\'俄罗斯族\'}">selected</c:if>>俄罗斯族</option>
	              <option value="鄂温克族"<c:if test="${workerEthnic ==\'鄂温克族\'}">selected</c:if>>鄂温克族</option>
	              <option value="高山族"<c:if test="${workerEthnic ==\'高山族\'}">selected</c:if>>高山族</option>
	              <option value="仡佬族"<c:if test="${workerEthnic ==\'仡佬族\'}">selected</c:if>>仡佬族</option>
	              <option value="哈尼族"<c:if test="${workerEthnic ==\'哈尼族\'}">selected</c:if>>哈尼族</option>
	              <option value="哈萨克族"<c:if test="${workerEthnic ==\'哈萨克族\'}">selected</c:if>>哈萨克族</option>
	              <option value="赫哲族"<c:if test="${workerEthnic ==\'赫哲族\'}">selected</c:if>>赫哲族</option>
	              <option value="基诺族"<c:if test="${workerEthnic ==\'基诺族\'}">selected</c:if>>基诺族</option>
	              <option value="京 族"<c:if test="${workerEthnic ==\'京 族\'}">selected</c:if>>京 族</option>
	              <option value="景颇族"<c:if test="${workerEthnic ==\'景颇族\'}">selected</c:if>>景颇族</option>
	              <option value="柯尔克孜族"<c:if test="${workerEthnic ==\'柯尔克孜族\'}">selected</c:if>>柯尔克孜族</option>
	              <option value="黎 族"<c:if test="${workerEthnic ==\'黎 族\'}">selected</c:if>>黎 族</option>
	              <option value="满 族"<c:if test="${workerEthnic ==\'满 族\'}">selected</c:if>>满 族</option>
	              <option value="蒙古族"<c:if test="${workerEthnic ==\'蒙古族\'}">selected</c:if>>蒙古族</option>
	              <option value="纳西族"<c:if test="${workerEthnic ==\'纳西族\'}">selected</c:if>>纳西族</option>
	              <option value="羌 族"<c:if test="${workerEthnic ==\'羌 族\'}">selected</c:if>>羌 族</option>
	              <option value="土家族"<c:if test="${workerEthnic ==\'土家族\'}">selected</c:if>>土家族</option>
	              </select>
	              </th>
	              <th>
	              <select name="worker.workerEducation" class="form-control">
	              <option value="研究生"<c:if test="${workerEducation ==\'研究生\'}">selected</c:if>>研究生</option>
	              <option value="本科"<c:if test="${workerEducation ==\'本科\'}">selected</c:if>>本科</option>
	              <option value="大专"<c:if test="${workerEducation ==\'大专\'}">selected</c:if>>大专</option>
	              <option value="中专"<c:if test="${workerEducation ==\'中专\'}">selected</c:if>>中专</option>
	              <option value="高中"<c:if test="${workerEducation ==\'高中\'}">selected</c:if>>高中</option>
	              <option value="初中"<c:if test="${workerEducation ==\'初中\'}">selected</c:if>>初中</option>
	              <option value="小学"<c:if test="${workerEducation ==\'小学\'}">selected</c:if>>小学</option>
	              </select>
	              </th>
	            </tr>
	            <tr  style="background-color: #E0FFFF;">
	              <th style="padding-left: 21px;"><strong>电话</strong></th>
	              <th style="padding-left: 21px;"><strong>国籍</strong></th>
	              <th style="padding-left: 21px;"><strong>密码</strong></th>
	            </tr>
	            <tr>
	              <th><input type="text" class="form-control " name="worker.workerPhone" placeholder="电话 " id="workerPhone" value="<%=worker.getWorkerPhone()%>" required></th>
	              <th>
	               <select name="worker.workerNationality" class="form-control">
	              <option value="中国"<c:if test="${workerNationality ==\'中国\'}">selected</c:if>>中国</option>
	              <option value="美国"<c:if test="${workerNationality ==\'美国\'}">selected</c:if>>美国</option>
	              <option value="英国"<c:if test="${workerNationality ==\'英国\'}">selected</c:if>>英国</option>
	              <option value="韩国"<c:if test="${workerNationality ==\'韩国\'}">selected</c:if>>韩国</option>
	              <option value="朝鲜"<c:if test="${workerNationality ==\'朝鲜\'}">selected</c:if>>朝鲜</option>
	              <option value="新加坡"<c:if test="${workerNationality ==\'新加坡\'}">selected</c:if>>新加坡</option>
	              <option value="日本"<c:if test="${workerNationality ==\'日本\'}">selected</c:if>>日本</option>
	              <option value="巴西"<c:if test="${workerNationality ==\'巴西\'}">selected</c:if>>巴西</option>
	              <option value="古巴"<c:if test="${workerNationality ==\'古巴\'}">selected</c:if>>古巴</option>
	              <option value="阿根廷"<c:if test="${workerNationality ==\'阿根廷\'}">selected</c:if>>阿根廷</option>
	              <option value="巴巴多斯"<c:if test="${workerNationality ==\'巴巴多斯\'}">selected</c:if>>巴巴多斯</option>
	              <option value="厄瓜多尔"<c:if test="${workerNationality ==\'厄瓜多尔\'}">selected</c:if>>厄瓜多尔</option>
	              <option value="墨西哥"<c:if test="${workerNationality ==\'墨西哥\'}">selected</c:if>>墨西哥</option>
	              <option value="巴拿马"<c:if test="${workerNationality ==\'巴拿马\'}">selected</c:if>>巴拿马</option>
	              <option value="秘鲁"<c:if test="${workerNationality ==\'秘鲁\'}">selected</c:if>>秘鲁</option>
	              <option value="多米尼加共和国"<c:if test="${workerNationality ==\'多米尼加共和国\'}">selected</c:if>>多米尼加共和国</option>
	              </select>
                  </th>
	              <th><input type="text" class="form-control " name="worker.password" placeholder="密码 " value="<%=worker.getPassword()%>" required></th>
	            </tr>
                </table>
                 <%      }
	              %>
                </form>
            </div>
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
      	</script>
</body>
</html>
