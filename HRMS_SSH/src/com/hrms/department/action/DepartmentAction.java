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
	private Department departmentEdit;
	private String alter;//定义check页面获取的修改部门信息的oid。
	private String delete;//定义check页面获取的删除部门信息的oid。
	private int FatherDepartmentOid;
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
	 * 新添部门时查询部门信息  2015.6.11
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
	 * 修改部门方法  2015.6.12
	 * 
	 * */
	public String departmentUpdate(){
		Department department1;
		int alter1=Integer.parseInt(alter);
		String DepartmentNo1=department.getDepartmentNo();
		String DepartmentName1=department.getDepartmentName();
		/*departmentservice.deleteDepartment(departmentEdit.getDepartmentOid());*/
		if(FatherDepartmentOid==0){
			if(DepartmentNo1!=null&&DepartmentName1!=null){
				if(departmentNoExist(DepartmentNo1)&&departmentNameExist(DepartmentName1)){
					String hql1 = "from Department where DepartmentOid='"+alter+"'";
					List<Department> departmentlist1=departmentservice.searchDepartment(hql1);
					department=departmentlist1.get(0);
					
					department.setDepartmentNo(DepartmentNo1);
					department.setDepartmentName(DepartmentName1);
					department=departmentservice.updateDepartment(department);	
					department=null;
					return this.SUCCESS;}
				else
					{
					
					return this.SUCCESS;
					}
			}
			else{ 
				
				return this.SUCCESS;
				}
			}
		else{
		
		String hql = "from Department where DepartmentOid='"+FatherDepartmentOid+"'";
		List<Department> departmentlist=departmentservice.searchDepartment(hql);
		Department department2=departmentlist.get(0);
		if(DepartmentNo1!=null&&DepartmentName1!=null){
			if(departmentNoExist(DepartmentNo1)&&departmentNameExist(DepartmentName1)){
				String hql1 = "from Department where DepartmentOid='"+alter+"'";
				List<Department> departmentlist1=departmentservice.searchDepartment(hql1);
				department=departmentlist1.get(0);
				department.setDepartmentNo(DepartmentNo1);
				department.setDepartmentName(DepartmentName1);
				department.setDepartment(department2);
				department=departmentservice.updateDepartment(department);
				department=null;
				return this.SUCCESS;}
			else
				{
				return this.SUCCESS;
				}
		}
		else{ 
			return this.SUCCESS;
			}
		}
		
	}
			/*
			 * 修改部门读取信息方法  2015.6.11
			 * 
			 * */
	public String UpdateDepartmentImfo(){
		int alter1=Integer.parseInt(alter);
		String hql = "from Department where DepartmentOid='"+alter+"'";
		List<Department> departmentlist=departmentservice.searchDepartment(hql);
		departmentEdit=departmentlist.get(0);
		Map session = ActionContext.getContext().getSession();
		session.put("departmentlist", departmentlist);
		ActionContext.getContext().setSession(session);
		
		
		String hql1= "from Department where DepartmentOid !='"+alter+"'";
		List<Department> departmentlist1 = departmentservice.searchDepartment(hql1);
		//Map session1 = ActionContext.getContext().getSession();
		session.put("departmentlist1", departmentlist1);
		ActionContext.getContext().setSession(session);
		
		
		return SUCCESS;
			
			
		}
		
		/*
		 * 添加新部门方法  2015.6.11-6.12 完善！
		 * 
		 * */
		public String DepartmentInsert(){
			Department department1;
			String DepartmentNo1=department.getDepartmentNo();
			String DepartmentName1=department.getDepartmentName();
			if(FatherDepartmentOid==0){
				
				if(DepartmentNo1!=null&&DepartmentName1!=null){
					if(departmentNoExist(DepartmentNo1)&&departmentNameExist(DepartmentName1)){
						department1=departmentservice.insertDepartment(department);
						department=null;
						return this.SUCCESS;}
					else
						{
						return this.INPUT;
						}
				}
				else{ 
					return this.INPUT;
					}
			}
			else{
			
			String hql = "from Department where DepartmentOid='"+FatherDepartmentOid+"'";
			List<Department> departmentlist=departmentservice.searchDepartment(hql);
			Department department2=departmentlist.get(0);
			department.setDepartment(department2);
			if(DepartmentNo1!=null&&DepartmentName1!=null){
				if(departmentNoExist(DepartmentNo1)&&departmentNameExist(DepartmentName1)){
					department1=departmentservice.insertDepartment(department);
					department=null;
					return this.SUCCESS;}
				else {
				return this.INPUT;}
			}
			else {
			return this.INPUT;}
			}
			
		}
		
		/*
		 * 删除部门信息方法  2015.6.11
		 * 
		 * */
		public String DepartmentDelete(){
			int delete1=Integer.parseInt(delete);
			departmentservice.deleteDepartment(delete1);
			return SUCCESS;
			
		}
		

		/*
		 * 检查部门编号是否存在  2015.6.11
		 * 
		 * */
		public boolean departmentNoExist(String departmentNo){
			Map session = ActionContext.getContext().getSession();
			boolean flag=false;
			String hql = "from Department where DepartmentNo='"+departmentNo+"'and DepartmentOid!='"+alter+"'";
				List<Department> departmentlist=departmentservice.searchDepartment(hql);
				if(departmentlist.size()==0){
					flag=true;
				}
				return flag;
		}
		

		/*
		 * 检查部门名称是否存在  2015.6.11
		 * 
		 * */
		public boolean departmentNameExist(String departmentName){
			Map session = ActionContext.getContext().getSession();
			boolean flag=false;
			String hql = "from Department where DepartmentName='"+departmentName+"'and DepartmentOid!='"+alter+"'";
				List<Department> departmentlist=departmentservice.searchDepartment(hql);
				if(departmentlist.size()==0){
					flag=true;
				}
				return flag;
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




	public int getFatherDepartmentOid() {
		return FatherDepartmentOid;
	}

	public void setFatherDepartmentOid(int fatherDepartmentOid) {
		FatherDepartmentOid = fatherDepartmentOid;
	}

	public Department getDepartmentEdit() {
		return departmentEdit;
	}

	public void setDepartmentEdit(Department departmentEdit) {
		this.departmentEdit = departmentEdit;
	}


	
}
