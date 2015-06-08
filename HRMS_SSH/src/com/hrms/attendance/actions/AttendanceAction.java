package com.hrms.attendance.actions;

import javax.annotation.Resource;

import com.hrms.attendance.services.AttendanceService;
import com.hrms.pojo.Attendance;
import com.opensymphony.xwork2.ActionSupport;

public class AttendanceAction extends ActionSupport {
	private Attendance attendance;
	@Resource
	private AttendanceService attendanceservice;
	
	public String workerAttendanceSearch(){
		String hql = "from Attendance where AttendanceOid = 1 order by AttendanceDate dec";
		attendanceservice.searchAttendance(hql);
		
		return null;
		
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
