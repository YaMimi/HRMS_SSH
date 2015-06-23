package com.hrms.cultivationPerson.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

import com.hrms.pojo.Cultivationperson;
import com.hrms.pojo.Worker;

public class CultivationPersonDaoImpl implements CultivationPersonDao {

	@Resource
	SessionFactory sessionFactory;

	@Override
	public Cultivationperson insertCultivation(Cultivationperson cultivation) {
		sessionFactory.getCurrentSession().persist(cultivation);
		return cultivation;
	}
	
	@Override
	public Cultivationperson editCultivation(Cultivationperson cultivation) {
		sessionFactory.getCurrentSession().merge(cultivation);
		return cultivation;
	}
	
	@Override
	public Cultivationperson findCultivation(int oid) {
		Cultivationperson c = (Cultivationperson) sessionFactory.getCurrentSession().get(Cultivationperson.class, oid);
		return c;
	}
	
	@Override
	public void deleteCultivation(int oid) {
		sessionFactory.getCurrentSession().delete(findCultivation(oid));
	}
}
