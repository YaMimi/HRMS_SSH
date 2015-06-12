package com.hrms.attendance.dao;
/**
 * 类：请假Dao
 * 作者：杨明杰 
 * 更新时间：2015-6-10
 */
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

import com.hrms.pojo.Vacation;

public class VacationDaoImpl implements VacationDao {

	@Resource
	SessionFactory sessionFactory;
	@Override
	public List<Vacation> searchVacation(String hql) {
		// TODO Auto-generated method stub
		List<Vacation> vacationlist = sessionFactory.getCurrentSession().createQuery(hql).list();
		return vacationlist;
	}

	@Override
	public Vacation insertVacation(Vacation vacation) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(vacation);
		return vacation;
	}

	@Override
	public Vacation updateVacation(Vacation vacation) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().merge(vacation);
		return vacation;
	}

	@Override
	public void deleteVacation(Vacation vacation) {
		// TODO Auto-generated method stub

	}

}
