package com.hrms.holiday.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

import com.hrms.pojo.Holiday;

public class HolidayDaoImpl implements HolidayDao {

	@Resource
	SessionFactory sessionFactory;
	@Override
	public List<Holiday> searchHolidays(String hql) {
		// TODO Auto-generated method stub
		List<Holiday> holidays = sessionFactory.getCurrentSession().createQuery(hql).list();
		return holidays;
	}

	@Override
	public Holiday insertHoliday(Holiday holiday) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(holiday);
		return holiday;
	}

	@Override
	public Holiday updateHoliday(Holiday holiday) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteHoliday(Holiday holiday) {
		// TODO Auto-generated method stub

	}

}
