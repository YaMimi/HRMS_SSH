package com.hrms.login.service;

import com.hrms.pojo.Worker;

public interface LoginService {
	public Worker searchUser(Worker worker);
	public String checkUser(Worker worker);
}
