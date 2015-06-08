package com.hrms.login.service;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.login.dao.LoginDao;
import com.hrms.pojo.Worker;
@Transactional
public class LoginServiceImpl implements LoginService {
	@Resource
	LoginDao loginDao;
	
	@Override
	public Worker searchUser(Worker worker) {
		return loginDao.searchUser(worker);
	}

	@Override
	public String checkUser(Worker worker) {
		return loginDao.checkUser(worker);
	}

}
