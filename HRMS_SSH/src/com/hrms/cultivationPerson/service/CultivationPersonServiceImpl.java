package com.hrms.cultivationPerson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.cultivationPerson.dao.CultivationPersonDao;
import com.hrms.pojo.Cultivationperson;
import com.hrms.pojo.Worker;
@Transactional
public class CultivationPersonServiceImpl implements CultivationPersonService {

	@Resource
	CultivationPersonDao cultivationPersonDao;
	
	@Override
	public List<Cultivationperson> checkCultivationUnfinished(Worker worker) {
		return cultivationPersonDao.checkCultivationUnfinished(worker);
	}

	@Override
	public List<Cultivationperson> checkCultivationFinished(Worker worker) {
		return cultivationPersonDao.checkCultivationFinished(worker);
	}

	@Override
	public Cultivationperson insertCultivation(Cultivationperson cultivation) {
		return cultivationPersonDao.insertCultivation(cultivation);
	}

}
