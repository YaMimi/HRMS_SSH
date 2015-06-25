package com.hrms.rop.service;

import java.util.List;

import com.hrms.pojo.Rewardorpunishment;

public interface ROPService {

	public Rewardorpunishment insertROP(Rewardorpunishment rop);

	public List<Rewardorpunishment> searchROP(String hql);

	public void deleteROP(int ropoid);

}
