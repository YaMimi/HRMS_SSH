<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="com.hrms.pojo.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Worker activeWorker = (Worker)session.getAttribute("activeWorker");
List<Date> salarysdate = (List<Date>)session.getAttribute("salarysdate");
Salary salary = (Salary)session.getAttribute("salary");
Date nowpersonalsalarydate = (Date)session.getAttribute("nowpersonalsalarydate");
SimpleDateFormat year = new SimpleDateFormat("yyyy");
SimpleDateFormat month = new SimpleDateFormat("MM");
%>


<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <link  href="./css/bootstrap.min.css" rel="stylesheet"/>
    <link href="./css/font-awesome.min.css" rel="stylesheet"/>
    <link  href="./css/dashboard.css" rel="stylesheet"/>
    <link  href="./css/jquery-ui.css" rel="stylesheet"/>
    <script src="./js/jquery-2.1.3.min.js"></script>
    <script src="./js/jquery-ui.js"></script>
    <script src="./js/bootstrap.min.js"></script>
	<style>
        * {
            font-family: 'FontAwesome',"Microsoft YaHei" ! important;
        }
    </style>
    
    <title>工资查询</title>
  </head>
  
  <body>
  	<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <h1 class="page-header">工资查询
         <form action="CheckSalary" class="form-inline pull-right">
              <div class="input-group">
                 <select name="year" class="form-control">
                 <%for(Date salarydate : salarysdate){ %>
                 	<option value="<%=year.format(salarydate) %>" <%if(year.format(nowpersonalsalarydate).equals(year.format(salarydate))) {%>selected<%} %>><%=year.format(salarydate) %></option>
                 <%} %>
                 </select>
                 <div class="input-group-addon" style="width: 15px;">年</div>
              </div>
             <div class="input-group">
               <select name="month" class="form-control">
                  <option value="01" <%if(month.format(nowpersonalsalarydate).equals("01")){%>selected<%} %>>01</option>
                  <option value="02" <%if(month.format(nowpersonalsalarydate).equals("02")){%>selected<%} %>>02</option>
                  <option value="03" <%if(month.format(nowpersonalsalarydate).equals("03")){%>selected<%} %>>03</option>
                  <option value="04" <%if(month.format(nowpersonalsalarydate).equals("04")){%>selected<%} %>>04</option>
                  <option value="05" <%if(month.format(nowpersonalsalarydate).equals("05")){%>selected<%} %>>05</option>
                  <option value="06" <%if(month.format(nowpersonalsalarydate).equals("06")){%>selected<%} %>>06</option>
                  <option value="07" <%if(month.format(nowpersonalsalarydate).equals("07")){%>selected<%} %>>07</option>
                  <option value="08" <%if(month.format(nowpersonalsalarydate).equals("08")){%>selected<%} %>>08</option>
                  <option value="09" <%if(month.format(nowpersonalsalarydate).equals("09")){%>selected<%} %>>09</option>
                  <option value="10" <%if(month.format(nowpersonalsalarydate).equals("10")){%>selected<%} %>>10</option>
                  <option value="11" <%if(month.format(nowpersonalsalarydate).equals("11")){%>selected<%} %>>11</option>
                  <option value="12" <%if(month.format(nowpersonalsalarydate).equals("12")){%>selected<%} %>>12</option>
               </select>
               <div class="input-group-addon" style="width: 15px;">月</div>
             </div>
             <button class="btn btn-primary" type="submit" style="width: 80px;"><i class="icon-search"> 查询</i></button>
            </form>
        </h1>
        <%if(session.getAttribute("salarystate")!=null && session.getAttribute("salarystate").toString().equals("0")){ %>
        <div class="alert alert-danger alert-dismissible" role="alert">改日期无工资记录</div>
        <%session.setAttribute("salarystate", null);} %>
        
        <div class="input-group" style="width: 100%;margin-bottom: 20px;">
          <div class="input-group-addon" style="width:50px;">总工资 ￥</div>
          <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getTotalSalary());} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
        </div>
        
        
            <div class="panel panel-info">
              <div class="panel-heading">基本工资</div>
              <div class="panel-body" style="padding: 0px;">
                <table  class="table table-bordered" style="margin-bottom:0px;">
                   <tr>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">标准工时  H</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print("8.0");} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly >
                       </div>
                     </th>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">额定工时  H</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getSalaryStandardTime());} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                       </div>
                     </th>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">实际工时  H</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getSalaryActualTime());} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                       </div>
                     </th>
                   </tr>
                   <tr>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">标准时薪  ￥</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getSalaryHourly());} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                       </div>
                     </th>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">额定工资  ￥</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getStandardSalary());} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                       </div>
                     </th>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">实际工资  ￥</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getActualSalary());} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                       </div>
                     </th>
                   </tr>
                 </table>
              </div>
            </div>

            <div class="panel panel-success">
              <div class="panel-heading">加班工资</div>
              <div class="panel-body" style="padding: 0px;">
                <table  class="table table-bordered" style="margin-bottom:0px;">
                   <tr>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">工作日加班工时  H</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getSalaryWeekTime());} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                       </div>
                     </th>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">双休加班工时  H</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getSalaryWeekendTime());} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                       </div>
                     </th>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">假期加班工时  H</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getSalaryHolidayTime());} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                       </div>
                     </th>
                   </tr>
                   <tr>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">工作日加班工资  ￥</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getWeekSalary());} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly >
                       </div>
                     </th>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">双休加班工资  ￥</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getWeekendSalary());} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                       </div>
                     </th>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">假期加班工资  ￥</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getHolidaySalary());} %>" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                       </div>
                     </th>
                   </tr>
                 </table>
              </div>
            </div>

            <div class="panel panel-danger" style="margin-bottom: 0px;">
              <div class="panel-heading">奖罚工资</div>
              <div class="panel-body" style="padding: 0px;">
                <table  class="table table-bordered" style="margin-bottom:0px;">
                   <tr>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">全勤奖励  ￥</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getAttendanceRewardSalary());} %>" placeholder="0.00" style="background-color: #FFFFFF;width: 350px;" readonly>
                       </div>
                     </th>
                     <th>
                       <div class="input-group">
                         <div class="input-group-addon" style="width: 150px;">奖罚工资  ￥</div>
                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getSalaryRop());} %>" placeholder="0.00" style="background-color: #FFFFFF;width: 350px;" readonly>
                       </div>
                     </th>
                   </tr>
                 </table>
              </div>
            </div>

        </div>

  </body>
</html>
