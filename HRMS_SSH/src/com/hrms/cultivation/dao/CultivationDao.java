package com.hrms.cultivation.dao;

import java.util.List;

import com.hrms.pojo.Cultivation;

public interface CultivationDao {
	public List<Cultivation> showCultivation();
	public Cultivation insertCultivation(Cultivation cultivation);
	public Cultivation findCultivation(int oid);
}
