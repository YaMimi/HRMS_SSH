package com.hrms.department.services;

import java.util.List;

import javax.annotation.Resource;

import com.hrms.pojo.Department;

public class DepartmentServiceImpl implements DepartmentService{

	
	@Resource
	Department departmentdao;
	@Override
	public List<Department> searchDepartment(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Department insertDepartment(Department department) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Department updateDepartment(Department department) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteDepartment(Department department) {
		// TODO Auto-generated method stub
		
	}

}