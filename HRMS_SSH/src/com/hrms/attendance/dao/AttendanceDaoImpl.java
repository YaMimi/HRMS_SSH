package com.hrms.attendance.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

import com.hrms.pojo.Attendance;

public class AttendanceDaoImpl implements AttendanceDao {
	
	@Resource
	SessionFactory sessionFactory;
	
	@Override
	public List<Attendance> searchAttendance(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Attendance insertAttendance(Attendance attendance) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Attendance updateAttendance(Attendance attendance) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAttendance(Attendance attendance) {
		// TODO Auto-generated method stub

	}

}
