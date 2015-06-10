package com.hrms.department.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

import com.hrms.pojo.Attendance;
import com.hrms.pojo.Department;


public class DepartmentDaoImpl implements DepartmentDao{
	
	@Resource
	SessionFactory sessionFactory;
	
	@Override
	public List<Department> searchDepartment(String hql) {
		// TODO Auto-generated method stub
		List<Department> departmentlist = sessionFactory.getCurrentSession().createQuery(hql).list();
		return departmentlist;
	}

	@Override
	public Department insertAttendance(Department department) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Department updateAttendance(Department department) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAttendance(Department department) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Department> searchDepartmentOid(String hql) {
		// TODO Auto-generated method stub
		List<Department> departmentlist = sessionFactory.getCurrentSession().createQuery(hql).list();
		return departmentlist;
	}

}
