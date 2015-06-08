package com.hrms.login.dao;

import com.hrms.pojo.Worker;

public interface LoginDao {
	public Worker searchUser(Worker worker);
	public String checkUser(Worker worker);
}
