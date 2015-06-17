package com.hrms.salary.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

import com.hrms.pojo.Salary;

public class SalaryDaoImpl implements SalaryDao {

	@Resource
	SessionFactory sessionFactory;
	
	@Override
	public List<Salary> searchSalaryList(String hql) {
		// TODO Auto-generated method stub
		List<Salary> salarylist = sessionFactory.getCurrentSession().createQuery(hql).list();
		return salarylist;
	}

	@Override
	public Salary insertSalary(Salary salary) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(salary);
		return null;
	}

	@Override
	public Salary updateSalary(Salary salary) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().merge(salary);
		return null;
	}

	@Override
	public void deleteSalary(Salary salary) {
		// TODO Auto-generated method stub

	}

	@Override
	public Salary searchSalary(int salaryOid) {
		// TODO Auto-generated method stub
		Salary salary = (Salary) sessionFactory.getCurrentSession().load(Salary.class, salaryOid);
		return salary;
	}

}
