package com.hrms.attendance.services;

import java.util.List;

import com.hrms.pojo.Vacation;

public interface VacationService {
	public List<Vacation> searchVacation(String hql);
	public Vacation insertVacation(Vacation vacation);
	public Vacation updateVacation(Vacation vacation);
	public void deleteVacation(Vacation vacation);
}
