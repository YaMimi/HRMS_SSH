package com.hrms.attendance.actions;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.attendance.services.AttendanceService;
import com.hrms.pojo.Attendance;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.fastinfoset.sax.Properties;

public class AttendanceAction extends ActionSupport {
	private String Date;
	private Attendance attendance;
	@Resource
	private AttendanceService attendanceservice;
	
	public String workerAttendanceSearch(){
		String hql = "from Attendance where attendanceWorkerOid = 1 order by attendanceDate desc";
		List<Attendance> attendancelist = attendanceservice.searchAttendance(hql);
		Map session = ActionContext.getContext().getSession();
		session.put("attendancelist", attendancelist);
		ActionContext.getContext().setSession(session);
		return SUCCESS;
		
	}
	
	public String workerAttendanceSearchByDate(){
		//System.out.println(Date);
		String hql = "from Attendance where attendanceWorkerOid = 1 and attendanceDate = '"+Date+"' order by attendanceDate desc";
		List<Attendance> attendancelistdate = attendanceservice.searchAttendance(hql);
		
		Map session = ActionContext.getContext().getSession();
		session.put("attendancelistdate", attendancelistdate);
		ActionContext.getContext().setSession(session);
		
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
	
}
