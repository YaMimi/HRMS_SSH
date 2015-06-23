package com.hrms.cultivation.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.cultivation.dao.CultivationDao;
import com.hrms.pojo.Cultivation;
@Transactional
public class CultivationServiceImpl implements CultivationService {

	@Resource
	CultivationDao cultivationDao;
	
	@Override
	public List<Cultivation> showCultivation() {
		return cultivationDao.showCultivation();
	}
	
	@Override
	public Cultivation insertCultivation(Cultivation cultivation) {
		return cultivationDao.insertCultivation(cultivation);
	}
	
	@Override
	public Cultivation findCultivation(int oid) {
		return cultivationDao.findCultivation(oid);
	}

}
