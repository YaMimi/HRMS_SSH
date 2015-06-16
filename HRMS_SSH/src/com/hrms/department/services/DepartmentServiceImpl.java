package com.hrms.department.services;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.department.dao.DepartmentDao;
import com.hrms.pojo.Department;
@Transactional
public class DepartmentServiceImpl implements DepartmentService{

	
	@Resource
	DepartmentDao departmentdao;
	@Override
	public List<Department> searchDepartment(String hql) {
		// TODO Auto-generated method stub
		return departmentdao.searchDepartment(hql);
	}

	@Override
	public Department insertDepartment(Department department) {
		// TODO Auto-generated method stub
		return departmentdao.insertDepartment(department);
	}

	@Override
	public Department updateDepartment(Department department) {
		// TODO Auto-generated method stub
		return departmentdao.updateDepartment(department);
	}

	@Override
	public int deleteDepartment(int DepartmentOid) {
		// TODO Auto-generated method stub
		return departmentdao.deleteDepartment(DepartmentOid);
	}

	@Override
	public List<Department> searchDepartmentOid(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Department deleteDepartment(Department department) {
		// TODO Auto-generated method stub
		return null;
	}

}
