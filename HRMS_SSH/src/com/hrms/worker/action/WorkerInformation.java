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
	
	
	
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��10��
	 * ���ܣ����Ա����Ϣ
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
	 * ���ߣ�����Ժ
	 * ʱ�䣺2015��6��12��
	 * ���ܣ��������ݿ���Ա���������Զ�����Ա�����
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
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��10��
	 * ���ܣ���¼�ɹ�֮���ȡ��¼�˺ų�ʼ��Ա��������Ϣ
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
		//ʱ�����ݵ�ת��������ļ���
		try {
			workerentrydate=HrmsToolString.getSubString(listworker.get(0).getWorkerEntryDate().toString(), 10, "UTF-8");
			workerbirthdate=HrmsToolString.getSubString(listworker.get(0).getWorkerBirthDate().toString(), 10, "UTF-8");
			workerAge=HrmsToolString.getSubAge(listworker.get(0).getWorkerBirthDate().toString(), 4, "UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(listworker.get(0).getWorkerPermission()==0){
			workerPermission="Ա��";
		}else{
			workerPermission="����";
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
	
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��11��
	 * ���ܣ�������Ա����Ϣҳ������Ӧ�ĳ����ӻ�ȡȫ����Ϣ������ʾworkerShow.jspҳ��
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
		//ʱ�����ݵ�ת��������ļ���
		try {
			workerentrydate=HrmsToolString.getSubString(listworker.get(0).getWorkerEntryDate().toString(), 10, "UTF-8");
			workerbirthdate=HrmsToolString.getSubString(listworker.get(0).getWorkerBirthDate().toString(), 10, "UTF-8");
			workerAge=HrmsToolString.getSubAge(listworker.get(0).getWorkerBirthDate().toString(), 4, "UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(listworker.get(0).getWorkerPermission()==0){
			workerPermission="Ա��";
		}else{
			workerPermission="����";
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
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��11��
	 * ���ܣ���ѯ���ݿ������е�Ա����Ϣ
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
	
	/*���ߣ�����Ժ
	 * ʱ�䣺2015��6��11��
	 * ���ܣ�ѡ��Ҫɾ������Ա����Ϣ����ɾ��
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
	 * ���ܣ��޸ĵ�¼�ɹ�ʱ��Ա��Ϣ
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
			this.addFieldError("workerName", "�û�������Ϊ��");
		}
		if(worker.getPassword().length()==0||worker.getPassword().length()>12||worker.getPassword().length()<6){
			this.addFieldError("Password", "��������");
		}
		if(worker.getWorkerNo().length()<=0||worker.getWorkerNo().length()>10){
			this.addFieldError("WorkerNo", "Ա���������");
		}
		if(worker.getWorkerBirthPlace().length()==0){
			this.addFieldError("WorkerBirthPlace", "���᲻Ϊ��");
		}
		if(worker.getWorkerAddress().length()==0){
			this.addFieldError("WorkerAddress", "��ַ����Ϊ��");
		}
		if(worker.getWorkerBloodType().length()==0){
			this.addFieldError("WorkerBloodType", "Ѫ�Ͳ���Ϊ��");
		}
		if(worker.getWorkerEthnic().length()==0){
			this.addFieldError("WorkerEthnic()", "���岻��Ϊ��");
		}
		if(worker.getWorkerEducation().length()==0){
			this.addFieldError("WorkerEducation()", "��������Ϊ��");
		}
		if(worker.getWorkerPhone().length()==0){
			this.addFieldError("WorkerPhone", "�绰����Ϊ��");
		}
		if(worker.getWorkerNationality().length()==0){
			this.addFieldError("WorkerNationality", "��������Ϊ��");
		}
	}

	
	
	
}
