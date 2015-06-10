package com.hrms.attendance.dao;

import java.util.List;

import com.hrms.pojo.Vacation;

public interface VacationDao {
	public List<Vacation> searchVacation(String hql);
	public Vacation insertVacation(Vacation vacation);
	public Vacation updateVacation(Vacation vacation);
	public void deleteVacation(Vacation vacation);
}
