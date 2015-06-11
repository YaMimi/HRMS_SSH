package com.hrms.attendance.actions;
/*
 * 类：考勤的Action
 * 作者：杨明杰、卢国燊
 * 更新日期：2015-6-10
 */
import java.sql.Time;
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
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		String hql = "from Attendance where attendanceWorkerOid = "+worker.getWorkerOid()+" order by attendanceDate desc";
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
		worker = loginService.searchUser(worker);
		if(worker==null) {
			return this.NONE;
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
				return this.SUCCESS;
			}
			else {
				return this.ERROR;
			}
		} else {
			if(attendance1.getAttendanceState()!=0) {
				if(attendance1.getAttendanceOffTime()==null) {
					attendance.setAttendanceOffTime(time);
					if(attendanceservice.updateAttendance(attendance)!=null) {
						return this.SUCCESS;
					}
					else {
						return this.ERROR;
					}
				}
			}
		}
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
