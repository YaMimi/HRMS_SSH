package com.hrms.attendance.actions;
/*
 * 类：考勤的Action
 * 作者：杨明杰、卢国燊
 * 更新日期：2015-6-10
 */
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.attendance.services.AttendanceService;
import com.hrms.login.service.LoginService;
import com.hrms.pojo.Attendance;
import com.hrms.pojo.Worker;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.fastinfoset.sax.Properties;

public class AttendanceAction extends ActionSupport {
	private String Date;
	private Attendance attendance;
	private String attendWorkerNo;
	@Resource
	private AttendanceService attendanceservice;
	@Resource
	private LoginService loginService;
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
		List<Attendance> departmentattendancelist = attendanceservice.searchAttendance(hql);
		session.put("departmentattendancelist", departmentattendancelist);
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
		worker = loginService.searchWorker(worker);
		if(worker==null) {
			session.put("state", "WORKERNULL");
			return this.ERROR;
		}
		Date date = new Date();
		Time time = new Time(date.getTime());
		
		attendance = new Attendance();
		attendance.setAttendanceDate(date);
		attendance.setWorker(worker);
		
		attendance1 = attendanceservice.searchAttendance(attendance);
		if(attendance1==null) {
			attendance.setAttendanceState(1);
			attendance.setAttendanceOnTime(time);
			if(attendanceservice.insertAttendance(attendance)!=null) {
				session.put("state", "ATTENDSUCCESS");
				return this.SUCCESS;
			}
			else {
				session.put("state", "ATTENDFAILED");
				return this.ERROR;
			}
		} else {
			if(attendance1.getAttendanceState()!=0) {
				if(attendance1.getAttendanceOffTime()==null) {
					attendance = attendance1;
					attendance.setAttendanceOffTime(time);
					if(attendanceservice.updateAttendance(attendance)!=null) {
						session.put("state", "ATTENDSUCCESS");
						return this.SUCCESS;
					}
					else {
						session.put("state", "ATTENDFAILED");
						return this.ERROR;
					}
				}
			} else {
				session.put("state", "INVACATION");
				return this.ERROR;
			}
		}
		session.put("state", "ATTENDALREADY");
		return this.ERROR;
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
	
}
