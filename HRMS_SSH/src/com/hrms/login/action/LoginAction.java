package com.hrms.login.action;

import java.util.Map;

import javax.annotation.Resource;

import com.hrms.login.service.LoginService;
import com.hrms.pojo.Worker;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private Worker worker;
	
	@Resource
	private LoginService loginService;
	
	public String login() {

		Map<String, Object> session = ActionContext.getContext().getSession();
		String result;
		
		result = loginService.checkWorker(worker);
		
		if (result != null && result.equals("CORRECT")) {
			Worker worker1 = loginService.searchWorker(worker);
			session.put("activeWorker", worker1);
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
