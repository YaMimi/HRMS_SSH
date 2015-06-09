package com.hrms.attendance.actions;

import java.util.List;

import javax.annotation.Resource;

import com.hrms.attendance.services.AttendanceService;
import com.hrms.pojo.Attendance;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.fastinfoset.sax.Properties;

public class AttendanceAction extends ActionSupport {
	private Attendance attendance;
	@Resource
	private AttendanceService attendanceservice;
	
	public String workerAttendanceSearch(){
		String hql = "from Attendance where AttendanceOid = 1 order by AttendanceDate dec";
		List<Attendance> attendancelist = attendanceservice.searchAttendance(hql);
		
		
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
