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
	
	
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��16��
	 * ���ܣ��޸�Ա������
	 * */
	public String updatePassword(){
		int result=0;
		int workeroid=Integer.parseInt(workerOid);
		String sql = "from Worker where WorkerOid='" +1+ "'";
		ArrayList<Worker> listworker=workerAddInformationService.SelectCurrentWorkers(sql);
		if(worker.getPassword().equals(listworker.get(0).getPassword())){
			result=workerAddInformationService.updateWorkerPassword(worker,password1,workeroid);
		}else{
			ActionContext.getContext().getSession().put("oldPassword","�����");
		}
	 if(result!=0){
		 ActionContext.getContext().getSession().put("successPassword","�޸ĳɹ�");
	 }
			 
	
		
		return SUCCESS;
		
	}
	
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��10��
	 * ���ܣ���workerAdd.jspҳ������Ӱ�ť������Ϣ�����
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
			ActionContext.getContext().getSession().put("successAdd","��ӳɹ�");
			return "success";
		}
		return "error";

	}
	
	
	/*
	 * ���ߣ�����Ժ
	 * ʱ�䣺2015��6��12��
	 * ���ܣ��������ݿ���Ա���������Զ�����Ա�����,������ʾ���Ա����Ϣҳ��workerAdd.jsp
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
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��10��
	 * ���ܣ���¼�ɹ�֮���ȡ��¼�˺ų�ʼ��Ա��������Ϣ
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
	
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��11��
	 * ���ܣ���workerManager.jspҳ��������ť֮����ʾ��ӦԱ������Ϣ�޸�ɾ��ҳ��
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
				workerPermission="��ͨԱ��";
			}else if(listworker.get(0).getWorkerPermission()==2){
				workerPermission="�鳤";
			}else if(listworker.get(0).getWorkerPermission()==3){
				workerPermission="���ž���";
			}else{
				workerPermission="�ܾ���";
			}
		session.put("listworker", listworker);
		ActionContext.getContext().setSession(session);
		 ActionContext.getContext().getSession().put("department",department1);
		 ActionContext.getContext().getSession().put("workerAge",workerAge);
		 ActionContext.getContext().getSession().put("workerPermission",workerPermission);
		 ActionContext.getContext().getSession().put("workerSex",listworker.get(0).getWorkerSex());
		return "success";
		
		
	}
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��11��
	 * ���ܣ���ѯ���ݿ������е�Ա����Ϣ�����Խ��з�ҳ��ʾworkerManager.jsp
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
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��13��
	 * ���ܣ���workerManager.jspҳ����о�ȷ��ѯ
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
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��11��
	 * ���ܣ�ѡ��Ҫɾ������Ա����Ϣ����ɾ��
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
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��11��
	 * ���ܣ��޸�Ա����Ϣ
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
