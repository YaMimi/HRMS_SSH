package com.hrms.attendance.actions;
/**
 * �ࣺ���Action
 * ���ߣ������� 
 * ����ʱ�䣺2015-6-10
 */
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.attendance.services.AttendanceService;
import com.hrms.attendance.services.VacationService;
import com.hrms.page.bean.PageBean;
import com.hrms.page.service.PageService;
import com.hrms.pojo.Attendance;
import com.hrms.pojo.Vacation;
import com.hrms.pojo.Worker;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class VacationAction extends ActionSupport {
	private Vacation vacation;
	private int vacationOid;
	private int vacationresult;
	@Resource
	private VacationService vacationservice;
	@Resource
	private AttendanceService attendanceservice;
	@Resource
	private PageService pageserivce;
	private int page;
	
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
		//��ȡsession�е�activeWorker
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		//��ѯ��ٱ��ҽ����ݱ��浽List
		String hql = "from Vacation v where v.worker.workerOid = " + worker.getWorkerOid();
		
		PageBean pageBean = pageserivce.getPageBean(hql, 4, page);
		
		//����session
		session.put("vacationlist", pageBean.getList());
		session.put("pageBean", pageBean);
		ActionContext.getContext().setSession(session);
		return SUCCESS;
	}
	
	/**
	 * ���������������ѯ
	 * ���ߣ������� 
	 * ����ʱ�䣺2015-6-11
	 */
	public String approveVacationSearch(){
		//��ȡsession�е�activeWorker
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		//��ѯ��ٱ��ҽ����ݱ��浽List
		String hql = "from Vacation v where v.worker.department.departmentOid = " + worker.getDepartment().getDepartmentOid() +" and v.worker.workerPermission < "+ worker.getWorkerPermission() +
				" order by vacationOid desc";
		PageBean pageBean = pageserivce.getPageBean(hql, 5, page);
		//����session
		session.put("approvevacationlist", pageBean.getList());
		session.put("pageBean", pageBean);
		ActionContext.getContext().setSession(session);
		return SUCCESS;
	}
	
	/**
	 * �������������
	 * ���ߣ������� 
	 * ����ʱ�䣺2015-6-11
	 */
	public String vacationApprove(){
		//System.out.println(vacationresult);
		//System.out.println(vacationOid);
		//��ѯ��ٱ��ҽ����ݱ��浽List
		String hql = "from Vacation v where v.vacationOid = " + vacationOid;
		List<Vacation> vacationlist = vacationservice.searchVacation(hql);
		Vacation vacation = vacationlist.get(0);
		//�������ݿ�
		if(vacationresult==1){
			//��׼
			vacation.setVacationResult(vacationresult);
			//�����������״̬
			vacationservice.updateVacation(vacation);
			//���ڱ���뿼�����
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Attendance attendance;
			for(int i = 0; i <= vacation.getVacationEndDate().compareTo(vacation.getVacationStartDate()); i++){
				attendance = new Attendance();
				//���ڼ�һ��
				Calendar c = Calendar.getInstance();
				Date date = vacation.getVacationStartDate();
				c.setTime(date);
				int day = c.get(Calendar.DATE); 
				c.set(Calendar.DATE, day + i);
				date = c.getTime();
				//System.out.println(date);
				//����Ҫ���뿼�ڱ������
				attendance.setAttendanceDate(date); 
				attendance.setAttendanceState(0);
				attendance.setWorker(vacation.getWorker());
				//���뿼�ڱ�
				attendanceservice.insertAttendance(attendance);
			}
		}else if(vacationresult==2){
			//����
			vacation.setVacationResult(vacationresult);
			//�����������״̬
			vacationservice.updateVacation(vacation);
		}
		return SUCCESS;
	}
	
	public Vacation getVacation() {
		return vacation;
	}
	public void setVacation(Vacation vacation) {
		this.vacation = vacation;
	}
	

	public int getVacationOid() {
		return vacationOid;
	}

	public void setVacationOid(int vacationOid) {
		this.vacationOid = vacationOid;
	}

	public int getVacationresult() {
		return vacationresult;
	}

	public void setVacationresult(int vacationresult) {
		this.vacationresult = vacationresult;
	}

	public VacationService getVacationservice() {
		return vacationservice;
	}
	public void setVacationservice(VacationService vacationservice) {
		this.vacationservice = vacationservice;
	}

	public AttendanceService getAttendanceservice() {
		return attendanceservice;
	}

	public void setAttendanceservice(AttendanceService attendanceservice) {
		this.attendanceservice = attendanceservice;
	}

	public PageService getPageserivce() {
		return pageserivce;
	}

	public void setPageserivce(PageService pageserivce) {
		this.pageserivce = pageserivce;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
}
