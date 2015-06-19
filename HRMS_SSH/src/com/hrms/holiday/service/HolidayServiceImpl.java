package com.hrms.holiday.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.holiday.dao.HolidayDao;
import com.hrms.pojo.Attendance;
import com.hrms.pojo.Holiday;
@Transactional
public class HolidayServiceImpl implements HolidayService {

	@Resource
	HolidayDao holidaydao;
	
	@Override
	public List<Holiday> searchHolidays(String hql) {
		// TODO Auto-generated method stub
		return holidaydao.searchHolidays(hql);
	}

	@Override
	public void insertHoliday(Date startDate, Date endDate, String HolidayContent) {
		// TODO Auto-generated method stub
		Holiday holiday;
		for(int i = 0; i <= endDate.compareTo(startDate)+1; i++){
			holiday = new Holiday();
			//���ڼ�һ��
			Calendar c = Calendar.getInstance();
			Date date = startDate;
			c.setTime(date);
			int day = c.get(Calendar.DATE); 
			c.set(Calendar.DATE, day + i);
			date = c.getTime();
			//����Ҫ������ڱ������
			holiday.setHolidayDate(date); 
			holiday.setHolidayContent(HolidayContent);
			//������ڱ�
			holidaydao.insertHoliday(holiday);
		}
	}

}
