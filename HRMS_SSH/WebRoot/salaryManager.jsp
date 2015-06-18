<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp"%>
<%@ page import="com.hrms.pojo.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Worker activeWorker = (Worker)session.getAttribute("activeWorker");
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
       <form class="form-inline pull-right">
       <div class="input-group">
       <div class="input-group-addon" style="width: 20px;">部门</div>
           <select class="form-control">
           	  <option>全部</option>
              <option>人事部</option>
              <option>行政部</option>
              <option>生产部</option>
              <option>财务部</option>
              <option>销售部</option>
           </select>
           </div>
              <div class="input-group">
                 <select name="" class="form-control">
                    <option value="">2011</option>
                    <option value="">2012</option>
                    <option value="">2013</option>
                    <option value="">2014</option>
                    <option value="">2015</option>
                 </select>
                 <div class="input-group-addon" style="width: 15px;">年</div>
              </div>
             <div class="input-group">
               <select name="" class="form-control">
                  <option value="">01</option>
                  <option value="">02</option>
                  <option value="">03</option>
                  <option value="">04</option>
                  <option value="">05</option>
                  <option value="">06</option>
                  <option value="">07</option>
                  <option value="">08</option>
                  <option value="">09</option>
                  <option value="">10</option>
                  <option value="">11</option>
                  <option value="">12</option>
               </select>
               <div class="input-group-addon" style="width: 15px;">月</div>
             </div>
             <button class="btn btn-primary" type="submit" style="width: 80px;"><i class="icon-search"> 查询</i></button>
       </form>
       </h1>
       
        <div class="container-fluid">
          <div class="row">
            <div class="panel panel-default" style="margin-bottom:3px;">
              <div class="panel-heading" role="tab">
                <h4 class="panel-title">
                      <div class="row">
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">姓名</label>
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">职务</label>
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">时薪</label>
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">当月工资</label>
                      </div>
                </h4>
              </div>
            </div>

            <div class="panel panel-default" style="margin-bottom:3px;">
              <div class="panel-heading" role="tab" id="headingOne">
                <h4 class="panel-title"  style="cursor:hand">
                  <a data-toggle="collapse" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                      <div class="row">
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">王尼玛</label>
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">总经理</label>
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">￥100.00</label>
                      <label class="col-sm-3 control-label" style="margin-bottom:0px;">￥2000.00</label>
                      </div>
                  </a>
                </h4>
              </div>
              <div id="collapseOne" class="panel-body collapse " role="tabpanel" aria-expanded="false" aria-labelledby="headingOne">
                <div class="input-group" style="width: 100%;margin-bottom: 20px;">
                  <div class="input-group-addon" style="width:50px;">总工资 ￥</div>
                  <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                </div>
				<form>
                <div class="panel panel-info">
                  <div class="panel-heading">基本工资</div>
                  <div class="panel-body" style="padding: 0px;">
                    <table  class="table table-bordered" style="margin-bottom:0px;">
                      <tr>
                        <th>
                          <label style="font-size:18px;margin-bottom: 0px;">标准时薪</label>
                        </th>
                        <th>
                          <label style="font-size:18px;margin-bottom: 0px;">额定工资</label>
                        </th>
                        <th>
                          <label style="font-size:18px;margin-bottom: 0px;">实际工资</label>
                        </th>
                      </tr>
                      <tr>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">标准工资  ￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" >
                          </div>
                        </th>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                          </div>
                        </th>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                          </div>
                        </th>
                      </tr>
                      <tr>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" >
                          </div>
                        </th>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                          </div>
                        </th>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
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
                          <label style="font-size:18px;margin-bottom: 0px;">工作日加班工资</label>
                        </th>
                        <th>
                          <label style="font-size:18px;margin-bottom: 0px;">双休加班工资</label>
                        </th>
                        <th>
                          <label style="font-size:18px;margin-bottom: 0px;">假期加班工资</label>
                        </th>
                      </tr>
                      <tr>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                          </div>
                        </th>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                          </div>
                        </th>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                          </div>
                        </th>
                      </tr>
                      <tr>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" >
                          </div>
                        </th>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                          </div>
                        </th>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                          </div>
                        </th>
                      </tr>
                    </table>
                  </div>
                </div>

                <div class="panel panel-danger">
                  <div class="panel-heading">奖罚工资</div>
                  <div class="panel-body" style="padding: 0px;">
                    <table  class="table table-bordered" style="margin-bottom:0px;">
                      <tr>
                        <th>
                          <label style="font-size:18px;margin-bottom: 0px;">全勤工资</label>
                        </th>
                        <th>
                          <label style="font-size:18px;margin-bottom: 0px;">奖罚工资</label>
                        </th>
                      </tr>
                      <tr>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                          </div>
                        </th>
                        <th>
                          <div class="input-group">
                            <div class="input-group-addon" style="width: 150px;">￥</div>
                            <input type="text" class="form-control" value="" placeholder="0.00" style="background-color: #FFFFFF;" readonly>
                          </div>
                        </th>
                      </tr>
                    </table>
                  </div>
                </div>
                
                <div style="margin-bottom: 0px;">
                	<button class="btn btn-primary btn-block" type="submit">确认核对</button>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div> 
      </div>
  </body>
</html>