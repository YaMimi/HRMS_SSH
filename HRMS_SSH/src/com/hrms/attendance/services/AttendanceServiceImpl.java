package com.hrms.attendance.services;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.attendance.dao.AttendanceDao;
import com.hrms.pojo.Attendance;
@Transactional
public class AttendanceServiceImpl implements AttendanceService {
	
	@Resource
	AttendanceDao attendancedao;
	
	@Override
	public List<Attendance> searchAttendance(String hql) {
		// TODO Auto-generated method stub
		return attendancedao.searchAttendance(hql);
	}
	
	@Override
	public Attendance searchAttendance(Attendance attendance) {
		// TODO Auto-generated method stub
		return attendancedao.searchAttendance(attendance);
	}

	@Override
	public Attendance insertAttendance(Attendance attendance) {
		// TODO Auto-generated method stub
		return attendancedao.insertAttendance(attendance);
	}

	@Override
	public Attendance updateAttendance(Attendance attendance) {
		// TODO Auto-generated method stub
		return attendancedao.updateAttendance(attendance);
	}

	@Override
	public void deleteAttendance(Attendance attendance) {
		// TODO Auto-generated method stub

	}

}
