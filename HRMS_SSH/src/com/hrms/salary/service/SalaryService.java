package com.hrms.salary.service;

import java.util.List;

import com.hrms.pojo.Salary;

public interface SalaryService {
	public List<Salary> searchSalary(String hql);
	public Salary insertSalary(String hql);
	public Salary updateSalary(String hql);
	public void deleteSalary(Salary salary);
}
