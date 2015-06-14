package com.hrms.department.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
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
	public Department insertDepartment(Department department) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(department);
		return department;
	}

	@Override
	public Department updateDepartment(Department department) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteDepartment(int DepartmentOid) {
		// TODO Auto-generated method stub
		  String hql="delete Department where DepartmentOid=?";
		  Query query=sessionFactory.getCurrentSession().createQuery(hql);
		  query.setInteger(0, DepartmentOid);
		  int result=query.executeUpdate();
		  return result;

		
	}

	@Override
	public List<Department> searchDepartmentOid(String hql) {
		// TODO Auto-generated method stub
		List<Department> departmentlist = sessionFactory.getCurrentSession().createQuery(hql).list();
		return departmentlist;
	}

	@Override
	public Department deleteDepartment(Department department) {
		// TODO Auto-generated method stub
		return null;
	}

}
