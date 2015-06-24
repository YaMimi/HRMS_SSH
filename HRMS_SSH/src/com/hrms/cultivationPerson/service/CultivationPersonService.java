package com.hrms.cultivationPerson.service;

import java.util.List;

import com.hrms.pojo.Cultivationperson;
import com.hrms.pojo.Worker;

public interface CultivationPersonService {
	public Cultivationperson insertCultivation(Cultivationperson cultivation);
	public Cultivationperson editCultivation(Cultivationperson cultivation);
	public Cultivationperson findCultivation(int oid);
	public void deleteCultivation(int oid);
}
