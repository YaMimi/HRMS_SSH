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
	public List<Cultivationperson> checkCultivationUnfinished(Worker worker) {
		String query = "from Cultivationperson cp where cp.worker.workerOid = '"+ worker.getWorkerOid() +"' and cp.cultivationPersonMark = NULL";
		List<Cultivationperson> cutivationUnfinishedList = sessionFactory.getCurrentSession().createQuery(query).list();
		return cutivationUnfinishedList;
	}

	@Override
	public List<Cultivationperson> checkCultivationFinished(Worker worker) {
		String query = "from Cultivationperson cp where cp.worker.workerOid = '"+ worker.getWorkerOid() +"' and cp.cultivationPersonMark != NULL";
		List<Cultivationperson> cutivationFinishedList = sessionFactory.getCurrentSession().createQuery(query).list();
		return cutivationFinishedList;
	}

	@Override
	public Cultivationperson insertCultivation(Cultivationperson cultivation) {
		sessionFactory.getCurrentSession().persist(cultivation);
		return cultivation;
	}

}
