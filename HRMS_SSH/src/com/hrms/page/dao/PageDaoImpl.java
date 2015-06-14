package com.hrms.page.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

public class PageDaoImpl implements PageDao {

	@Resource
	SessionFactory sessionFactory;
	/**
     * ʹ��hibernate�ṩ�ķ�ҳ���ܣ��õ���ҳ��ʾ������
     */
	@Override
	public <T> List<T> queryByPage(String hql, int offset, int pageSize) {
		// TODO Auto-generated method stub
		List<T> list = sessionFactory.getCurrentSession().createQuery(hql).setFirstResult(offset).setMaxResults(pageSize).list();
		return list;
	}

	/**
     * ͨ��hql���õ����ݿ��м�¼����
     */
	@Override
	public int getAllRowCount(String hql) {
		// TODO Auto-generated method stub
		int allRows = 0;
		allRows = sessionFactory.getCurrentSession().createQuery(hql).list().size();
		return allRows;
	}

}
