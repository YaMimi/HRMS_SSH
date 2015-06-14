package com.hrms.login.service;

import java.util.List;

import com.hrms.pojo.Worker;

public interface LoginService {
	public List<Worker> showWorker();
	public Worker searchWorker(Worker worker);
	public Worker updateWorker(Worker worker);
	public String checkWorker(Worker worker);
}
