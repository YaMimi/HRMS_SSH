package com.hrms.rop.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.pojo.Rewardorpunishment;
import com.hrms.rop.dao.ROPDao;

@Transactional
public class ROPServiceImpl implements ROPService {
	@Resource
	ROPDao ropDao;

	@Override
	public Rewardorpunishment insertROP(Rewardorpunishment rop) {
		// TODO Auto-generated method stub
		return ropDao.insertROP(rop);
	}

	@Override
	public List<Rewardorpunishment> searchROP(String hql) {
		// TODO Auto-generated method stub
		return ropDao.searchROP(hql);
	}

	@Override
	public void deleteROP(int ropoid) {
		// TODO Auto-generated method stub
		ropDao.deleteROP(ropoid);
	}
}
