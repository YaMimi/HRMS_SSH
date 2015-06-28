package com.hrms.salary.service;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import com.hrms.pojo.Attendance;
import com.hrms.pojo.Salary;
import com.hrms.pojo.Worker;

public interface SalaryService {
	public List<Salary> searchSalary(String hql);
	public Salary insertSalary(Salary salary);
	public Salary updateSalary(Salary salary);
	public void deleteSalary(Salary salary);
	public void newSalary(Salary salary, Worker worker, Date date);
	public void updateSalaryActualTime(Salary salary, Attendance attendance1, Time time);
	public void updateSalaryWeekendTime(Salary salary, Attendance attendance1, Time time);
	public void updateSalaryHolidayTime(Salary salary, Attendance attendance1, Time time);
	public Salary searchSalary(Integer salaryOid);
}
