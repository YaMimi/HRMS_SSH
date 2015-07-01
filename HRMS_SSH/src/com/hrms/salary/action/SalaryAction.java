package com.hrms.salary.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.department.services.DepartmentService;
import com.hrms.pojo.Department;
import com.hrms.pojo.Rewardorpunishment;
import com.hrms.pojo.Salary;
import com.hrms.pojo.Worker;
import com.hrms.rop.service.ROPService;
import com.hrms.salary.service.SalaryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.regexp.internal.RE;

public class SalaryAction extends ActionSupport {
	private String year;
	private String month;
	private String department;
	private Salary salary;
	private float salaryhourly;
	@Resource
	private SalaryService salaryService;
	@Resource
	private DepartmentService departmentService;
	@Resource
	private ROPService ropService;
	
	/*
	 * ���ܣ��������²��Ҹ��˹�����Ϣ
	 * ���ߣ�������
	 * ���ڣ�6��20��
	 */
	public String checkSalary(){
//		System.out.println(year);
//		System.out.println(month);
		String Date = year + "-" + month;
		Map<String, Object> session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		String hql = "from Salary s where s.worker.workerOid = " + worker.getWorkerOid() + " and salaryDate like '"+Date+"%' ";
		List<Salary> salarys = salaryService.searchSalary(hql);
		if(!salarys.isEmpty()){
			Salary salary = salarys.get(0);
			session.put("salary", salary);
		}else{
			session.put("salary", null);
			session.put("salarystate", 0);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date date = null;
		try {
			date = sdf.parse(Date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Output NowPersonalDate is ERROR !");
		}
		session.put("nowpersonalsalarydate", date);
		
		Date nowpersonaldate = (Date)session.get("nowpersonalsalarydate");
		hql = "from Rewardorpunishment where ropdate like '"+sdf.format(nowpersonaldate) +"%'";
		List<Rewardorpunishment> ROPpersonallist = ropService.searchROP(hql);
		session.put("ROPpersonallist", ROPpersonallist);//����
		
		return SUCCESS;
		
	}
	
	/*
	 * ���ܣ��ҳ����ʵ��������
	 * ���ߣ�������
	 * ���ڣ�6��20��
	 */
	
	public String searchSalaryDate(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		String hql = "from Salary s where s.worker.workerOid = " + worker.getWorkerOid() + " order by salaryDate desc";
		List<Salary> salarys = salaryService.searchSalary(hql);
		List<Date> salarysdate = new ArrayList<Date>() ;
		String salarydate = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		for(Salary salary : salarys){
			if(!salarydate.equals(sdf.format(salary.getSalaryDate()))){
				salarydate = sdf.format(salary.getSalaryDate());
				salarysdate.add(salary.getSalaryDate());
			}
		}
		
		session.put("salarysdate", salarysdate);
		Salary salary = salarys.get(0);
		session.put("salary", salary);
		
		Date date = new Date();
		//System.out.println(date);
		session.put("nowpersonalsalarydate", date);
		
		sdf = new SimpleDateFormat("yyyy-MM");
		Date nowpersonaldate = (Date)session.get("nowpersonalsalarydate");
		hql = "from Rewardorpunishment where ropdate like '"+sdf.format(nowpersonaldate) +"%'";
		List<Rewardorpunishment> ROPpersonallist = ropService.searchROP(hql);
		session.put("ROPpersonallist", ROPpersonallist);//����
		
		return SUCCESS;
		
	}
	
	/*
	 * ���ܣ���ʼ�����ʹ�����Ϣ
	 * ���ߣ�������
	 * ���ڣ�6��22��
	 */
	public String intiAllSalary(){
		//��ȡ���в���
		Map<String, Object> session = ActionContext.getContext().getSession();
		String hql = "from Department ";
		List<Department> departmentlistdown = departmentService.searchDepartment(hql);
		session.put("departmentlistdown", departmentlistdown);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date date = new Date();
		hql = "from Salary where salaryDate like '"/*+sdf.format(date) +*/+"%' order by salaryDate desc";
		List<Salary> allsalarys = salaryService.searchSalary(hql);
		List<Date> salarysdate = new ArrayList<Date>() ;
		String salarydate = "";
		sdf = new SimpleDateFormat("yyyy");
		for(Salary salary : allsalarys){
			if(!salarydate.equals(sdf.format(salary.getSalaryDate()))){
				salarydate = sdf.format(salary.getSalaryDate());
				salarysdate.add(salary.getSalaryDate());
			}
		}
		
		session.put("allsalarysdate", salarysdate);
		sdf = new SimpleDateFormat("yyyy-MM");
		hql = "from Salary s where salaryDate like '"+sdf.format(date) +"%' order by s.worker.workerPermission desc";
		allsalarys = salaryService.searchSalary(hql);
		session.put("allsalarys", allsalarys);
		//�����б�
		hql = "from Rewardorpunishment where ropdate like '"+sdf.format(date) +"%'";
		List<Rewardorpunishment> ROPlist = ropService.searchROP(hql);
		//if(!ROPlist.isEmpty()){System.out.println("is not Empty");}else{System.out.println("is Empty");}
		session.put("ROPlist", ROPlist);//����
		session.put("nowsalarydepartment", "ȫ��");//����
		session.put("nowsalarydate", date);//����
		
		return SUCCESS;
		
	}
	
	/*
	 * ���ܣ���ѯָ���Ĺ��ʹ�����Ϣ
	 * ���ߣ�������
	 * ���ڣ�6��23��
	 */
	public String checkDepartmentSalary(){
		String Date = year + "-" + month;
		Map<String, Object> session = ActionContext.getContext().getSession();
		//��ȡ���ź����ڵ�hql
		String hql = "";
		if(department.equals("%")){
			hql = "from Salary s where salaryDate like '"+ Date +"%' order by s.worker.workerPermission desc";
		}else{
			hql = "from Salary s where salaryDate like '"+ Date +"%' and s.worker.department.departmentName = '"+ department +"' order by s.worker.workerPermission desc";
		}
		
		
		List<Salary> allsalarys = salaryService.searchSalary(hql);
		session.put("allsalarys", allsalarys);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date date = null;
		try {
			date = sdf.parse(Date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Output NowDate is ERROR !");
		}
		//System.out.println(department);
		//System.out.println(date);
		if(department.equals("%")){
			session.put("nowsalarydepartment", "ȫ��");//����
		}else{
			session.put("nowsalarydepartment", department);//����
		}
		
		session.put("nowsalarydate", date);//����
		
		Date nowdate = (Date)session.get("nowsalarydate");
		hql = "from Rewardorpunishment where ropdate like '"+sdf.format(nowdate) +"%'";
		List<Rewardorpunishment> ROPlist = ropService.searchROP(hql);
		session.put("ROPlist", ROPlist);//����
		
		return SUCCESS;
		
	}
	
	/*
	 * ���ܣ��޸Ĺ��ʱ�׼ʱн
	 * ���ߣ�������
	 * ���ڣ�6��23��
	 */
	public String alterSalary(){
		//System.out.println(salary.getSalaryOid());
		//System.out.println(salaryhourly);
		Salary s = salaryService.searchSalary(salary.getSalaryOid());
		//System.out.println(s.getSalaryHourly());
		s.setSalaryHourly(salaryhourly);
		//System.out.println(s.getSalaryHourly());
		salaryService.updateSalary(s);
		//System.out.println(s.getSalaryResult()); 
		salary=null;
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		String department = (String) session.get("nowsalarydepartment");//����
		Date date = (Date) session.get("nowsalarydate");//����
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String hql = "";
		if(department.equals("ȫ��")){
			hql = "from Salary s where salaryDate like '"+ sdf.format(date) +"%' order by s.worker.workerPermission desc";
		}else{
			hql = "from Salary s where salaryDate like '"+ sdf.format(date) +"%' and s.worker.department.departmentName = '"+ department +"' order by s.worker.workerPermission desc";
		}
		List<Salary> allsalarys = salaryService.searchSalary(hql);
		session.put("allsalarys", allsalarys);
		
		return SUCCESS;
		
	}
	
	/*
	 * ���ܣ����㹤�ʲ�д�����ݿ�
	 * ���ߣ�������
	 * ���ڣ�6��23��
	 */
	public String saveSalary(){
		//System.out.println(salary.getSalaryOid());
		//System.out.println(salaryhourly);
		Salary s = salaryService.searchSalary(salary.getSalaryOid());
		s.setSalaryResult(1);
		s.setSalaryTotal(s.getTotalSalary());
		s.setSalaryAttendanceReward(s.getAttendanceRewardSalary());
		s.setSalaryRop(s.getSalaryRop());
		salaryService.updateSalary(s);
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		String department = (String) session.get("nowsalarydepartment");//����
		Date date = (Date) session.get("nowsalarydate");//����
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String hql = "";
		if(department.equals("ȫ��")){
			hql = "from Salary s where salaryDate like '"+ sdf.format(date) +"%' order by s.worker.workerPermission desc";
		}else{
			hql = "from Salary s where salaryDate like '"+ sdf.format(date) +"%' and s.worker.department.departmentName = '"+ department +"' order by s.worker.workerPermission desc";
		}
		List<Salary> allsalarys = salaryService.searchSalary(hql);
		session.put("allsalarys", allsalarys);
		
		return SUCCESS;
		
	}
	
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public Salary getSalary() {
		return salary;
	}
	public void setSalary(Salary salary) {
		this.salary = salary;
	}
	public SalaryService getSalaryService() {
		return salaryService;
	}
	public void setSalaryService(SalaryService salaryService) {
		this.salaryService = salaryService;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public float getSalaryhourly() {
		return salaryhourly;
	}

	public void setSalaryhourly(float salaryhourly) {
		this.salaryhourly = salaryhourly;
	}

	public ROPService getRopService() {
		return ropService;
	}

	public void setRopService(ROPService ropService) {
		this.ropService = ropService;
	}
	
}
