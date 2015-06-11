package com.hrms.attendance.dao;

import java.text.SimpleDateFormat;
import java.util.Iterator;
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
		List<Attendance> attendancelist = sessionFactory.getCurrentSession().createQuery(hql).list();
		return attendancelist;
	}
	
	@Override
	public Attendance searchAttendance(Attendance attendance) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String query = "select a.attendanceOid from Attendance a where a.attendanceDate='" +sdf.format(attendance.getAttendanceDate())+ "' and a.worker.workerNo='"+attendance.getWorker().getWorkerNo()+"'";
		List list = sessionFactory.getCurrentSession().createQuery(query).list();

		if(!list.isEmpty()) {
            Iterator it = list.iterator();  
            while(it.hasNext()) {
                Integer get = (Integer) it.next();
                attendance = (Attendance) sessionFactory.getCurrentSession().get(Attendance.class, get);
                return attendance;
            }
		}
		return null;
	}

	@Override
	public Attendance insertAttendance(Attendance attendance) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(attendance);
		return attendance;
	}

	@Override
	public Attendance updateAttendance(Attendance attendance) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().merge(attendance);
		return attendance;
	}

	@Override
	public void deleteAttendance(Attendance attendance) {
		// TODO Auto-generated method stub

	}

}
