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
	private String alter;//定义check页面获取的修改部门信息的oid。
	private String delete;//定义check页面获取的删除部门信息的oid。
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
	 * 修改部门信息方法  2015.6.10
	 * 
	 * */
		public String UpdateDepartmentImfo(){
			int alter1=Integer.parseInt(alter);
			String hql = "from Department where DepartmentOid='"+alter+"'";
			List<Department> departmentlist=departmentservice.searchDepartment(hql);
				Map session = ActionContext.getContext().getSession();
				session.put("departmentlist", departmentlist);
				ActionContext.getContext().setSession(session);
			//System.out.println(alter+"nihao");
				return SUCCESS;
			}
		
		/*
		 * 添加新部门方法  2015.6.10
		 * 
		 * */
		public String DepartmentInsert(){

			Department department1;
			department1=departmentservice.insertDepartment(department);
			if(department1.getDepartmentNo()!=null&&department1.getDepartmentName()!=null){
				System.out.println(department1.getDepartmentNo()+"aa");
				System.out.println(department1.getDepartmentName()+"aaname");
				System.out.println(department1.getDepartment().getDepartmentNo()+"fatherno");
				System.out.println(department1.getDepartment().getDepartmentName()+"fathername");
				return this.SUCCESS;
			}
			else return this.INPUT;
			
		}
		/*
		 * 删除部门信息方法  2015.6.10（未完成）
		 * 
		 * */
		public String DepartmentDelete(){
			int delete1=Integer.parseInt(delete);
			String hql = "from Department where DepartmentOid='"+delete+"'";
//			List<Department> departmentlist = departmentservice.searchDepartment(hql);
//			Map session = ActionContext.getContext().getSession();
//			session.put("departmentlist", departmentlist);
//			ActionContext.getContext().setSession(session);
			return SUCCESS;
			
		}
		
		

	public String getAlter() {
			return alter;
		}


	public void setAlter(String alter) {
			this.alter = alter;
		}

	public String getDelete() {
		return delete;
	}


	public void setDelete(String delete) {
		this.delete = delete;
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
