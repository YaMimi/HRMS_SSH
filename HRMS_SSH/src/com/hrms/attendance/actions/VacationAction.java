package com.hrms.attendance.actions;
/**
 * 类：请假Action
 * 作者：杨明杰 
 * 更新时间：2015-6-10
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
	 * 方法：请假申请功能
	 * 作者：杨明杰 
	 * 更新时间：2015-6-10
	 */
	public String workerVacationApply(){
		
//		System.out.println(vacation.getVacationType());
//		System.out.println(vacation.getVacationReason());
//		System.out.println(vacation.getVacationStartDate());
//		System.out.println(vacation.getVacationEndDate());
		//获取session中的activeWorker
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		//加载请假用户
		vacation.setWorker(worker);
		//设置默认请假结果
		vacation.setVacationResult(0);
		
		//将请假信息插入数据库
		vacationservice.insertVacation(vacation);
		
		//初始化vacation
		vacation = null;
		session.put("status", "1");
		ActionContext.getContext().setSession(session);
		return SUCCESS;
		
	}
	
	/**
	 * 方法：请假记录查询
	 * 作者：杨明杰 
	 * 更新时间：2015-6-10
	 */
	public String workerVacationSearch(){
		//获取session中的activeWorker
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		//查询请假表并且将数据保存到List
		String hql = "from Vacation v where v.worker.workerOid = " + worker.getWorkerOid();
		
		PageBean pageBean = pageserivce.getPageBean(hql, 4, page);
		
		//设置session
		session.put("vacationlist", pageBean.getList());
		session.put("pageBean", pageBean);
		ActionContext.getContext().setSession(session);
		return SUCCESS;
	}
	
	/**
	 * 方法：请假审批查询
	 * 作者：杨明杰 
	 * 更新时间：2015-6-11
	 */
	public String approveVacationSearch(){
		//获取session中的activeWorker
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		//查询请假表并且将数据保存到List
		String hql = "from Vacation v where v.worker.department.departmentOid = " + worker.getDepartment().getDepartmentOid() +" and v.worker.workerPermission < "+ worker.getWorkerPermission() +
				" order by vacationOid desc";
		PageBean pageBean = pageserivce.getPageBean(hql, 5, page);
		//设置session
		session.put("approvevacationlist", pageBean.getList());
		session.put("pageBean", pageBean);
		ActionContext.getContext().setSession(session);
		return SUCCESS;
	}
	
	/**
	 * 方法：请假审批
	 * 作者：杨明杰 
	 * 更新时间：2015-6-11
	 */
	public String vacationApprove(){
		//System.out.println(vacationresult);
		//System.out.println(vacationOid);
		//查询请假表并且将数据保存到List
		String hql = "from Vacation v where v.vacationOid = " + vacationOid;
		List<Vacation> vacationlist = vacationservice.searchVacation(hql);
		Vacation vacation = vacationlist.get(0);
		//更新数据库
		if(vacationresult==1){
			//批准
			vacation.setVacationResult(vacationresult);
			//重新设置请假状态
			vacationservice.updateVacation(vacation);
			//考勤表插入考勤请假
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Attendance attendance;
			for(int i = 0; i <= vacation.getVacationEndDate().compareTo(vacation.getVacationStartDate()); i++){
				attendance = new Attendance();
				//日期加一天
				Calendar c = Calendar.getInstance();
				Date date = vacation.getVacationStartDate();
				c.setTime(date);
				int day = c.get(Calendar.DATE); 
				c.set(Calendar.DATE, day + i);
				date = c.getTime();
				//System.out.println(date);
				//设置要插入考勤表的内容
				attendance.setAttendanceDate(date); 
				attendance.setAttendanceState(0);
				attendance.setWorker(vacation.getWorker());
				//插入考勤表
				attendanceservice.insertAttendance(attendance);
			}
		}else if(vacationresult==2){
			//驳回
			vacation.setVacationResult(vacationresult);
			//重新设置请假状态
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
