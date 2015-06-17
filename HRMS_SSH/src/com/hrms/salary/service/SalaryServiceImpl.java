package com.hrms.salary.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.pojo.Salary;
import com.hrms.salary.dao.SalaryDao;
@Transactional
public class SalaryServiceImpl implements SalaryService {

	@Resource
	SalaryDao salarydao;
	
	@Override
	public List<Salary> searchSalary(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Salary insertSalary(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Salary updateSalary(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteSalary(Salary salary) {
		// TODO Auto-generated method stub

	}

}
