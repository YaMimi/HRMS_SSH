package com.hrms.cultivationPerson.service;

import java.util.List;

import com.hrms.pojo.Cultivationperson;
import com.hrms.pojo.Worker;

public interface CultivationPersonService {
	public List<Cultivationperson> checkCultivationUnfinished(Worker worker);
	public List<Cultivationperson> checkCultivationFinished(Worker worker);
	public Cultivationperson insertCultivation(Cultivationperson cultivation);
	
}
