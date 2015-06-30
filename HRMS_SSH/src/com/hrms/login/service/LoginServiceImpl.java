package com.hrms.login.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.login.dao.LoginDao;
import com.hrms.pojo.Worker;
@Transactional
public class LoginServiceImpl implements LoginService {
	@Resource
	LoginDao loginDao;
	
	@Override
	public List<Worker> showWorker() {
		return loginDao.showWorker();
	}
	
	@Override
	public List<Worker> searchWorkers(String hql) {
		return loginDao.searchWorkers(hql);
	}
	
	@Override
	public Worker searchWorker(Worker worker) {
		return loginDao.searchWorker(worker);
	}
	
	@Override
	public Worker updateWorker(Worker worker) {
		return loginDao.updateWorker(worker);
	}

	@Override
	public String checkWorker(Worker worker) {
		return loginDao.checkWorker(worker);
	}

}
