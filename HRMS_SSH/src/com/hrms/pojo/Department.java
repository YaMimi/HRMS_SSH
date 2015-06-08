package com.hrms.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Department entity. @author MyEclipse Persistence Tools
 */

public class Department implements java.io.Serializable {

	// Fields

	private Integer departmentOid;
	private Department department;
	private String departmentNo;
	private String departmentName;
	private Set workers = new HashSet(0);
	private Set departments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Department() {
	}

	/** minimal constructor */
	public Department(Department department, String departmentNo,
			String departmentName) {
		this.department = department;
		this.departmentNo = departmentNo;
		this.departmentName = departmentName;
	}

	/** full constructor */
	public Department(Department department, String departmentNo,
			String departmentName, Set workers, Set departments) {
		this.department = department;
		this.departmentNo = departmentNo;
		this.departmentName = departmentName;
		this.workers = workers;
		this.departments = departments;
	}

	// Property accessors

	public Integer getDepartmentOid() {
		return this.departmentOid;
	}

	public void setDepartmentOid(Integer departmentOid) {
		this.departmentOid = departmentOid;
	}

	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getDepartmentNo() {
		return this.departmentNo;
	}

	public void setDepartmentNo(String departmentNo) {
		this.departmentNo = departmentNo;
	}

	public String getDepartmentName() {
		return this.departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Set getWorkers() {
		return this.workers;
	}

	public void setWorkers(Set workers) {
		this.workers = workers;
	}

	public Set getDepartments() {
		return this.departments;
	}

	public void setDepartments(Set departments) {
		this.departments = departments;
	}

}