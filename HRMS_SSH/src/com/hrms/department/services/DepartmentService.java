package com.hrms.department.services;

import java.util.List;

import com.hrms.pojo.Department;

public interface DepartmentService {
    //��ѯ���ݿ�
	public List<Department> searchDepartment(String hql);
	//����oid��ѯ���ݿ�
	public List<Department> searchDepartmentOid(String hql);
	//��Ӳ�����Ϣ
	public Department insertDepartment(Department department);
	//�޸Ĳ�����Ϣ
	public Department updateDepartment(Department department);
	//ɾ������������Ϣ
	public Department deleteDepartment(Department department);
	//ɾ��������Ϣ
	public int deleteDepartment(int DepartmentOid);
}
