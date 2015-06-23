package com.hrms.cultivationPerson.service;

import java.util.List;

import com.hrms.pojo.Cultivationperson;
import com.hrms.pojo.Worker;

public interface CultivationPersonService {
	public Cultivationperson insertCultivation(Cultivationperson cultivation);
	public void deleteCultivation(int oid);
}
