package com.hrms.worker.services;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.pojo.Department;
import com.hrms.pojo.Worker;
import com.hrms.worker.dao.WorkerAddInformationDao;
@Transactional
public class WorkerAddInformationServiceImpl implements WorkerAddInformationService {
	@Resource
	WorkerAddInformationDao workerAddInformationDao;
	
	/* (non-Javadoc)
	 * @see com.hrms.workerinformation.service.WorkerAddInformationService#SelectAllDepartmen(java.lang.String)
	 */
	@Override
	public ArrayList<Department> SelectAllDepartmen(String hql){
		return workerAddInformationDao.SelectAllDepartmen( hql);
	}

	@Override
	public Worker SaveWorkers(Worker worker) {
		// TODO Auto-generated method stub
		return workerAddInformationDao.SaveWorkers(worker);
	}

	@Override
	public ArrayList<Worker> SelectCurrentWorkers(String hql) {
		return workerAddInformationDao.SelectCurrentWorkers(hql);
	}

	@Override
	public ArrayList<Worker> SelectAllWorkers(String hql) {
		// TODO Auto-generated method stub
		return workerAddInformationDao.SelectAllWorkers(hql);
	}

	@Override
	public int DeleteWorker(String  workerNo) {
		// TODO Auto-generated method stub
		return workerAddInformationDao.DeleteWorker(workerNo);
	}

	@Override
	public void UpdateWorker(Worker worker) {
		// TODO Auto-generated method stub
		workerAddInformationDao.UpdateWorker(worker);
	}

	@Override
	public void flush() {
		// TODO Auto-generated method stub
		workerAddInformationDao.flush();
	}

	@Override
	public ArrayList lWorkersAddDepartment() {
		// TODO Auto-generated method stub
		return workerAddInformationDao.lWorkersAddDepartment();
	} 
	
	
}
