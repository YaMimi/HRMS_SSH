package com.hrms.page.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

public class PageDaoImpl implements PageDao {

	@Resource
	SessionFactory sessionFactory;
	/**
     * 使用hibernate提供的分页功能，得到分页显示的数据
     */
	@Override
	public <T> List<T> queryByPage(String hql, int offset, int pageSize) {
		// TODO Auto-generated method stub
		List<T> list = sessionFactory.getCurrentSession().createQuery(hql).setFirstResult(offset).setMaxResults(pageSize).list();
		return list;
	}

	/**
     * 通过hql语句得到数据库中记录总数
     */
	@Override
	public int getAllRowCount(String hql) {
		// TODO Auto-generated method stub
		int allRows = 0;
		allRows = sessionFactory.getCurrentSession().createQuery(hql).list().size();
		return allRows;
	}

}
