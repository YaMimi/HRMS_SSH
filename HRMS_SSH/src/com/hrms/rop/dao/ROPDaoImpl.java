package com.hrms.rop.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

import com.hrms.pojo.Rewardorpunishment;

public class ROPDaoImpl implements ROPDao {
	@Resource
	SessionFactory sessionFactory;
	
	@Override
	public List<Rewardorpunishment> searchROP(String hql) {
		// TODO Auto-generated method stub
		List<Rewardorpunishment> roplist = sessionFactory.getCurrentSession().createQuery(hql).list();
		return roplist;
	}

	@Override
	public Rewardorpunishment insertROP(Rewardorpunishment Rop) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(Rop);
		return Rop;
	}

	@Override
	public Rewardorpunishment updateROP(Rewardorpunishment Rop) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().merge(Rop);
		return Rop;
	}

	@Override
	public void deleteROP(Rewardorpunishment Rop) {
		// TODO Auto-generated method stub
		Rewardorpunishment R = (Rewardorpunishment) sessionFactory.getCurrentSession().load(Rewardorpunishment.class, Rop.getRopoid());
		sessionFactory.getCurrentSession().delete(R);
	}

	@Override
	public void deleteROP(int ropoid) {
		// TODO Auto-generated method stub
		Rewardorpunishment R = (Rewardorpunishment) sessionFactory.getCurrentSession().load(Rewardorpunishment.class, ropoid);
		sessionFactory.getCurrentSession().delete(R);
	}

}
