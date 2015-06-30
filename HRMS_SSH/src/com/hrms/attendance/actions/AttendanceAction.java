package com.hrms.attendance.actions;
/*
 * �ࣺ���ڵ�Action
 * ���ߣ������ܡ�¬����
 * �������ڣ�2015-6-10
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
	/**���ܣ����˿��ڲ�ѯ
	 * ���ߣ�������
	 * ���ڣ�2015-6-9
	 */
	public String workerAttendanceSearch(){
		//��ȡ��������
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String checkDate = sdf.format(date);
		//��ȡԱ��session
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		//hql���
		String hql = "from Attendance where attendanceWorkerOid = "+worker.getWorkerOid()+" and attendanceDate <= '" + checkDate +
				"' order by attendanceDate desc";
		List<Attendance> attendancelist = attendanceservice.searchAttendance(hql);
		
		session.put("attendancelist", attendancelist);
		ActionContext.getContext().setSession(session);
		return SUCCESS;
		
	}
	/**���ܣ����˿��ڲ�ѯ�������ڣ�
	 * ���ߣ�������
	 * ���ڣ�2015-6-9
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
	
	/**���ܣ����ſ��ڲ�ѯ
	 * ���ߣ�������
	 * ���ڣ�2015-6-11
	 */
	public String departmentAttendanceSearch(){
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		//��ȡ��������
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String checkDate = sdf.format(date);
		//System.out.println(checkDate);
		//hql���
		String hql = "from Attendance a where a.attendanceDate = '" + checkDate +"' and a.worker.department.departmentOid = "+ worker.getDepartment().getDepartmentOid() +
				" order by attendanceOid desc";
		PageBean pageBean = pageserivce.getPageBean(hql, 5, page);
		//��ȡ��ǰ���ŵ���
		hql = "from Worker w where w.department.departmentOid = "+ worker.getDepartment().getDepartmentOid() +
				" order by workerOid desc";
		List<Worker> workers = (List<Worker>)loginService.searchWorkers(hql);
		
		session.put("departmentattendancelist", pageBean.getList());
		session.put("departmentworkers", workers);
		session.put("pageBean", pageBean);
		ActionContext.getContext().setSession(session);
		return SUCCESS;
		
	}
	
	/**���ܣ�ǩ������
	 * ���ߣ�¬����
	 * ���ڣ�2015-6-10
	 */
	public String workerAttendanceInsert(){
		//System.out.println(Date);
		Attendance attendance1 = new Attendance();
		Worker worker = new Worker();
		worker.setWorkerNo(attendWorkerNo);
		Map session = ActionContext.getContext().getSession();
		//�ж��Ƿ�������Ա��
		worker = loginService.searchWorker(worker);
		if(worker==null) {
			session.put("state", "WORKERNULL");
			return this.ERROR;
		}
		Date date = new Date();
		Time time = new Time(date.getTime());
		//�����¿��ڶ���
		attendance = new Attendance();
		//���ÿ�������
		attendance.setAttendanceDate(date);
		//���ÿ���Ա��
		attendance.setWorker(worker);
		//��ѯ��ǰ�û������ݿ��Ƿ��Ѿ�ǩ��
		
		attendance1 = attendanceservice.searchAttendance(attendance);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(attendance1==null) {//û���������ͬ�Ŀ���
			//���ÿ���״̬
			//��ȡ���ռ�����Ϣ
			String hql = "from Holiday where HolidayDate like '"+ sdf.format(date) +"' order by HolidayDate asc";
			List<Holiday> holidays = holidayService.searchHolidays(hql);
			//if(holidays.isEmpty()){System.out.println("holidays is empty!");}
			
			if(!holidays.isEmpty()){
				//ȡ����������
				Holiday holiday = holidays.get(0);
				if(sdf.format(holiday.getHolidayDate()).equals(sdf.format(date))){
					attendance.setAttendanceState(3);
				}
			}else if(date.getDay()==0||date.getDay()==6){
				attendance.setAttendanceState(2);
			}else{
				attendance.setAttendanceState(1);
			}
			//���ÿ����ϰ�ʱ��
			attendance.setAttendanceOnTime(time);
			//�жϲ����µĿ����Ƿ�ɹ�
			if(attendanceservice.insertAttendance(attendance)!=null) {//�ɹ�
				attendance=null;
				session.put("state", "ATTENDSUCCESS");
				return this.SUCCESS;
			}
			else {//ʧ��
				attendance=null;
				session.put("state", "ATTENDFAILED");
				return this.ERROR;
			}
		} else {//�������п���
			if(attendance1.getAttendanceState()!=0) {//���쿼�ڲ�Ϊ���
				//�жϵ��굱�¹��ʼ�¼�Ƿ��Ѿ�����
				sdf = new SimpleDateFormat("yyyy-MM");
				String hql = "from Salary s where s.worker.workerOid = "+ worker.getWorkerOid() +" and s.salaryDate like '"+ sdf.format(date) +"%' order by salaryOid desc";
				List<Salary> salarys = salaryService.searchSalary(hql);
				//if(salarys.isEmpty()){System.out.println("salarys is empty!");}else{System.out.println("salarys is not empty!");}
				//�ж��Ƿ�ı�����
				if(salarys.isEmpty()){//�½�һ����ʱ��¼
					//�õ����ʼ�¼
					Salary salary = new Salary();
					salaryService.newSalary(salary, worker, date);
				}
				if(attendance1.getAttendanceOffTime()==null) {//�°໹δǩ��
					//���ù�ʱ
					//�޸Ĺ�ʱ��¼
					Salary salary = salaryService.searchSalary(hql).get(0);
					if(attendance1.getAttendanceState()==3){//���ռӰ๤ʱ
						salaryService.updateSalaryHolidayTime(salary, attendance1, time);
					}else if(attendance1.getAttendanceState()==2){//˫�ݼӰ๤ʱ
						salaryService.updateSalaryWeekendTime(salary, attendance1, time);
					}else if(attendance1.getAttendanceState()==1){//�����չ�ʱ
						salaryService.updateSalaryActualTime(salary, attendance1, time);
					}
					
					attendance = attendance1;
					attendance.setAttendanceOffTime(time);
					if(attendanceservice.updateAttendance(attendance)!=null) {//�����°�ǩ���ɹ�
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
			} else {//�������
				session.put("state", "INVACATION");
				return this.ERROR;
			}
		}
		//�����Ѿ�ǩ����������
		session.put("state", "ATTENDALREADY");
		return this.ERROR;
	}
	
	/*
	 * ���ܣ����ſ��ڲ�ѯ
	 * ���ߣ�������
	 * ���ڣ�6��28��
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
