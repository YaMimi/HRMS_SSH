package com.hrms.login.action;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hrms.login.service.LoginService;
import com.hrms.pojo.Department;
import com.hrms.pojo.Worker;
import com.hrms.worker.services.WorkerAddInformationService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private Worker worker;
	@Resource
	private LoginService loginService;
	@Resource
	private WorkerAddInformationService workerAddInformationService;

	public String login() {

		Map<String, Object> session = ActionContext.getContext().getSession();
		String result;
		
		result = loginService.checkUser(worker);
		
		if (result != null && result.equals("CORRECT")) {
			Worker worker1 = loginService.searchUser(worker);
			session.put("activeWorker", worker1);
			

			/*功能：此处是在登录成功时获取数据库 部门名称
			 * 
			 * 作者：徐新院
			 * 时间：2015-6-9  Time:16时54分
			 * */
			String hqlDepart="FROM Department";
			ArrayList<Department> department=workerAddInformationService.SelectAllDepartmen(hqlDepart);
			ActionContext.getContext().getSession().put("department1", department);
			ActionContext.getContext().getSession().put("workerNo",worker.getWorkerNo() );
			//
			return this.SUCCESS;
		}
		if (result != null && result.equals("WRONG")) {
			session.put("state", "LOGINERROR");
			return this.ERROR;
		}
		if (result != null && result.equals("EMPTY")) {
			session.put("state", "LOGINEMPTY");
			return this.NONE;
		}
		return this.NONE;
	}
	
	public String logout() {
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.put("activeWorker", null);
		session.put("state", "LOGOUTSUCCESS");
		return this.SUCCESS;
	}

	public WorkerAddInformationService getWorkerAddInformationService() {
		return workerAddInformationService;
	}

	public void setWorkerAddInformationService(
			WorkerAddInformationService workerAddInformationService) {
		this.workerAddInformationService = workerAddInformationService;
	}

	public Worker getWorker() {
		return worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	
}
