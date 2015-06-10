package com.hrms.attendance.actions;
/**
 * �ࣺ���Action
 * ���ߣ������� 
 * ����ʱ�䣺2015-6-10
 */
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.attendance.services.VacationService;
import com.hrms.pojo.Vacation;
import com.hrms.pojo.Worker;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class VacationAction extends ActionSupport {
	private Vacation vacation;
	@Resource
	private VacationService vacationservice;
	
	/**
	 * ������������빦��
	 * ���ߣ������� 
	 * ����ʱ�䣺2015-6-10
	 */
	public String workerVacationApply(){
		
//		System.out.println(vacation.getVacationType());
//		System.out.println(vacation.getVacationReason());
//		System.out.println(vacation.getVacationStartDate());
//		System.out.println(vacation.getVacationEndDate());
		//��ȡsession�е�activeWorker
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		//��������û�
		vacation.setWorker(worker);
		//����Ĭ����ٽ��
		vacation.setVacationResult(0);
		
		//�������Ϣ�������ݿ�
		vacationservice.insertVacation(vacation);
		
		//��ʼ��vacation
		vacation = null;
		session.put("status", "1");
		ActionContext.getContext().setSession(session);
		return SUCCESS;
		
	}
	
	/**
	 * ��������ټ�¼��ѯ
	 * ���ߣ������� 
	 * ����ʱ�䣺2015-6-10
	 */
	public String workerVacationSearch(){
		//��ѯ��ٱ��ҽ����ݱ��浽List
		String hql = "from Vacation";
		List<Vacation> vacationlist = vacationservice.searchVacation(hql);
		
		//����session
		Map session = ActionContext.getContext().getSession();
		session.put("vacationlist", vacationlist);
		ActionContext.getContext().setSession(session);
		return SUCCESS;
	}
	
	public Vacation getVacation() {
		return vacation;
	}
	public void setVacation(Vacation vacation) {
		this.vacation = vacation;
	}
	public VacationService getVacationservice() {
		return vacationservice;
	}
	public void setVacationservice(VacationService vacationservice) {
		this.vacationservice = vacationservice;
	}
}
