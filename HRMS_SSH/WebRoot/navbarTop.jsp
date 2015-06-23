<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.hrms.pojo.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:action name="CheckMessage" executeResult="false" namespace="/"/>
<%
activeWorker = (Worker)session.getAttribute("activeWorker");
List<Message> messageList = (List<Message>)session.getAttribute("messageList");
Set<Cultivationperson> cultivationPersonList = activeWorker.getCultivationpersons();
SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy-MM-dd");
%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="./index.jsp"><img src="./img/brand.png" style="height: 20px;"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right  ">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-lg fa-bullhorn"></i> <%if(activeWorker.getWorkerUnreadMessage()!=null&&activeWorker.getWorkerUnreadMessage()>0) {%><sup><span class="badge" style="background-color: #E61A42;"><%=activeWorker.getWorkerUnreadMessage() %></span></sup><%} else {%><i class="fa fa-lg fa-caret-down"></i><%} %></a>
                    <ul class="dropdown-menu dropdown-messages" style="width: 400px;">
                    <%if(!messageList.isEmpty())
                    	for(Message message : messageList){ %>
                        <li>
                            <a href="./message.jsp">
                                <div>
                                    <strong><%=message.getMessageTitle() %></strong>
                                <span class="pull-right text-muted">
                                    <em><%=simpledateformat.format(message.getMessageDate()) %></em>
                                </span>
                                </div>
                                <div>
                                	<%if(message.getMessageContent().length()>20) out.print(message.getMessageContent().substring(0, 19)+".."); else out.print(message.getMessageContent());%>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                         <%} else { %>
	                     <li>
	                            <a href="./message.jsp">
	                                <div style="text-align: center;">
	                                    <em>无公告。</em>
	                                </div>
	                            </a>
	                        </li>
	                     <li class="divider"></li>
	                     <%} %>
                        <li>
                            <a class="text-center" href="./message.jsp">
                                <strong>阅读所有公告</strong>
                                <i class="fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-lg fa-flag"></i>  <i class="fa fa-lg fa-caret-down"></i></a>
                    <ul class="dropdown-menu dropdown-messages" style="width: 400px;">
                    <%
                    int cultivationPersonListNum = 0;
                    if(!cultivationPersonList.isEmpty())
        			for(Cultivationperson cultivationperson : cultivationPersonList) {
        			%>
        			<%
			        Date nowdate = new Date();
			        long time1 = nowdate.getTime() - cultivationperson.getCultivation().getCultivationBeginDate().getTime();
			        long time2 = cultivationperson.getCultivation().getCultivationEndDate().getTime() - cultivationperson.getCultivation().getCultivationBeginDate().getTime();
			        double percent = (double)time1/time2*100;
			        if(percent>100||percent<0) continue;
			        cultivationPersonListNum++;
			        %>
                        <li>
                            <a href="./cultivationCheck.jsp">
                                <div>
                                    <strong><%=cultivationperson.getCultivation().getCultivationProject() %></strong>
                                <span class="pull-right text-muted">
                                    <em><%=(int)percent %>%</em>
                                </span>
                                </div>
                                <div class="progress progress-striped active" style="margin-top: 10px;margin-bottom: 10px;">
                				<div class="progress-bar" role="progressbar" aria-valuenow="<%=(int)percent %>" aria-valuemin="0" aria-valuemax="100" style="width: <%=(int)percent %>%"></div>
                            	</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                     <%} if(cultivationPersonListNum==0) { %>
                     <li>
                            <a href="./cultivationCheck.jsp">
                                <div style="text-align: center;">
                                    <em>无进行中培训。</em>
                                </div>
                            </a>
                        </li>
                     <li class="divider"></li>
                     <%} %>
                        <li>
                            <a class="text-center" href="./cultivationCheck.jsp">
                                <strong>查看所有培训</strong>
                                <i class="fa-angle-right"></i>
                            </a>
                        </li>
                        
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-lg fa-user"></i> <i class="fa fa-lg fa-caret-down"></i></a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user"></i> <%=activeWorker.getWorkerName() %></a> 
                        </li>
                        <li><a href="#" data-toggle="modal" data-target="#aboutModal"><i class="fa fa-info-circle"></i> 关于</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="Logout"><i class="fa fa-sign-out"></i> 登出系统</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>