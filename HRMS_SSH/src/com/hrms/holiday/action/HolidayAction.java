package com.hrms.holiday.action;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.holiday.service.HolidayService;
import com.hrms.pojo.Holiday;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class HolidayAction extends ActionSupport {
	private Date holidaystart;
	private Date holidayend;
	private String holidayContent;
	@Resource
	private HolidayService holidayService;
	
	public String createHoliday(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		if(holidayend.compareTo(holidaystart)>=0){
			holidayService.insertHoliday(holidaystart, holidayend, holidayContent);
			session.put("holidaycreatestate", 1);
			return SUCCESS;
		}else{
			session.put("holidaycreatestate", 2);
			return SUCCESS;
		}
	}
	
	public Date getHolidaystart() {
		return holidaystart;
	}
	public void setHolidaystart(Date holidaystart) {
		this.holidaystart = holidaystart;
	}
	public Date getHolidayend() {
		return holidayend;
	}
	public void setHolidayend(Date holidayend) {
		this.holidayend = holidayend;
	}
	
	public String getHolidayContent() {
		return holidayContent;
	}

	public void setHolidayContent(String holidayContent) {
		this.holidayContent = holidayContent;
	}

	public HolidayService getHolidayService() {
		return holidayService;
	}
	public void setHolidayService(HolidayService holidayService) {
		this.holidayService = holidayService;
	}
}
