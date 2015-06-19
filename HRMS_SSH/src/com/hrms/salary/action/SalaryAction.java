package com.hrms.salary.action;

import javax.annotation.Resource;

import com.hrms.pojo.Salary;
import com.hrms.salary.service.SalaryService;
import com.opensymphony.xwork2.ActionSupport;

public class SalaryAction extends ActionSupport {
	private Salary salary;
	@Resource
	private SalaryService salaryService;
	
	
	
	
	
	public Salary getSalary() {
		return salary;
	}
	public void setSalary(Salary salary) {
		this.salary = salary;
	}
	public SalaryService getSalaryService() {
		return salaryService;
	}
	public void setSalaryService(SalaryService salaryService) {
		this.salaryService = salaryService;
	}
}
