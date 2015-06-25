package com.hrms.rop.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.pojo.Rewardorpunishment;
import com.hrms.pojo.Salary;
import com.hrms.pojo.Worker;
import com.hrms.rop.service.ROPService;
import com.hrms.salary.service.SalaryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ROPAction extends ActionSupport {
	Rewardorpunishment Rop = new Rewardorpunishment();
	private int salaryOid;
	private int ropoid;
	@Resource
	private ROPService ropService;
	@Resource
	SalaryService salaryService;
	
	/*
	 * 功能：插入新的奖惩并更新工资表
	 * 作者：杨明杰
	 * 日期：6月25日
	 */
	public String createROP(){
//		System.out.println(Rop.getRop());
//		System.out.println(Rop.getRopamount());
//		System.out.println(Rop.getRopdate());
//		System.out.println(Rop.getRopreason());
//		System.out.println(salaryOid);
		Salary salary = salaryService.searchSalary(salaryOid);
		Worker worker = (Worker)salary.getWorker();
		Rop.setWorker(worker);
		if(Rop.getRop()==1){
			Rop.setRopamount(Rop.getRopamount());
		}else if(Rop.getRop()==0){
			Rop.setRopamount(-Rop.getRopamount());
		}
		ropService.insertROP(Rop);
		salary = salaryService.searchSalary(salaryOid);
		salary.setSalaryRop(salary.getSalaryRop()+Rop.getRopamount());
		salaryService.updateSalary(salary);
		Rop=null;
		//更新工资列表
		String hql = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Map<String, Object> session = ActionContext.getContext().getSession();
		Date nowdate = (Date)session.get("nowsalarydate");
		//更新奖惩明细列表
		hql = "from Rewardorpunishment where ropdate like '"+sdf.format(nowdate) +"%'";
		List<Rewardorpunishment> ROPlist = ropService.searchROP(hql);
		session.put("ROPlist", ROPlist);//奖罚
		
		String department = (String) session.get("nowsalarydepartment");//部门
		Date date = (Date) session.get("nowsalarydate");//日期
		
		if(department.equals("全部")){
			hql = "from Salary s where salaryDate like '"+ sdf.format(date) +"%' order by s.worker.workerPermission desc";
		}else{
			hql = "from Salary s where salaryDate like '"+ sdf.format(date) +"%' and s.worker.department.departmentName = '"+ department +"' order by s.worker.workerPermission desc";
		}
		List<Salary> allsalarys = salaryService.searchSalary(hql);
		session.put("allsalarys", allsalarys);
		
		
		return SUCCESS;
	}
	
	/*
	 * 功能：删除奖惩记录
	 * 作者：杨明杰
	 * 日期：6月25日
	 */
	public String deleteROP(){
		//System.out.println(ropoid);
		ropService.deleteROP(ropoid);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Map<String, Object> session = ActionContext.getContext().getSession();
		Date nowdate = (Date)session.get("nowsalarydate");
		//更新奖惩明细列表
		String hql = "from Rewardorpunishment where ropdate like '"+sdf.format(nowdate) +"%'";
		List<Rewardorpunishment> ROPlist = ropService.searchROP(hql);
		session.put("ROPlist", ROPlist);//奖罚
		
		return SUCCESS;
		
	}
	
	public Rewardorpunishment getRop() {
		return Rop;
	}
	public void setRop(Rewardorpunishment rop) {
		Rop = rop;
	}
	public int getRopoid() {
		return ropoid;
	}

	public void setRopoid(int ropoid) {
		this.ropoid = ropoid;
	}

	public ROPService getRopService() {
		return ropService;
	}
	public void setRopService(ROPService ropService) {
		this.ropService = ropService;
	}

	public int getSalaryOid() {
		return salaryOid;
	}

	public void setSalaryOid(int salaryOid) {
		this.salaryOid = salaryOid;
	}

	public SalaryService getSalaryService() {
		return salaryService;
	}

	public void setSalaryService(SalaryService salaryService) {
		this.salaryService = salaryService;
	}
	
}
