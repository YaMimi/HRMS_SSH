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
	public Cultivationperson insertCultivation(Cultivationperson cultivation) {
		return cultivationPersonDao.insertCultivation(cultivation);
	}
	
	@Override
	public Cultivationperson editCultivation(Cultivationperson cultivation) {
		return cultivationPersonDao.editCultivation(cultivation);
	}
	
	@Override
	public Cultivationperson findCultivation(int oid) {
		return cultivationPersonDao.findCultivation(oid);
	}
	
	@Override
	public void deleteCultivation(int oid){
		cultivationPersonDao.deleteCultivation(oid);
	}

}
