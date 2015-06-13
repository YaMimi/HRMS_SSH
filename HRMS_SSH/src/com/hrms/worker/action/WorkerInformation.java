package com.hrms.worker.action;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hrms.pojo.Department;
import com.hrms.pojo.Worker;
import com.hrms.worker.services.WorkerAddInformationService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class WorkerInformation extends ActionSupport {

	private Worker worker;
	private Department department;
	private String worker_no;
	private String workerOid;
	@Resource
	private WorkerAddInformationService workerAddInformationService;
	
	
	
	
	/*编者：徐新院
	 * 时间：2015年6月10日
	 * 功能：添加员工信息
	 * 
	 * */
	//Worker worker = (Worker) ActionContext.getContext().getSession().get("activeWorker");
	public String addInformation(){
		int  departmenInteger = 0;
	     Worker worker_1;
   String hqlDepart="FROM Department";
ArrayList<Department> department1=workerAddInformationService.SelectAllDepartmen(hqlDepart);
		

for(int i=0;i<department1.size();i++){
	if(department1.get(i).getDepartmentName().equals(department.getDepartmentName())){
		departmenInteger=department1.get(i).getDepartmentOid();
	}
}
department.setDepartmentOid(departmenInteger);
		worker.setDepartment(department);
		worker_1=workerAddInformationService.SaveWorkers(worker);
		if(worker_1==null){
			return "error";
		}
		return "success";
 
	}
	
	
	/*
	 * 编者：徐新院
	 * 时间：2015年6月12日
	 * 功能：根据数据库中员工的数量自动生成员工编号
	 * 
	 * */
	public String InitWorkerAdd(){
		String sql="from Worker";
		ArrayList<Worker> workers=workerAddInformationService.SelectAllWorkers(sql);
		int num=workers.size();
		String WorkerAdmiNo=HrmsToolString.randomAccount(num+1);
		ActionContext.getContext().getSession().put("WorkerAdmiNo",WorkerAdmiNo);
		return "success";
	}
	
	/*编者：徐新院
	 * 时间：2015年6月10日
	 * 功能：登录成功之后获取登录账号初始化员工界面信息
	 * 
	 * */
	public String InitnInformation(){
		int workerAge=0;
		String workerentrydate = null,workerbirthdate=null,workerPermission=null;
		String sql = "from Worker w where w.workerNo='" +ActionContext.getContext().getSession().get("workerNo")+ "'";
		ArrayList<Worker> listworker=workerAddInformationService.SelectCurrentWorkers(sql);
		if(listworker.size()==0){
			listworker=null;
		}
		if(ActionContext.getContext().getSession().containsKey("listworker")){
			ActionContext.getContext().getSession().remove("listworker");
		}
		//时间数据的转化和年龄的计算
		try {
			workerentrydate=HrmsToolString.getSubString(listworker.get(0).getWorkerEntryDate().toString(), 10, "UTF-8");
			workerbirthdate=HrmsToolString.getSubString(listworker.get(0).getWorkerBirthDate().toString(), 10, "UTF-8");
			workerAge=HrmsToolString.getSubAge(listworker.get(0).getWorkerBirthDate().toString(), 4, "UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(listworker.get(0).getWorkerPermission()==0){
			workerPermission="员工";
		}else{
			workerPermission="经理";
		}
		ActionContext.getContext().getSession().put("workername", listworker.get(0).getWorkerName());
		ActionContext.getContext().getSession().put("workerNo", listworker.get(0).getWorkerNo());
		ActionContext.getContext().getSession().put("workerSex",listworker.get(0).getWorkerSex());
		ActionContext.getContext().getSession().put("workerAge",workerAge);
		ActionContext.getContext().getSession().put("workerPermission",workerPermission);
		ActionContext.getContext().getSession().put("workerEntryDate",workerentrydate);
		ActionContext.getContext().getSession().put("workerId",listworker.get(0).getWorkerId());
		ActionContext.getContext().getSession().put("workerBirthDate",workerbirthdate);
		ActionContext.getContext().getSession().put("workerBirthPlace",listworker.get(0).getWorkerBirthPlace());
		ActionContext.getContext().getSession().put("workerAddress",listworker.get(0).getWorkerAddress());
		ActionContext.getContext().getSession().put("workerBloodType",listworker.get(0).getWorkerBloodType());
		ActionContext.getContext().getSession().put("workerPolitical",listworker.get(0).getWorkerPolitical());
		ActionContext.getContext().getSession().put("workerNationality",listworker.get(0).getWorkerNationality());
		ActionContext.getContext().getSession().put("workerEthnic",listworker.get(0).getWorkerEthnic());
		ActionContext.getContext().getSession().put("workerEducation",listworker.get(0).getWorkerEducation());
		ActionContext.getContext().getSession().put("workerPhone",listworker.get(0).getWorkerPhone());
		ActionContext.getContext().getSession().put("password",listworker.get(0).getPassword());
		ActionContext.getContext().getSession().put("workeroid",listworker.get(0).getWorkerOid());
		
		return "success";
		
	}
	
	
	/*编者：徐新院
	 * 时间：2015年6月11日
	 * 功能：在所有员工信息页面点击相应的超链接获取全部信息并且显示workerShow.jsp页面
	 * */
	public String ShowWorkerformation(){
		int workerAge=0;
		String workerentrydate = null,workerbirthdate=null,workerPermission=null,workerDepartment=null;
		HttpServletRequest request = ServletActionContext.getRequest();
		 String hqlDepart="FROM Department";
		 ArrayList<Department> department1=workerAddInformationService.SelectAllDepartmen(hqlDepart);
		 		
		String sql = "from Worker w where w.workerNo='" +request.getParameter("workerNo")+ "'";
		ArrayList<Worker> listworker=workerAddInformationService.SelectCurrentWorkers(sql);
		if(listworker.size()==0){
			listworker=null;
		}
		if(ActionContext.getContext().getSession().containsKey("listworker")){
			ActionContext.getContext().getSession().remove("listworker");
		}
		//时间数据的转化和年龄的计算
		try {
			workerentrydate=HrmsToolString.getSubString(listworker.get(0).getWorkerEntryDate().toString(), 10, "UTF-8");
			workerbirthdate=HrmsToolString.getSubString(listworker.get(0).getWorkerBirthDate().toString(), 10, "UTF-8");
			workerAge=HrmsToolString.getSubAge(listworker.get(0).getWorkerBirthDate().toString(), 4, "UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(listworker.get(0).getWorkerPermission()==0){
			workerPermission="员工";
		}else{
			workerPermission="经理";
		}
		int deNo0=Integer.parseInt(listworker.get(0).getDepartment().getDepartmentOid().toString());
		
		for(int i=0;i<department1.size();i++){
			int deNo=Integer.parseInt(department1.get(i).getDepartmentOid().toString());
			if(deNo==deNo0){
				workerDepartment=department1.get(i).getDepartmentName();
			}
		}
			
	
		
		
		ActionContext.getContext().getSession().put("workername", listworker.get(0).getWorkerName());
		ActionContext.getContext().getSession().put("workerNo", listworker.get(0).getWorkerNo());
		ActionContext.getContext().getSession().put("workerSex",listworker.get(0).getWorkerSex());
		ActionContext.getContext().getSession().put("workerAge",workerAge);
		ActionContext.getContext().getSession().put("workerPermission",workerPermission);
		ActionContext.getContext().getSession().put("workerEntryDate",workerentrydate);
		ActionContext.getContext().getSession().put("workerId",listworker.get(0).getWorkerId());
		ActionContext.getContext().getSession().put("workerBirthDate",workerbirthdate);
		ActionContext.getContext().getSession().put("workerBirthPlace",listworker.get(0).getWorkerBirthPlace());
		ActionContext.getContext().getSession().put("workerAddress",listworker.get(0).getWorkerAddress());
		ActionContext.getContext().getSession().put("workerBloodType",listworker.get(0).getWorkerBloodType());
		ActionContext.getContext().getSession().put("workerPolitical",listworker.get(0).getWorkerPolitical());
		ActionContext.getContext().getSession().put("workerNationality",listworker.get(0).getWorkerNationality());
		ActionContext.getContext().getSession().put("workerEthnic",listworker.get(0).getWorkerEthnic());
		ActionContext.getContext().getSession().put("workerEducation",listworker.get(0).getWorkerEducation());
		ActionContext.getContext().getSession().put("workerPhone",listworker.get(0).getWorkerPhone());
		ActionContext.getContext().getSession().put("password",listworker.get(0).getPassword());
		ActionContext.getContext().getSession().put("workeroid",listworker.get(0).getWorkerOid());
        ActionContext.getContext().getSession().put("workerDepartment",workerDepartment);
		
		return "success";
		
	}
	
	/*编者：徐新院
	 * 时间：2015年6月11日
	 * 功能：查询数据库中所有的员工信息
	 * */
	public String SelectAllWorkers(){
		String sql="from Worker";
		ArrayList<Worker>workers=workerAddInformationService.SelectAllWorkers(sql);
		ActionContext.getContext().getSession().put("workers", workers);
		ArrayList workerDerpart=workerAddInformationService.lWorkersAddDepartment();
		ActionContext.getContext().getSession().put("workerDerpart", workerDerpart);
	
		return "success";
	}
	
	public String ResearchWorker(){
		String sql="from Worker w where w.workerNo='"+worker_no+"'";
		ArrayList<Worker>workers=workerAddInformationService.SelectAllWorkers(sql);
		ActionContext.getContext().getSession().put("workers", workers);
		ArrayList workerDerpart=workerAddInformationService.lWorkersAddDepartment();
		ActionContext.getContext().getSession().put("workerDerpart", workerDerpart);
	
		return "success";
	}
	
	/*编者：徐新院
	 * 时间：2015年6月11日
	 * 功能：选择要删除的人员的信息进行删除
	 * */
	public String DeleteWorkerInformation(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String workerNo=request.getParameter("workerNo");
		int result=workerAddInformationService.DeleteWorker(workerNo);
		if(result>0)
			SelectAllWorkers();
		return "success";
		
	}
	
	/*编者：徐新院
	 * 时间：2015年6月11日
	 * 功能：修改登录成功时人员信息
	 * */
	public String UpdateInformation(){
		 int departmenInteger=0;
		 
		 String hqlDepart="FROM Department";
		 ArrayList<Department> department1=workerAddInformationService.SelectAllDepartmen(hqlDepart);
		 		

		 for(int i=0;i<department1.size();i++){
		 	if(department1.get(i).getDepartmentName().equals(department.getDepartmentName())){
		 		departmenInteger=department1.get(i).getDepartmentOid();
		 	}
		 }
		 
		department.setDepartmentOid(departmenInteger);
		worker.setDepartment(department);
		int workerOID=Integer.parseInt(workerOid);
		worker.setWorkerOid(workerOID);
		workerAddInformationService.UpdateWorker(worker);
		workerAddInformationService.flush();
		InitnInformation();
			return "success";
			
		}
	
	
	
	

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}


	public Worker getWorker() {
		return worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}


	public String getWorker_no() {
		return worker_no;
	}

	public void setWorker_no(String worker_no) {
		this.worker_no = worker_no;
	}

	public WorkerAddInformationService getWorkerAddInformationService() {
		return workerAddInformationService;
	}


	public void setWorkerAddInformationService(
			WorkerAddInformationService workerAddInformationService) {
		this.workerAddInformationService = workerAddInformationService;
	}

	public String getWorkerOid() {
		return workerOid;
	}

	public void setWorkerOid(String workerOid) {
		this.workerOid = workerOid;
	}

	public void validateAddInformation() {
		if(worker.getWorkerName().length()==0){
			this.addFieldError("workerName", "用户名不能为空");
		}
		if(worker.getPassword().length()==0||worker.getPassword().length()>12||worker.getPassword().length()<6){
			this.addFieldError("Password", "密码有误");
		}
		if(worker.getWorkerNo().length()<=0||worker.getWorkerNo().length()>10){
			this.addFieldError("WorkerNo", "员工编号有误");
		}
		if(worker.getWorkerBirthPlace().length()==0){
			this.addFieldError("WorkerBirthPlace", "籍贯不为空");
		}
		if(worker.getWorkerAddress().length()==0){
			this.addFieldError("WorkerAddress", "地址不能为空");
		}
		if(worker.getWorkerBloodType().length()==0){
			this.addFieldError("WorkerBloodType", "血型不能为空");
		}
		if(worker.getWorkerEthnic().length()==0){
			this.addFieldError("WorkerEthnic()", "名族不能为空");
		}
		if(worker.getWorkerEducation().length()==0){
			this.addFieldError("WorkerEducation()", "教育不能为空");
		}
		if(worker.getWorkerPhone().length()==0){
			this.addFieldError("WorkerPhone", "电话不能为空");
		}
		if(worker.getWorkerNationality().length()==0){
			this.addFieldError("WorkerNationality", "国籍不能为空");
		}
	}

	
	
	
}
