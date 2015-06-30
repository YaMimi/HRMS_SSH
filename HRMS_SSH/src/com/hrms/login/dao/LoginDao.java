package com.hrms.login.dao;

import java.util.List;

import com.hrms.pojo.Worker;

public interface LoginDao {
	public List<Worker> showWorker();
	public Worker searchWorker(Worker worker);
	public Worker updateWorker(Worker worker);
	public String checkWorker(Worker worker);
	public List<Worker> searchWorkers(String hql);
}
