package com.hrms.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Hourlysalary entity. @author MyEclipse Persistence Tools
 */

public class Hourlysalary implements java.io.Serializable {

	// Fields

	private Integer hourlySalaryOid;
	private Float hourlySalary;
	private Integer permission;
	private Set salaries = new HashSet(0);

	// Constructors

	/** default constructor */
	public Hourlysalary() {
	}

	/** minimal constructor */
	public Hourlysalary(Float hourlySalary, Integer permission) {
		this.hourlySalary = hourlySalary;
		this.permission = permission;
	}

	/** full constructor */
	public Hourlysalary(Float hourlySalary, Integer permission, Set salaries) {
		this.hourlySalary = hourlySalary;
		this.permission = permission;
		this.salaries = salaries;
	}

	// Property accessors

	public Integer getHourlySalaryOid() {
		return this.hourlySalaryOid;
	}

	public void setHourlySalaryOid(Integer hourlySalaryOid) {
		this.hourlySalaryOid = hourlySalaryOid;
	}

	public Float getHourlySalary() {
		return this.hourlySalary;
	}

	public void setHourlySalary(Float hourlySalary) {
		this.hourlySalary = hourlySalary;
	}

	public Integer getPermission() {
		return this.permission;
	}

	public void setPermission(Integer permission) {
		this.permission = permission;
	}

	public Set getSalaries() {
		return this.salaries;
	}

	public void setSalaries(Set salaries) {
		this.salaries = salaries;
	}

}