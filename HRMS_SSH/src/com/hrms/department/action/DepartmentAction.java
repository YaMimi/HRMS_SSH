package com.hrms.department.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;

import com.hrms.department.services.DepartmentService;
import com.hrms.pojo.Attendance;
import com.hrms.pojo.Department;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DepartmentAction extends ActionSupport{

	private Department department;
	private String alter;//����checkҳ���ȡ���޸Ĳ�����Ϣ��oid��
	private String delete;//����checkҳ���ȡ��ɾ��������Ϣ��oid��
	private String FatherDepartmentNo;
	private String FatherDepartmentName;
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
	 * ������ʱ��ѯ������Ϣ  2015.6.11
	 * 
	 * */
	public String allDepartmentSearch(){
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
			//System.out.println(alter+"nihao");
				return SUCCESS;
			}
		

		/*
		 * ����²��ŷ���  2015.6.11
		 * 
		 * */
		public String DepartmentInsert(){
			Department department1;
			
			//department.setDepartment(department1);
			department1=departmentservice.insertDepartment(department);
			if(department1.getDepartmentNo()!=null&&department1.getDepartmentName()!=null){
					return this.SUCCESS;
			}
			else return this.INPUT;
			
		}
		
		
		
		/*
		 * ɾ��������Ϣ����  2015.6.11
		 * 
		 * */
		public String DepartmentDelete(){
			int delete1=Integer.parseInt(delete);
			departmentservice.deleteDepartment(delete1);
			return SUCCESS;
			
		}
		

		/*
		 * ��鲿�ű���Ƿ����  2015.6.11
		 * 
		 * */
		public boolean DepartmentNoExist(String departmentNo){
			Map session = ActionContext.getContext().getSession();
			boolean flag=true;
			String hql = "from Department where DepartmentNo='"+departmentNo+"'";
			try{
				List<Department> departmentlist=departmentservice.searchDepartment(hql);
				if(departmentlist.size()==0){
					flag=false;
				}
				return flag;
			}catch(RuntimeException re){
				throw re;
			}
		}
		
		
		/*
		 * ��鲿�������Ƿ����  2015.6.11
		 * 
		 * */
		public boolean DepartmentNameExist(String departmentName){
			Map session = ActionContext.getContext().getSession();
			boolean flag=true;
			String hql = "from Department where DepartmentNo='"+departmentName+"'";
			try{
				List<Department> departmentlist=departmentservice.searchDepartment(hql);
				if(departmentlist.size()==0){
					flag=false;
				}
				return flag;
			}catch(RuntimeException re){
				throw re;
			}
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


	public String getFatherDepartmentNo() {
		return FatherDepartmentNo;
	}


	public void setFatherDepartmentNo(String fatherDepartmentNo) {
		FatherDepartmentNo = fatherDepartmentNo;
	}


	public String getFatherDepartmentName() {
		return FatherDepartmentName;
	}


	public void setFatherDepartmentName(String fatherDepartmentName) {
		FatherDepartmentName = fatherDepartmentName;
	}



	
}
