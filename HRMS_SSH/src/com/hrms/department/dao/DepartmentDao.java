package com.hrms.department.dao;

import java.util.List;

import com.hrms.pojo.Department;

public interface DepartmentDao {

	public List<Department> searchDepartment(String hql);
	public List<Department> searchDepartmentOid(String hql);
	public Department insertDepartment(Department department);
	public Department updateDepartment(Department department);
	public void deleteDepartment(Department department);
}
