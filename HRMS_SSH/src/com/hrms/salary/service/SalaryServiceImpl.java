package com.hrms.salary.service;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.pojo.Attendance;
import com.hrms.pojo.Salary;
import com.hrms.pojo.Worker;
import com.hrms.salary.dao.SalaryDao;
@Transactional
public class SalaryServiceImpl implements SalaryService {

	@Resource
	SalaryDao salarydao;
	
	@Override
	public List<Salary> searchSalary(String hql) {
		// TODO Auto-generated method stub
		return salarydao.searchSalaryList(hql);
	}

	@Override
	public void deleteSalary(Salary salary) {
		// TODO Auto-generated method stub

	}

	@Override
	public void newSalary(Salary salary, Worker worker, Date date) {
		// TODO Auto-generated method stub
		//设置日期
		salary.setSalaryDate(date);
		//设置时薪
		if(worker.getWorkerPermission()==1){//普工
			salary.setSalaryHourly((float) 15);
		}else if(worker.getWorkerPermission()==2){//组长
			salary.setSalaryHourly((float) 20);
		}else if(worker.getWorkerPermission()==3){//部门经理
			salary.setSalaryHourly((float) 25);
		}else if(worker.getWorkerPermission()==4){//总经理
			salary.setSalaryHourly((float) 30);
		}
		//设置额定工时
		salary.setSalaryStandardTime((float) 166.4);
		//设置实际正常工时
		salary.setSalaryActualTime((float) 0);
		salary.setSalaryWeekTime((float) 0);
		salary.setSalaryWeekendTime((float) 0);
		salary.setSalaryHolidayTime((float) 0);
		salary.setSalaryAttendanceReward((float) 0);
		salary.setSalaryRop((float) 0);
		salary.setSalaryTotal((float) 0);
		salary.setSalaryResult(0);
		salary.setWorker(worker);
		salarydao.insertSalary(salary);
	}
	
	@Override
	public void updateSalaryActualTime(Salary salary, Attendance attendance1,
			Time time) {
		// TODO Auto-generated method stub
		int hour;
		int minute;
		float salaryActualTime = 0;
		float salaryWeekTime = 0;
		if((time.getHours()-attendance1.getAttendanceOnTime().getHours())<=8){
			//小时
			hour = time.getHours()-attendance1.getAttendanceOnTime().getHours();
			//分钟
			minute = (time.getMinutes()-attendance1.getAttendanceOnTime().getMinutes());
			//计算分钟
			if(minute<=0){
				minute = 60-attendance1.getAttendanceOnTime().getMinutes()+time.getMinutes();
				hour = hour - 1 ;
			}
			salaryActualTime = salary.getSalaryActualTime() + ((float)hour + (float)(minute/60.0));
			salary.setSalaryActualTime(salaryActualTime);
		}else if((time.getHours()-attendance1.getAttendanceOnTime().getHours())>8){
			salaryActualTime = salary.getSalaryActualTime() + (float)8.0;
			salary.setSalaryActualTime(salaryActualTime);
			//加班
			//小时
			hour = time.getHours()-attendance1.getAttendanceOnTime().getHours()-8;
			//分钟
			minute = (time.getMinutes()-attendance1.getAttendanceOnTime().getMinutes());
			//计算分钟
			if(minute<=0){
				minute = 60-attendance1.getAttendanceOnTime().getMinutes()+time.getMinutes();
				hour = hour - 1 ;
			}
			salaryWeekTime = salary.getSalaryWeekTime() + ((float)hour + (float)(minute/60.0));
			salary.setSalaryWeekTime(salaryWeekTime);
		}
		salarydao.updateSalary(salary);
	}

	@Override
	public void updateSalaryHolidayTime(Salary salary, Attendance attendance1,
			Time time) {
		// TODO Auto-generated method stub
		int hour;
		int minute;
		float salaryHolidayTime = 0;
		//小时
		hour = time.getHours()-attendance1.getAttendanceOnTime().getHours();
		//分钟
		minute = (time.getMinutes()-attendance1.getAttendanceOnTime().getMinutes());
		//计算分钟
		if(minute<=0){
			minute = 60-attendance1.getAttendanceOnTime().getMinutes()+time.getMinutes();
			hour = hour - 1 ;
		}
		salaryHolidayTime = salary.getSalaryHolidayTime() + ((float)hour + (float)(minute/60.0));
		salary.setSalaryHolidayTime(salaryHolidayTime);
		salarydao.updateSalary(salary);
	}

	@Override
	public void updateSalaryWeekendTime(Salary salary, Attendance attendance1,
			Time time) {
		// TODO Auto-generated method stub
		int hour;
		int minute;
		float salaryWeekendTime = 0;
		//小时
		hour = time.getHours()-attendance1.getAttendanceOnTime().getHours();
		//分钟
		minute = (time.getMinutes()-attendance1.getAttendanceOnTime().getMinutes());
		//计算分钟
		if(minute<=0){
			minute = 60-attendance1.getAttendanceOnTime().getMinutes()+time.getMinutes();
			hour = hour - 1 ;
		}
		salaryWeekendTime = salary.getSalaryWeekendTime() + ((float)hour + (float)(minute/60.0));
		salary.setSalaryWeekendTime(salaryWeekendTime);
		salarydao.updateSalary(salary);
		salarydao.updateSalary(salary);
	}

	@Override
	public Salary searchSalary(Integer salaryOid) {
		return salarydao.searchSalary(salaryOid);
		// TODO Auto-generated method stub
		
	}

	@Override
	public Salary insertSalary(Salary salary) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Salary updateSalary(Salary salary) {
		// TODO Auto-generated method stub
		return salarydao.updateSalary(salary);
	}

}
