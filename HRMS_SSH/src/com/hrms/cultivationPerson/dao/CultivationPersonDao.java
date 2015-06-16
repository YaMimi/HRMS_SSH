package com.hrms.cultivationPerson.dao;

import java.util.List;

import com.hrms.pojo.Cultivationperson;
import com.hrms.pojo.Worker;

public interface CultivationPersonDao {
	public List<Cultivationperson> checkCultivationUnfinished(Worker worker);
	public List<Cultivationperson> checkCultivationFinished(Worker worker);
	public Cultivationperson insertCultivation(Cultivationperson cultivation);
	
}
