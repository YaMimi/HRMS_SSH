<%@ page import="com.hrms.pojo.*"%>
<%@ include file="loginCheck.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
Worker activeWorker = (Worker)session.getAttribute("activeWorker");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <link  href="./css/bootstrap.min.css" rel="stylesheet"/>
    <link href="./css/font-awesome.min.css" rel="stylesheet"/>
    <link  href="./css/dashboard.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="./css/jquery-ui.css">
    <script src="./js/jquery-2.1.3.min.js"></script>
    <script src="./js/jquery-ui.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <title>部门维护</title>
  </head>
  
  <body>
  	<%@ include file="navbarTop.jsp"%>
    <%@ include file="navbarSide.jsp"%>
    <s:action name="DepartmentSearch" namespace="/" />
    <%int I = 0; %>
    <%List<Department> DepartmentList = (List<Department>)session.getAttribute("departmentlist"); %>
    <%Map<Integer , Integer> md = new HashMap(); %>
    <%int DepartmentFloor = 0;
    for(Department d : DepartmentList) {
    	md.put(d.getDepartmentOid(), 0);
    	int i1 = 0;
    	while(d.getDepartment()!=null) {
    		d = d.getDepartment();
    		i1++;
    	}
    	if(i1>md.get(d.getDepartmentOid()))
    		md.put(d.getDepartmentOid(), i1);
    	if(i1>DepartmentFloor) {
    		DepartmentFloor = i1;
    	}
    }
    List<Department> fatherdepartmentlist1 = new ArrayList();
    List<Department> fatherdepartmentlist2 = new ArrayList();
	for(Department d : DepartmentList){
		if(d.getDepartment()==null) {
			fatherdepartmentlist1.add(d);
			fatherdepartmentlist2.add(d);
		}
		else if(d.getDepartment().getDepartment()==null)
			fatherdepartmentlist2.add(d);
	}
    %>
    
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <h1 class="page-header">部门维护</h1>
         <i>以下为所有部门的详细信息，请谨慎进行操作：</i>

          <div style="border-bottom: 1px solid #ddd;border-top: 1px solid #ddd; height: 37px; padding: 10px 15px; margin-bottom: 10px;">
            <h4 class="panel-title">
		        <span data-toggle="collapse" href="#collapse" aria-expanded="false" class="collapsed" style="width: 80px; float:left;">
		        	　
		        </span>
		        <span data-toggle="collapse" href="#collapse" aria-expanded="false" class="collapsed" style="width: 30%; float:left;">
		        	部门名称
		        </span>
		        <span data-toggle="collapse" href="#collapse" aria-expanded="false" class="collapsed" style="width: 30%; float:left;">
		        	部门编号
		        </span>
		        <span data-toggle="collapse" href="#collapse" aria-expanded="false" class="collapsed" style="width: 15%; float:left;">
		        	部门人数
		        </span>
		        <span data-toggle="collapse" href="#collapse" aria-expanded="false" class="collapsed" style="width: 100px; float:right;">
		       		 操作
		        </span>
	      	</h4>
          </div>
          
          <%Department[] department = new Department[DepartmentFloor+1];
           	List<Iterator> itList = new ArrayList<Iterator>();
            int DF = 0;
            itList.add(DF, DepartmentList.iterator());
		    while(itList.get(DF).hasNext()) {
            department[DF] = (Department) itList.get(DF).next();
            if(department[DF].getDepartment()==null) {
          %>
          <div id="List<%=I %>" class="div-dep">
                <h4 class="panel-title">
			        <span data-toggle="collapse" href="#collapse<%=I %>" aria-expanded="false" class="div-hd collapsed" style="width: 80px; float:left; padding-top: 10px; padding-bottom: 10px;">
			        	<%if(!department[DF].getDepartments().isEmpty()){ %><i class="fa icon-dep-collapse fa-lg"></i><%} else {%><i class="fa fa-square-o fa-lg"></i><%} %>
			        </span>
			        <form id="ShowForm<%=I %>">
			        <span style="width: 30%; float:left; padding-top: 10px; padding-bottom: 10px;">
			        	<%=department[DF].getDepartmentName() %>
			        </span>
			        <span style="width: 30%; float:left; padding-top: 10px; padding-bottom: 10px;">
			        	<%=department[DF].getDepartmentNo() %>
			        </span>
			        <span style="width: 15%; float:left; padding-top: 10px; padding-bottom: 10px;">
			        	<%=department[DF].getWorkers().size() %>
			        </span>
			        </form>
			        <form id="EditForm<%=I %>" action="departmentUpdate" method="post" style="display: none;">
			        <input type='hidden' name='alter' value='<%=department[DF].getDepartmentOid()%>'/>
			        <span style="width: 30%; float:left; padding-top:1px; padding-bottom:1px;">
			        	<input type="text" class="form-control" name="department.DepartmentName" placeholder="部门名称" value="<%=department[DF].getDepartmentName() %>" style="height: 33px; width: 90%;" required>
			        </span>
			        <span style="width: 30%; float:left; padding-top:1px; padding-bottom:1px;">
			        	<input type="text" class="form-control" name="department.DepartmentNo" placeholder="部门编号 " value="<%=department[DF].getDepartmentNo() %>" style="height: 33px; width: 90%;" required>
			        </span>
			        <span style="width: 15%; float:left; padding-top:1px; padding-bottom:1px;">
			        	<select name="FatherDepartmentOid" class="form-control" style="height: 33px; ">
		                  <option value="0">无</option>
		                  <%if(md.get(department[DF].getDepartmentOid())==0)
		                  for(Department d : fatherdepartmentlist2) {%>
		                  <%if(department[DF].equals(d)) continue;%>
		                  <option value="<%=d.getDepartmentOid()%>" <%if(department[DF].getDepartment()!=null&&department[DF].getDepartment().equals(d)) out.print("selected");%>><%=d.getDepartmentName() %></option>
		                  <%} else if(md.get(department[DF].getDepartmentOid())==1)
		                  for(Department d : fatherdepartmentlist1) {%>
		                  <%if(department[DF].equals(d)) continue;%>
		                  <option value="<%=d.getDepartmentOid()%>" <%if(department[DF].getDepartment()!=null&&department[DF].getDepartment().equals(d)) out.print("selected");%>><%=d.getDepartmentName() %></option>
		                  <%} %>
		                </select>
			        </span>
			        <span style="width: 100px; float:right; padding-top: 10px; padding-bottom: 10px;">
			        	<a
			        		onclick="document.getElementById('EditForm<%=I %>').submit();"
							style="cursor: pointer; float: left; text-decoration:none;">
							保存
						 </a>
						 <a
				         	onclick="document.getElementById('ShowForm<%=I %>').style.display='';document.getElementById('Fun<%=I %>').style.display='';document.getElementById('EditForm<%=I %>').style.display='none';"
							style="cursor: pointer; float: left; text-decoration:none;">　
							取消
						 </a>
			        </span>
			        </form>
			        <span id="Fun<%=I %>" style="width: 100px; float:right; padding-top: 10px; padding-bottom: 10px;">
				         <a
				         	onclick="document.getElementById('Fun<%=I %>').style.display='none';document.getElementById('ShowForm<%=I %>').style.display='none';document.getElementById('EditForm<%=I %>').style.display='';"
							style="cursor: pointer; float: left; text-decoration:none;">
							修改
						 </a>
				         <form id="DelForm<%=I %>" action="DepartmentDelete" style="float: left;">
					       <input type="hidden" name="delete" value="<%=department[DF].getDepartmentOid()%>"/>　
					       <a class="delbut" onclick="document.getElementById('DelForm<%=I %>').submit();" style="cursor: pointer;">删除</a>
					     </form>
			        </span>
		      	</h4>
            </div>
          <%Set<Department> set = department[DF].getDepartments(); %>
		  <%if(!department[DF].getDepartments().isEmpty()) {%>
		  <div class="collapse" id="collapse<%=I %>" aria-expanded="false" style="padding: 0; width: 100%;">
		  <%
		  	  I++;
		      set = department[DF].getDepartments();
		      DF++;
		      itList.add(DF,set.iterator());
		      while(itList.get(DF).hasNext()) {
		      department[DF] = (Department) itList.get(DF).next();%>
          		<div id="List<%=I %>"  class="div-dep">
	                <h4 class="panel-title">
				        <span data-toggle="collapse" href="#collapse<%=I %>" aria-expanded="false" class="div-hd collapsed" style="width: 80px; float:left; padding-top: 10px; padding-bottom: 10px;">
				        	<i class="fafa-lg">　</i><%if(!department[DF].getDepartments().isEmpty()){ %><i class="fa icon-dep-collapse fa-lg"></i><%} else {%><i class="fa fa-square-o fa-lg"></i><%} %>
				        </span>
				        <form id="ShowForm<%=I %>">
				        <span style="width: 30%; float:left; padding-top: 10px; padding-bottom: 10px;">
				        	<%=department[DF].getDepartmentName() %>
				        </span>
				        <span style="width: 30%; float:left; padding-top: 10px; padding-bottom: 10px;">
				        	<%=department[DF].getDepartmentNo() %>
				        </span>
				        <span style="width: 15%; float:left; padding-top: 10px; padding-bottom: 10px;">
				        	<%=department[DF].getWorkers().size() %>
				        </span>
				        </form>
				        <form id="EditForm<%=I %>" action="departmentUpdate" method="post" style="display: none;">
				        <input type='hidden' name='alter' value='<%=department[DF].getDepartmentOid()%>'/>
				        <span style="width: 30%; float:left; padding-top:1px; padding-bottom:1px;">
				        	<input type="text" class="form-control" name="department.DepartmentName" placeholder="部门名称" value="<%=department[DF].getDepartmentName() %>" style="height: 33px; width: 90%;" required>
				        </span>
				        <span style="width: 30%; float:left; padding-top:1px; padding-bottom:1px;">
				        	<input type="text" class="form-control" name="department.DepartmentNo" placeholder="部门编号 " value="<%=department[DF].getDepartmentNo() %>" style="height: 33px; width: 90%;" required>
				        </span>
				        <span style="width: 15%; float:left; padding-top:1px; padding-bottom:1px;">
				        	<select name="FatherDepartmentOid" class="form-control" style="height: 33px; ">
			                  <option value="0">无</option>
			                  <%if(md.get(department[DF].getDepartmentOid())==0)
			                  for(Department d : fatherdepartmentlist2) {%>
			                  <%if(department[DF].equals(d)) continue;%>
			                  <option value="<%=d.getDepartmentOid()%>" <%if(department[DF].getDepartment()!=null&&department[DF].getDepartment().equals(d)) out.print("selected");%>><%=d.getDepartmentName() %></option>
			                  <%} else if(md.get(department[DF].getDepartmentOid())==1)
			                  for(Department d : fatherdepartmentlist1) {%>
			                  <%if(department[DF].equals(d)) continue;%>
			                  <option value="<%=d.getDepartmentOid()%>" <%if(department[DF].getDepartment()!=null&&department[DF].getDepartment().equals(d)) out.print("selected");%>><%=d.getDepartmentName() %></option>
			                  <%} %>
			                </select>
				        </span>
				        <span style="width: 100px; float:right; padding-top: 10px; padding-bottom: 10px;">
				        	<a
				        		onclick="document.getElementById('EditForm<%=I %>').submit();"
								style="cursor: pointer; float: left; text-decoration:none;">
								保存
							 </a>
							 <a
					         	onclick="document.getElementById('ShowForm<%=I %>').style.display='';document.getElementById('Fun<%=I %>').style.display='';document.getElementById('EditForm<%=I %>').style.display='none';"
								style="cursor: pointer; float: left; text-decoration:none;">　
								取消
							 </a>
				        </span>
				        </form>
				        <span id="Fun<%=I %>" style="width: 100px; float:right; padding-top: 10px; padding-bottom: 10px;">
					         <a
					         	onclick="document.getElementById('Fun<%=I %>').style.display='none';document.getElementById('ShowForm<%=I %>').style.display='none';document.getElementById('EditForm<%=I %>').style.display='';"
								style="cursor: pointer; float: left; text-decoration:none;">
								修改
							 </a>
					         <form id="DelForm<%=I %>" action="DepartmentDelete" style="float: left;">
						       <input type="hidden" name="delete" value="<%=department[DF].getDepartmentOid()%>"/>　
						       <a class="delbut" onclick="document.getElementById('DelForm<%=I %>').submit();" style="cursor: pointer;">删除</a>
						     </form>
				        </span>
			      	</h4>
	          	</div>
	          	<%if(!department[DF].getDepartments().isEmpty()) {%>
	          	<div class="collapse" id="collapse<%=I %>" aria-expanded="false" style="padding: 0; width: 100%;">
	          	<%
			  	  I++;
			      set = department[DF].getDepartments();
			      DF++;
			      itList.add(DF,set.iterator());
			      while(itList.get(DF).hasNext()) {
			      department[DF] = (Department) itList.get(DF).next();%>
          			<div class="div-dep">
		                <h4 class="panel-title">
					        <span data-toggle="collapse" href="#collapse" aria-expanded="false" class="collapsed" style="width: 80px; float:left; padding-top: 10px; padding-bottom: 10px;">
					        	<i class="fa fa-lg">　　</i><i class="fa fa-square-o fa-lg"></i>
					        </span>
					        <form id="ShowForm<%=I %>">
					        <span style="width: 30%; float:left; padding-top: 10px; padding-bottom: 10px;">
					        	<%=department[DF].getDepartmentName() %>
					        </span>
					        <span style="width: 30%; float:left; padding-top: 10px; padding-bottom: 10px;">
					        	<%=department[DF].getDepartmentNo() %>
					        </span>
					        <span style="width: 15%; float:left; padding-top: 10px; padding-bottom: 10px;">
					        	<%=department[DF].getWorkers().size() %>
					        </span>
					        </form>
					        <form id="EditForm<%=I %>" action="departmentUpdate" method="post" style="display: none;">
					        <input type='hidden' name='alter' value='<%=department[DF].getDepartmentOid()%>'/>
					        <span style="width: 30%; float:left; padding-top:1px; padding-bottom:1px;">
					        	<input type="text" class="form-control" name="department.DepartmentName" placeholder="部门名称" value="<%=department[DF].getDepartmentName() %>" style="height: 33px; width: 90%;" required>
					        </span>
					        <span style="width: 30%; float:left; padding-top:1px; padding-bottom:1px;">
					        	<input type="text" class="form-control" name="department.DepartmentNo" placeholder="部门编号 " value="<%=department[DF].getDepartmentNo() %>" style="height: 33px; width: 90%;" required>
					        </span>
					        <span style="width: 15%; float:left; padding-top:1px; padding-bottom:1px;">
					        	<select name="FatherDepartmentOid" class="form-control" style="height: 33px; ">
				                  <option value="0">无</option>
				                  <%if(md.get(department[DF].getDepartmentOid())==0)
				                  for(Department d : fatherdepartmentlist2) {%>
				                  <%if(department[DF].equals(d)) continue;%>
				                  <option value="<%=d.getDepartmentOid()%>" <%if(department[DF].getDepartment()!=null&&department[DF].getDepartment().equals(d)) out.print("selected");%>><%=d.getDepartmentName() %></option>
				                  <%} else if(md.get(department[DF].getDepartmentOid())==1)
				                  for(Department d : fatherdepartmentlist1) {%>
				                  <%if(department[DF].equals(d)) continue;%>
				                  <option value="<%=d.getDepartmentOid()%>" <%if(department[DF].getDepartment()!=null&&department[DF].getDepartment().equals(d)) out.print("selected");%>><%=d.getDepartmentName() %></option>
				                  <%} %>
				                </select>
					        </span>
					        <span style="width: 100px; float:right; padding-top: 10px; padding-bottom: 10px;">
					        	<a
					        		onclick="document.getElementById('EditForm<%=I %>').submit();"
									style="cursor: pointer; float: left; text-decoration:none;">
									保存
								 </a>
								 <a
						         	onclick="document.getElementById('ShowForm<%=I %>').style.display='';document.getElementById('Fun<%=I %>').style.display='';document.getElementById('EditForm<%=I %>').style.display='none';"
									style="cursor: pointer; float: left; text-decoration:none;">　
									取消
								 </a>
					        </span>
					        </form>
					        <span id="Fun<%=I %>" style="width: 100px; float:right; padding-top: 10px; padding-bottom: 10px;">
						         <a
						         	onclick="document.getElementById('Fun<%=I %>').style.display='none';document.getElementById('ShowForm<%=I %>').style.display='none';document.getElementById('EditForm<%=I %>').style.display='';"
									style="cursor: pointer; float: left; text-decoration:none;">
									修改
								 </a>
						         <form id="DelForm<%=I %>" action="DepartmentDelete" style="float: left;">
							       <input type="hidden" name="delete" value="<%=department[DF].getDepartmentOid()%>"/>　
							       <a class="delbut" onclick="document.getElementById('DelForm<%=I %>').submit();" style="cursor: pointer;">删除</a>
							     </form>
					        </span>
				      	</h4>
		            </div>
	          <%I++;}
			    itList.remove(DF);
				DF--;%>
			  </div>
			  <%}
			  %>
          	  
          <%I++;}
		    itList.remove(DF);
			DF--;%>
		  </div>
		  <%}
		  %>
		  
          <%} I++;}%>
			          
          <button id="NDBtn" type="submit" 
          class="btn btn-outline btn-default btn-block" style="margin-top: 10px; height: 37px;"
          onclick="document.getElementById('NDBtn').style.display='none';document.getElementById('NDDiv').style.display='';"
          >
          	新增部门
          </button>
          
          <div id="NDDiv" style="border-bottom: 1px solid #ddd;border-top: 1px solid #ddd; height: 37px; margin-top: 10px; margin-bottom: 0px; padding:0px 15px; display: none;">
                <h4 class="panel-title">
			        <span data-toggle="collapse" href="#collapse" aria-expanded="false" class="collapsed" style="width: 80px; float:left; padding-top: 10px; padding-bottom: 10px;">
			        	新部门
			        </span>
			        <form id="NDForm" action="DepartmentInsert" method="post">
			        <input type='hidden' name='alter' />
			        <span style="width: 30%; float:left; padding-top:1px; padding-bottom:1px;">
			        	<input type="text" class="form-control" name="department.DepartmentName" placeholder="部门名称" style="height: 33px; width: 90%;" required>
			        </span>
			        <span style="width: 30%; float:left; padding-top:1px; padding-bottom:1px;">
			        	<input type="text" class="form-control" name="department.DepartmentNo" placeholder="部门编号 " style="height: 33px; width: 90%;" required>
			        </span>
			        <span style="width: 15%; float:left; padding-top:1px; padding-bottom:1px;">
			        	<select name="FatherDepartmentOid" class="form-control" style="height: 33px; ">
		                  <option value="0">无</option>
		                  <%for(Department d : fatherdepartmentlist2) {%>
		                  <option value="<%=d.getDepartmentOid()%>"><%=d.getDepartmentName() %></option>
		                  <%} %>
		                </select>
			        </span>
			        <span style="width: 100px; float:right; padding-top: 10px; padding-bottom: 10px;">
			        	<a
			        		onclick="document.getElementById('NDForm').submit();"
							style="cursor: pointer; float: left; text-decoration:none;">
							保存
						 </a>
						 <a
				         	onclick="document.getElementById('NDBtn').style.display='';document.getElementById('NDDiv').style.display='none';"
							style="cursor: pointer; float: left; text-decoration:none;">　
							取消
						 </a>
			        </span>
			        </form>
		      	</h4>
            </div>

  </body>
</html>
