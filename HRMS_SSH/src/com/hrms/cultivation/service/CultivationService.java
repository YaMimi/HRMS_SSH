package com.hrms.cultivation.service;

import java.util.List;

import com.hrms.pojo.Cultivation;

public interface CultivationService {
	public List<Cultivation> showCultivation();
	public Cultivation insertCultivation(Cultivation cultivation);
	public Cultivation findCultivation(int oid);
}
