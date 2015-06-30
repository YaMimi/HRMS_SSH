package com.hrms.attendance.actions;
/*
 * 类：考勤的Action
 * 作者：杨明杰、卢国燊
 * 更新日期：2015-6-10
 */
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.attendance.services.AttendanceService;
import com.hrms.holiday.service.HolidayService;
import com.hrms.login.service.LoginService;
import com.hrms.page.bean.PageBean;
import com.hrms.page.service.PageService;
import com.hrms.pojo.Attendance;
import com.hrms.pojo.Holiday;
import com.hrms.pojo.Salary;
import com.hrms.pojo.Worker;
import com.hrms.salary.service.SalaryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AttendanceAction extends ActionSupport {
	private String Date;
	private String DateDepartment;
	private Attendance attendance;
	private String attendWorkerNo;
	@Resource
	private AttendanceService attendanceservice;
	@Resource
	private LoginService loginService;
	@Resource
	private SalaryService salaryService;
	@Resource
	private HolidayService holidayService;
	@Resource
	private PageService pageserivce;
	private int page;
	/**功能：个人考勤查询
	 * 作者：杨明杰
	 * 日期：2015-6-9
	 */
	public String workerAttendanceSearch(){
		//获取当日日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String checkDate = sdf.format(date);
		//获取员工session
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		//hql语句
		String hql = "from Attendance where attendanceWorkerOid = "+worker.getWorkerOid()+" and attendanceDate <= '" + checkDate +
				"' order by attendanceDate desc";
		List<Attendance> attendancelist = attendanceservice.searchAttendance(hql);
		
		session.put("attendancelist", attendancelist);
		ActionContext.getContext().setSession(session);
		return SUCCESS;
		
	}
	/**功能：个人考勤查询（按日期）
	 * 作者：杨明杰
	 * 日期：2015-6-9
	 */
	public String workerAttendanceSearchByDate(){
		//System.out.println(Date);
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		String hql = "from Attendance where attendanceWorkerOid = "+worker.getWorkerOid()+" and attendanceDate = '"+Date+"' order by attendanceDate desc";
		List<Attendance> attendancelistdate = attendanceservice.searchAttendance(hql);
		session.put("attendancelistdate", attendancelistdate);
		ActionContext.getContext().setSession(session);
		
		return SUCCESS;
	}
	
	/**功能：部门考勤查询
	 * 作者：杨明杰
	 * 日期：2015-6-11
	 */
	public String departmentAttendanceSearch(){
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		//获取当日日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String checkDate = sdf.format(date);
		//System.out.println(checkDate);
		//hql语句
		String hql = "from Attendance a where a.attendanceDate = '" + checkDate +"' and a.worker.department.departmentOid = "+ worker.getDepartment().getDepartmentOid() +
				" order by attendanceOid desc";
		PageBean pageBean = pageserivce.getPageBean(hql, 5, page);
		//获取当前部门的人
		hql = "from Worker w where w.department.departmentOid = "+ worker.getDepartment().getDepartmentOid() +
				" order by workerOid desc";
		List<Worker> workers = (List<Worker>)loginService.searchWorkers(hql);
		
		session.put("departmentattendancelist", pageBean.getList());
		session.put("departmentworkers", workers);
		session.put("pageBean", pageBean);
		ActionContext.getContext().setSession(session);
		return SUCCESS;
		
	}
	
	/**功能：签到功能
	 * 作者：卢国燊
	 * 日期：2015-6-10
	 */
	public String workerAttendanceInsert(){
		//System.out.println(Date);
		Attendance attendance1 = new Attendance();
		Worker worker = new Worker();
		worker.setWorkerNo(attendWorkerNo);
		Map session = ActionContext.getContext().getSession();
		//判断是否存在这个员工
		worker = loginService.searchWorker(worker);
		if(worker==null) {
			session.put("state", "WORKERNULL");
			return this.ERROR;
		}
		Date date = new Date();
		Time time = new Time(date.getTime());
		//创建新考勤对象
		attendance = new Attendance();
		//设置考勤日期
		attendance.setAttendanceDate(date);
		//设置考勤员工
		attendance.setWorker(worker);
		//查询当前用户在数据库是否已经签到
		
		attendance1 = attendanceservice.searchAttendance(attendance);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(attendance1==null) {//没有与今天相同的考勤
			//设置考勤状态
			//获取当日假日信息
			String hql = "from Holiday where HolidayDate like '"+ sdf.format(date) +"' order by HolidayDate asc";
			List<Holiday> holidays = holidayService.searchHolidays(hql);
			//if(holidays.isEmpty()){System.out.println("holidays is empty!");}
			
			if(!holidays.isEmpty()){
				//取出假日日期
				Holiday holiday = holidays.get(0);
				if(sdf.format(holiday.getHolidayDate()).equals(sdf.format(date))){
					attendance.setAttendanceState(3);
				}
			}else if(date.getDay()==0||date.getDay()==6){
				attendance.setAttendanceState(2);
			}else{
				attendance.setAttendanceState(1);
			}
			//设置考勤上班时间
			attendance.setAttendanceOnTime(time);
			//判断插入新的考勤是否成功
			if(attendanceservice.insertAttendance(attendance)!=null) {//成功
				attendance=null;
				session.put("state", "ATTENDSUCCESS");
				return this.SUCCESS;
			}
			else {//失败
				attendance=null;
				session.put("state", "ATTENDFAILED");
				return this.ERROR;
			}
		} else {//当天已有考勤
			if(attendance1.getAttendanceState()!=0) {//当天考勤不为请假
				//判断当年当月工资记录是否已经存在
				sdf = new SimpleDateFormat("yyyy-MM");
				String hql = "from Salary s where s.worker.workerOid = "+ worker.getWorkerOid() +" and s.salaryDate like '"+ sdf.format(date) +"%' order by salaryOid desc";
				List<Salary> salarys = salaryService.searchSalary(hql);
				//if(salarys.isEmpty()){System.out.println("salarys is empty!");}else{System.out.println("salarys is not empty!");}
				//判断是否改变年月
				if(salarys.isEmpty()){//新建一个工时记录
					//得到工资记录
					Salary salary = new Salary();
					salaryService.newSalary(salary, worker, date);
				}
				if(attendance1.getAttendanceOffTime()==null) {//下班还未签到
					//设置工时
					//修改工时记录
					Salary salary = salaryService.searchSalary(hql).get(0);
					if(attendance1.getAttendanceState()==3){//假日加班工时
						salaryService.updateSalaryHolidayTime(salary, attendance1, time);
					}else if(attendance1.getAttendanceState()==2){//双休加班工时
						salaryService.updateSalaryWeekendTime(salary, attendance1, time);
					}else if(attendance1.getAttendanceState()==1){//工作日工时
						salaryService.updateSalaryActualTime(salary, attendance1, time);
					}
					
					attendance = attendance1;
					attendance.setAttendanceOffTime(time);
					if(attendanceservice.updateAttendance(attendance)!=null) {//更新下班签到成功
						attendance=null;
						session.put("state", "ATTENDSUCCESS");
						return this.SUCCESS;
					}
					else {
						attendance=null;
						session.put("state", "ATTENDFAILED");
						return this.ERROR;
					}
				}
			} else {//今天请假
				session.put("state", "INVACATION");
				return this.ERROR;
			}
		}
		//当日已经签到次数已满
		session.put("state", "ATTENDALREADY");
		return this.ERROR;
	}
	
	/*
	 * 功能：部门考勤查询
	 * 作者：杨明杰
	 * 日期：6月28日
	 */
	public String dateSearchDepartmentAttendance(){
		//System.out.println(DateDepartment);
		if(!DateDepartment.equals("")){
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		String hql = "from Attendance a where a.worker.department.departmentOid = "+worker.getDepartment().getDepartmentOid()+" and attendanceDate = '"+DateDepartment+"' order by attendanceDate desc";
		List<Attendance> departmentattendancelistdate = attendanceservice.searchAttendance(hql);
//		for(Attendance a : departmentattendancelistdate){
//			System.out.println(a.getWorker().getWorkerName());
//		}
		if(departmentattendancelistdate.size()>0){
			session.put("departmentattendancelistdate", departmentattendancelistdate);
		}
		ActionContext.getContext().setSession(session);
		}
		return SUCCESS;
		
	}
	
	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public Attendance getAttendance() {
		return attendance;
	}
	public void setAttendance(Attendance attendance) {
		this.attendance = attendance;
	}
	public AttendanceService getAttendanceservice() {
		return attendanceservice;
	}
	public void setAttendanceservice(AttendanceService attendanceservice) {
		this.attendanceservice = attendanceservice;
	}
	public String getAttendWorkerNo() {
		return attendWorkerNo;
	}
	public void setAttendWorkerNo(String attendWorkerNo) {
		this.attendWorkerNo = attendWorkerNo;
	}
	public LoginService getLoginService() {
		return loginService;
	}
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	public PageService getPageserivce() {
		return pageserivce;
	}
	public void setPageserivce(PageService pageserivce) {
		this.pageserivce = pageserivce;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public SalaryService getSalaryService() {
		return salaryService;
	}
	public void setSalaryService(SalaryService salaryService) {
		this.salaryService = salaryService;
	}
	public String getDateDepartment() {
		return DateDepartment;
	}
	public void setDateDepartment(String dateDepartment) {
		DateDepartment = dateDepartment;
	}
	public HolidayService getHolidayService() {
		return holidayService;
	}
	public void setHolidayService(HolidayService holidayService) {
		this.holidayService = holidayService;
	}
	
}
