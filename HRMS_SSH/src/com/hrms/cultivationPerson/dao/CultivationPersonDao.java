package com.hrms.cultivationPerson.dao;

import java.util.List;

import com.hrms.pojo.Cultivationperson;
import com.hrms.pojo.Worker;

public interface CultivationPersonDao {
	public Cultivationperson insertCultivation(Cultivationperson cultivation);
	public void deleteCultivation(int oid);
}
