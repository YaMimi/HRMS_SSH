package com.hrms.rop.dao;

import java.util.List;

import com.hrms.pojo.Rewardorpunishment;

public interface ROPDao {
	public List<Rewardorpunishment> searchROP(String hql);
	public Rewardorpunishment insertROP(Rewardorpunishment Rop);
	public Rewardorpunishment updateROP(Rewardorpunishment Rop);
	public void deleteROP(Rewardorpunishment Rop);
	public void deleteROP(int ropoid);
}
