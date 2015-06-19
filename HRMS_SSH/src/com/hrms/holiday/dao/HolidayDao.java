package com.hrms.holiday.dao;

import java.util.List;

import com.hrms.pojo.Holiday;

public interface HolidayDao {
	public List<Holiday> searchHolidays(String hql);
	public Holiday insertHoliday(Holiday holiday);
	public Holiday updateHoliday(Holiday holiday);
	public void deleteHoliday(Holiday holiday);
	
}
