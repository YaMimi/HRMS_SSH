package com.hrms.salary.dao;

import java.util.List;

import com.hrms.pojo.Salary;

public interface SalaryDao {
	public List<Salary> searchSalaryList(String hql);
	public Salary insertSalary(Salary salary);
	public Salary updateSalary(Salary salary);
	public void deleteSalary(Salary salary);
	public Salary searchSalary(int salaryOid);
}
