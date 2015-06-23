package com.hrms.cultivation.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

import com.hrms.pojo.Cultivation;

public class CultivationDaoImpl implements CultivationDao {

	@Resource
	SessionFactory sessionFactory;
	
	@Override
	public List<Cultivation> showCultivation() {
		String query = "from Cultivation";
		List<Cultivation> cList = sessionFactory.getCurrentSession().createQuery(query).list();
		return cList;
	}
	
	@Override
	public Cultivation insertCultivation(Cultivation cultivation) {
		sessionFactory.getCurrentSession().persist(cultivation);
		return cultivation;
	}
	
	@Override
	public Cultivation findCultivation(int oid) {
		return (Cultivation) sessionFactory.getCurrentSession().get(Cultivation.class, oid);
	}

}
