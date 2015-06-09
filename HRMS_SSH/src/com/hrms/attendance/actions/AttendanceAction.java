package com.hrms.attendance.actions;
/*
 * 类：考勤的Action
 * 作者：杨明杰
 * 更新日期：2015-6-9
 */
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.attendance.services.AttendanceService;
import com.hrms.pojo.Attendance;
import com.hrms.pojo.Worker;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.fastinfoset.sax.Properties;

public class AttendanceAction extends ActionSupport {
	private String Date;
	private Attendance attendance;
	@Resource
	private AttendanceService attendanceservice;
	/**功能：个人考勤查询
	 * 作者：杨明杰
	 * 日期：2015-6-9
	 */
	public String workerAttendanceSearch(){
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		String hql = "from Attendance where attendanceWorkerOid = "+worker.getWorkerOid()+" order by attendanceDate desc";
		List<Attendance> attendancelist = attendanceservice.searchAttendance(hql);
		
		session.put("attendancelist", attendancelist);
		ActionContext.getContext().setSession(session);
		return SUCCESS;
		
	}
	/**功能：个人考勤查询（按日期）
	 * 作者：杨明杰
	 * 日期：2015-6-9
	 */
	public String workerAttendanceSearchByDate(){
		//System.out.println(Date);
		Map session = ActionContext.getContext().getSession();
		Worker worker = (Worker)session.get("activeWorker");
		String hql = "from Attendance where attendanceWorkerOid = "+worker.getWorkerOid()+" and attendanceDate = '"+Date+"' order by attendanceDate desc";
		List<Attendance> attendancelistdate = attendanceservice.searchAttendance(hql);
		session.put("attendancelistdate", attendancelistdate);
		ActionContext.getContext().setSession(session);
		
		return SUCCESS;
	}
	
	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public Attendance getAttendance() {
		return attendance;
	}
	public void setAttendance(Attendance attendance) {
		this.attendance = attendance;
	}
	public AttendanceService getAttendanceservice() {
		return attendanceservice;
	}
	public void setAttendanceservice(AttendanceService attendanceservice) {
		this.attendanceservice = attendanceservice;
	}
	
}
