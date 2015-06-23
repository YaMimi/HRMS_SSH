package com.hrms.worker.action;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hrms.pojo.Department;
import com.hrms.pojo.Worker;
import com.hrms.worker.services.WorkerAddInformationService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class WorkerInforAction extends ActionSupport {

	private Worker worker;
	private Department department;
	private String worker_no;
	private String workerOid;
	private String password1;
	private String password2;
	
	@Resource
	private WorkerAddInformationService workerAddInformationService;
	
	
	
	/*编者：徐新院
	 * 时间：2015年6月16日
	 * 功能：修改员工密码
	 * */
	public String updatePassword(){
		int result=0;
		int workeroid=Integer.parseInt(workerOid);
		String sql = "from Worker where WorkerOid='" +1+ "'";
		ArrayList<Worker> listworker=workerAddInformationService.SelectCurrentWorkers(sql);
		if(worker.getPassword().equals(listworker.get(0).getPassword())){
			result=workerAddInformationService.updateWorkerPassword(worker,password1,workeroid);
		}else{
			ActionContext.getContext().getSession().put("oldPassword","不相等");
		}
	 if(result!=0){
		 ActionContext.getContext().getSession().put("successPassword","修改成功");
	 }
			 
	
		
		return SUCCESS;
		
	}
	
	
	/*编者：徐新院
	 * 时间：2015年6月10日
	 * 功能：在workerAdd.jsp页面点击添加按钮进行信息的添加
	 * success
	 * */
	public String addInformation(){
		int  departmenInteger = 0;
	     Worker worker_1;
   String hqlDepart="FROM Department";
ArrayList<Department> department1=workerAddInformationService.SelectAllDepartmen(hqlDepart);
		
Department department2 = null;
for(int i=0;i<department1.size();i++){
	if(department1.get(i).getDepartmentName().equals(department.getDepartmentName())){
		department2 = department1.get(i);	
	}
}

		worker.setDepartment(department2);
		worker_1=workerAddInformationService.SaveWorkers(worker);
		if(worker_1!=null){
			ActionContext.getContext().getSession().put("successAdd","添加成功");
			return "success";
		}
		return "error";

	}
	
	
	/*
	 * 编者：徐新院
	 * 时间：2015年6月12日
	 * 功能：根据数据库中员工的数量自动生成员工编号,并且显示添加员工信息页面workerAdd.jsp
	 * success
	 * */
	public String InitWorkerAdd(){
		String sql="from Worker";
		ArrayList<Worker> workers=workerAddInformationService.SelectAllWorkers(sql);
		int num=workers.size();
		int WorkerAdmiNo=Integer.parseInt(HrmsToolString.randomAccount(num+1));
		for(int i=0;i<workers.size();i++){
			if(workers.get(i).getWorkerNo().equals(""+WorkerAdmiNo)){
				WorkerAdmiNo=WorkerAdmiNo+1;
			}
			
		}
		ActionContext.getContext().getSession().put("WorkerAdmiNo",WorkerAdmiNo);
		String hqlDepart="FROM Department";
		ArrayList<Department> department=workerAddInformationService.SelectAllDepartmen(hqlDepart);
		ActionContext.getContext().getSession().put("department1", department);
		return "success";
	}
	
	/*编者：徐新院
	 * 时间：2015年6月10日
	 * 功能：登录成功之后获取登录账号初始化员工界面信息
	 * success
	 * */
	public String InitnInformation(){
		int workerAge=0;
		Worker activeWorker = (Worker)ActionContext.getContext().getSession().get("activeWorker");
		String sql = "from Worker w where w.workerNo='" +activeWorker.getWorkerNo()+ "'";
		ArrayList<Worker> listworker=workerAddInformationService.SelectCurrentWorkers(sql);
		try {
			workerAge=HrmsToolString.getSubAge(listworker.get(0).getWorkerBirthDate().toString(), 4, "UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ActionContext.getContext().getSession().put("workerAge",workerAge);
	return "success";
		
	}
	
	
	/*编者：徐新院
	 * 时间：2015年6月11日
	 * 功能：在workerManager.jsp页面点击管理按钮之后显示对应员工的信息修改删除页面
	 * success
	 * */
	
	public String ShowWorkerformation(){
		String workerDepartment=null,workerPermission=null;
		int workerAge=0;
		HttpServletRequest request = ServletActionContext.getRequest();
		Map session = ActionContext.getContext().getSession();
	String sql = "from Worker w where w.workerNo='" +request.getParameter("workerNo")+ "'";
		//System.out.println(request.getParameter("workerNo"));
		ArrayList<Worker> listworker=workerAddInformationService.SelectCurrentWorkers(sql);
		String hqlDepart="FROM Department";
		 ArrayList<Department> department1=workerAddInformationService.SelectAllDepartmen(hqlDepart);
			try {
				workerAge=HrmsToolString.getSubAge(listworker.get(0).getWorkerBirthDate().toString(), 4, "UTF-8");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(listworker.get(0).getWorkerPermission()==1){
				workerPermission="普通员工";
			}else if(listworker.get(0).getWorkerPermission()==2){
				workerPermission="组长";
			}else if(listworker.get(0).getWorkerPermission()==3){
				workerPermission="部门经理";
			}else{
				workerPermission="总经理";
			}
		session.put("listworker", listworker);
		ActionContext.getContext().setSession(session);
		 ActionContext.getContext().getSession().put("department",department1);
		 ActionContext.getContext().getSession().put("workerAge",workerAge);
		 ActionContext.getContext().getSession().put("workerPermission",workerPermission);
		 ActionContext.getContext().getSession().put("workerSex",listworker.get(0).getWorkerSex());
		return "success";
		
		
	}
	
	/*编者：徐新院
	 * 时间：2015年6月11日
	 * 功能：查询数据库中所有的员工信息，可以进行分页显示workerManager.jsp
	 * success
	 * */
	public String SelectAllWorkers(){
		String sql="from Worker";
		HttpServletRequest request = ServletActionContext.getRequest();
		int  pageNo;
		if(request.getParameter("pageNo")==null){
			pageNo=1;
		}else{
			pageNo=Integer.parseInt(request.getParameter("pageNo"));
		}
		Worker activeWorker = (Worker)ActionContext.getContext().getSession().get("activeWorker");
	    ArrayList<Worker>workers=workerAddInformationService.EveryPage(sql,pageNo, 5);	
	    ActionContext.getContext().getSession().put("workers", workers);
		ArrayList workerDerpart=workerAddInformationService.lWorkersAddDepartment();
		ActionContext.getContext().getSession().put("workerDerpart", workerDerpart);
		return "success";
	}
	
	/*编者：徐新院
	 * 时间：2015年6月13日
	 * 功能：在workerManager.jsp页面进行精确查询
	 * success
	 * */
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
	 * success
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
	 * 功能：修改员工信息
	 * success
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
		//InitnInformation();
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


	public String getPassword1() {
		return password1;
	}


	public void setPassword1(String password1) {
		this.password1 = password1;
	}


	public String getPassword2() {
		return password2;
	}


	public void setPassword2(String password2) {
		this.password2 = password2;
	}


	

	
	
	
}
