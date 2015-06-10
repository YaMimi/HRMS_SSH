package com.hrms.attendance.actions;
/**
 * 类：请假Action
 * 作者：杨明杰 
 * 更新时间：2015-6-10
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
		//查询请假表并且将数据保存到List
		String hql = "from Vacation";
		List<Vacation> vacationlist = vacationservice.searchVacation(hql);
		
		//设置session
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
