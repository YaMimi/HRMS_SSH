package com.hrms.department.dao;

import java.util.List;

import com.hrms.pojo.Department;

public interface DepartmentDao {

	public List<Department> searchDepartment(String hql);
	public Department insertAttendance(Department department);
	public Department updateAttendance(Department department);
	public void deleteAttendance(Department department);
}
