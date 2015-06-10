package com.hrms.department.services;

import java.util.List;

import com.hrms.pojo.Department;

public interface DepartmentService {
    //查询数据库
	public List<Department> searchDepartment(String hql);
	//根据oid查询数据库
	public List<Department> searchDepartmentOid(String hql);
	//添加部门信息
	public Department insertDepartment(Department department);
	//修改部门信息
	public Department updateDepartment(Department department);
	//删除部门信息
	public void deleteDepartment(Department department);
}
