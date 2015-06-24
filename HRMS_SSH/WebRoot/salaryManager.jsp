<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp"%>
<%@ page import="com.hrms.pojo.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Worker activeWorker = (Worker)session.getAttribute("activeWorker");
List<Department> departmentlistdown = (List<Department>)session.getAttribute("departmentlistdown");
List<Date> allsalarysdate = (List<Date>)session.getAttribute("allsalarysdate");
List<Salary> allsalarys = (List<Salary>)session.getAttribute("allsalarys");
String nowsalarydepartment = (String)session.getAttribute("nowsalarydepartment");
Date nowsalarydate = (Date)session.getAttribute("nowsalarydate");
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
    
    <title>工资管理</title>
  </head>
  
  <body>
    <%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
       <h1 class="page-header">工资结算
       <form action="CheckDepartmentSalary" method="post" class="form-inline pull-right" >
       <div class="input-group">
       <div class="input-group-addon" style="width: 20px;">部门</div>
           <select name="department" class="form-control">
           	  <option value="%" <%if(nowsalarydepartment.equals("全部") ){ %>selected<%} %>>全部</option>
              <%for(Department department : departmentlistdown){ %>
              	<option value="<%=department.getDepartmentName() %>" <%if(nowsalarydepartment.equals(department.getDepartmentName()) ){ %>selected<%} %>><%=department.getDepartmentName() %></option>
              <%} %>
           </select>
           </div>
              <div class="input-group">
                 <select name="year" class="form-control">
                 <%for(Date salarydate : allsalarysdate){ %>
                 	<option value="<%=year.format(salarydate) %>" <%if(year.format(nowsalarydate).equals(year.format(salarydate))){ %>selected<%} %>><%=year.format(salarydate) %></option>
                 <%} %>
                 </select>
                 <div class="input-group-addon" style="width: 15px;">年</div>
              </div>
             <div class="input-group">
               <select name="month" class="form-control">
                  <option value="01" <%if(month.format(nowsalarydate).equals("01")){ %>selected<%} %>>01</option>
                  <option value="02" <%if(month.format(nowsalarydate).equals("02")){ %>selected<%} %>>02</option>
                  <option value="03" <%if(month.format(nowsalarydate).equals("03")){ %>selected<%} %>>03</option>
                  <option value="04" <%if(month.format(nowsalarydate).equals("04")){ %>selected<%} %>>04</option>
                  <option value="05" <%if(month.format(nowsalarydate).equals("05")){ %>selected<%} %>>05</option>
                  <option value="06" <%if(month.format(nowsalarydate).equals("06")){ %>selected<%} %>>06</option>
                  <option value="07" <%if(month.format(nowsalarydate).equals("07")){ %>selected<%} %>>07</option>
                  <option value="08" <%if(month.format(nowsalarydate).equals("08")){ %>selected<%} %>>08</option>
                  <option value="09" <%if(month.format(nowsalarydate).equals("09")){ %>selected<%} %>>09</option>
                  <option value="10" <%if(month.format(nowsalarydate).equals("10")){ %>selected<%} %>>10</option>
                  <option value="11" <%if(month.format(nowsalarydate).equals("11")){ %>selected<%} %>>11</option>
                  <option value="12" <%if(month.format(nowsalarydate).equals("12")){ %>selected<%} %>>12</option>
               </select>
               <div class="input-group-addon" style="width: 15px;">月</div>
             </div>
             <button class="btn btn-primary" type="submit" style="width: 80px;"><i class="icon-search"> 查询</i></button>
       </form>
       </h1>
       
       <%if(session.getAttribute("allsalarys")!=null) {%>
       	<%if(!allsalarys.isEmpty()) {%>
        <div class="container-fluid">
          <div class="row">
            <div class="panel panel-default" style="margin-bottom:3px;">
              <div class="panel-heading" role="tab">
                <h4 class="panel-title">
                      <div class="row">
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">姓名</label>
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">职务</label>
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">标准时薪</label>
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">当月工资</label>
                      </div>
                </h4>
              </div>
            </div>
            
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            
            <%int i = 1; %>
			<%for(Salary salary : allsalarys){ %>
            <div class="panel panel-default" style="margin-bottom:3px;">
              <div class="panel-heading" role="tab" id="heading<%=i%>">
                <h4 class="panel-title" >
                  <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=i %>" aria-expanded="true" aria-controls="collapse<%=i %>">
                      <div class="row">
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;"><%=salary.getWorker().getWorkerName() %></label>
                      <%if(salary.getWorker().getWorkerPermission()==1){ %><label class="col-sm-3 control-label" style="margin-bottom:0px;">普通员工</label><%} %>
                      <%if(salary.getWorker().getWorkerPermission()==2){ %><label class="col-sm-3 control-label" style="margin-bottom:0px;">组长</label><%} %>
                      <%if(salary.getWorker().getWorkerPermission()==3){ %><label class="col-sm-3 control-label" style="margin-bottom:0px;">部门经理</label><%} %>
                      <%if(salary.getWorker().getWorkerPermission()==4){ %><label class="col-sm-3 control-label" style="margin-bottom:0px;">总经理</label><%} %>
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">￥<%=salary.getSalaryHourly() %></label>
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">￥<%=salary.getTotalSalary() %></label>
                      </div>
                  </a>
                </h4>
              </div>
              
              <form id="from<%=i %>">
              <div id="collapse<%=i %>" class="panel-body collapse" role="tabpanel" aria-expanded="false" aria-labelledby="heading<%=i%>">
                <h4 class="page-header">工资明细</h4>
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
                            <input type="text" class="form-control" name="salaryhourly" value="<%if(salary!=null){out.print(salary.getSalaryHourly());} %>" placeholder="0.00" style="background-color: #FFFFFF;" >
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
	
	            <div class="panel panel-danger" style="margin-bottom:10px;">
	              <div class="panel-heading">奖罚工资</div>
	              <div class="panel-body" style="padding: 0px;">
	                <table  class="table table-bordered" style="margin-bottom:0px;">
	                   <tr>
	                     <th>
	                       <div class="input-group">
	                         <div class="input-group-addon" style="width: 150px;">全勤奖励  ￥</div>
	                         <input type="text" class="form-control" value="<%if(salary!=null){out.print(salary.getSalaryAttendanceReward());} %>" placeholder="0.00" style="background-color: #FFFFFF;width: 350px;" readonly>
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
	                 
	                 <h4 class="page-header" style="margin-bottom:0px;margin-top: 10px;">奖惩明细</h4>
		                <table  class="table table-bordered" >
		                   <tr>
		                     <th>奖惩日期</th>
		                     <th>奖/惩</th>
		                     <th>奖惩类型</th>
		                     <th>奖惩原因</th>
		                     <th>奖惩金额</th>
		                   </tr>
		                   <tr>
		                     <th>2015-06-05</th>
		                     <th>惩罚</th>
		                     <th>损坏公物</th>
		                     <th>打破公司花瓶</th>
		                     <th style="width: 180px;">
		                       <div class="input-group">
		                         <div class="input-group-addon" >￥</div>
		                         <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
		                       </div>
		                     </th>
		                   </tr>
		               </table>
                  </div>
		            
                </div>
                
                
                
                
                <%if(salary.getSalaryResult()==0){ %>
                <div style="margin-bottom:0px;">
                	<input type="hidden" name="salary.salaryOid" value="<%=salary.getSalaryOid() %>">
                	<button class="btn btn-info btn-block" type="button" data-toggle="modal" data-target="#myModal<%=i %>">添加奖惩记录</button>
	               	<button class="btn btn-primary btn-block" style="width: 50%; float: left;" type="submit" onclick="alter<%=i %>();">确认修改</button>
	               	<button class="btn btn-success btn-block" style="width: 50%; " type="submit" onclick="save<%=i %>();">确认结算</button>
	               	
                </div>
                
                
				
                <%}else if(salary.getSalaryResult()==1){ %>
                <div style="margin-bottom:0px;">
	               	<button class="btn btn-danger btn-block " disabled>改工资已经结算</button>
                </div>
                <%} %>
                
                <!-- JS -->
                <script type="text/javascript">
				  	function alter<%=i %>(){ 
						document.getElementById("from<%=i %>").action="AlterSalary";
						document.getElementById("from<%=i %>").submit();
					};
			    </script>
			    <script type="text/javascript">
			  	  function save<%=i %>(){
						document.getElementById("from<%=i %>").action="SaveSalary";
						document.getElementById("from<%=i %>").submit();
				  };
			    </script>
			    <script>
  				$(function() {
  				   $( "#datepicker_start" ).datepicker({dateFormat: "yy-mm-dd", minDate:"-0D"});
  				   $( "#datepicker_end" ).datepicker({dateFormat: "yy-mm-dd", minDate:"-0D"});
  				});
  				</script>
			    <!-- JS -->
			      
              </div>
              </form>
              <!-- Modal Begin-->
                <div class="modal fade" id="myModal<%=i %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel"> 模态框（Modal）标题</h4>
				         </div>
				         <form action="" method="post">
					         <div class="modal-body"> 
					         	<div class="form-group form-inline">
							      <div class="radio">
									  <label>
									    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
									    奖励
									  </label>
									</div>
									<div class="radio">
									  <label>
									    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
									    惩罚
									  </label>
									</div>
							    </div>
							    <div class="form-group form-inline">
						  			<input id="datepicker_start" class="form-control" type="text" name="" style="width:40%" placeholder="奖惩日期" required>
						  		</div>
						  		<div class="form-group ">
						  			<textarea class="form-control" rows="3" name="" placeholder="奖惩原因" required  autofocus></textarea>
						  		</div>
						  		
					         </div>
					         <div class="modal-footer">
					            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					            <button type="button" class="btn btn-primary">提交更改</button>
					         </div>
				         </form>
				      </div><!-- /.modal-content -->
				   </div><!-- /.modal -->
				</div>
			  <!-- Modal End-->
              </div>
            <% i++;} %>
            </div>
            <%}else{ %>
            	<div class="alert alert-danger alert-dismissible" role="alert">改日期无工资记录</div>
            <%} %>
          <%} %>
          	</div>
            </div>
          </div>
        </div>
      </div>
  </body>
  
  
</html>