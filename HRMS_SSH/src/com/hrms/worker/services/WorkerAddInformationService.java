package com.hrms.worker.services;
import java.util.ArrayList;

import com.hrms.pojo.Department;
import com.hrms.pojo.Worker;

public interface WorkerAddInformationService {

	public abstract ArrayList<Department> SelectAllDepartmen(String hql);
	 public abstract Worker SaveWorkers(Worker worker);
	 public abstract  ArrayList<Worker> SelectCurrentWorkers(String hql);
	 public abstract  ArrayList<Worker> SelectAllWorkers(String hql);
	 public abstract  ArrayList lWorkersAddDepartment();
	 public abstract  int DeleteWorker(String  workerNo);
	 public abstract  void UpdateWorker(Worker worker);
	 public abstract ArrayList<Worker> EveryPage(String sql,int pageNo,int pageSize);
	 public abstract  int updateWorkerPassword(Worker worker,String newPassword,int workerOid);
	 public abstract  void flush();
}