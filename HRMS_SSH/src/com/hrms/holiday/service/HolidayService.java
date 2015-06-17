package com.hrms.holiday.service;

import java.util.Date;
import java.util.List;

import com.hrms.pojo.Holiday;

public interface HolidayService {
	public List<Holiday> searchHolidays(String hql);
	public void insertHoliday(Date startDate, Date endDate, String HolidayContent);
}
