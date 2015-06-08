package com.hrms.attendance.services;

import java.util.List;

import com.hrms.pojo.Attendance;

public interface AttendanceService {
	public List<Attendance> searchAttendance(String hql);
	public Attendance insertAttendance(Attendance attendance);
	public Attendance updateAttendance(Attendance attendance);
	public void deleteAttendance(Attendance attendance);
}
