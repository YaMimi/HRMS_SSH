package com.hrms.department.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import com.hrms.department.services.DepartmentService;
import com.hrms.pojo.Attendance;
import com.hrms.pojo.Department;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DepartmentAction extends ActionSupport{

	private Department department;
	private String alter;//����checkҳ���ȡ��oid������
	@Resource
	private DepartmentService departmentservice;
	
	public String DepartmentSearch(){
		String hql = "from Department ";
		List<Department> departmentlist = departmentservice.searchDepartment(hql);
		Map session = ActionContext.getContext().getSession();
		session.put("departmentlist", departmentlist);
		ActionContext.getContext().setSession(session);
		return SUCCESS;
		
	}
	
	
	/*
	 * �޸Ĳ�����Ϣ����  2015.6.10
	 * 
	 * */
		public String UpdateDepartmentImfo(){
			int alter1=Integer.parseInt(alter);
			String hql = "from Department where DepartmentOid='"+alter+"'";
			List<Department> departmentlist=departmentservice.searchDepartment(hql);
				Map session = ActionContext.getContext().getSession();
				session.put("departmentlist", departmentlist);
				ActionContext.getContext().setSession(session);
			System.out.println(alter+"nihao");
				return SUCCESS;
			}
		
		

	public String getAlter() {
			return alter;
		}


		public void setAlter(String alter) {
			this.alter = alter;
		}


	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public DepartmentService getDepartmentservice() {
		return departmentservice;
	}

	public void setDepartmentservice(DepartmentService departmentservice) {
		this.departmentservice = departmentservice;
	}
	
}
