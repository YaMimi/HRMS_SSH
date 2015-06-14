package com.hrms.attendance.services;
/**
 * 类：请假Service
 * 作者：杨明杰 
 * 更新时间：2015-6-10
 */
import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.attendance.dao.VacationDao;
import com.hrms.pojo.Vacation;
@Transactional
public class VacationServiceImpl implements VacationService {
	
	@Resource
	VacationDao vacationdao;
	@Override
	public List<Vacation> searchVacation(String hql) {
		// TODO Auto-generated method stub
		return vacationdao.searchVacation(hql);
	}

	@Override
	public Vacation insertVacation(Vacation vacation) {
		// TODO Auto-generated method stub
		return vacationdao.insertVacation(vacation);
	}

	@Override
	public Vacation updateVacation(Vacation vacation) {
		// TODO Auto-generated method stub
		return vacationdao.updateVacation(vacation);
	}

	@Override
	public void deleteVacation(Vacation vacation) {
		// TODO Auto-generated method stub

	}
	/* 功能：获取未审批的条目数
	 * 作者：杨明杰
	 * 时间：2015-06-14
	 */
	@Override
	public int getVacationNum(String hql) {
		// TODO Auto-generated method stub
		int vacationnum = 0;
		List<Vacation> vacationlist = vacationdao.searchVacation(hql);
		vacationnum = vacationlist.size();
		return vacationnum;
	}

}
