package com.hrms.pojo;

/**
 * Salary entity. @author MyEclipse Persistence Tools
 */

public class Salary implements java.io.Serializable {

	// Fields

	private Integer salaryOid;
	private Worker worker;
	private String salaryDate;
	private Float salaryBased;
	private Float salaryStandardTime;
	private Float salaryActualTime;
	private Float salaryWeekendTime;
	private Float salaryHolidayTime;

	// Constructors

	/** default constructor */
	public Salary() {
	}

	/** full constructor */
	public Salary(Worker worker, String salaryDate, Float salaryBased,
			Float salaryStandardTime, Float salaryActualTime,
			Float salaryWeekendTime, Float salaryHolidayTime) {
		this.worker = worker;
		this.salaryDate = salaryDate;
		this.salaryBased = salaryBased;
		this.salaryStandardTime = salaryStandardTime;
		this.salaryActualTime = salaryActualTime;
		this.salaryWeekendTime = salaryWeekendTime;
		this.salaryHolidayTime = salaryHolidayTime;
	}

	// Property accessors

	public Integer getSalaryOid() {
		return this.salaryOid;
	}

	public void setSalaryOid(Integer salaryOid) {
		this.salaryOid = salaryOid;
	}

	public Worker getWorker() {
		return this.worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}

	public String getSalaryDate() {
		return this.salaryDate;
	}

	public void setSalaryDate(String salaryDate) {
		this.salaryDate = salaryDate;
	}

	public Float getSalaryBased() {
		return this.salaryBased;
	}

	public void setSalaryBased(Float salaryBased) {
		this.salaryBased = salaryBased;
	}

	public Float getSalaryStandardTime() {
		return this.salaryStandardTime;
	}

	public void setSalaryStandardTime(Float salaryStandardTime) {
		this.salaryStandardTime = salaryStandardTime;
	}

	public Float getSalaryActualTime() {
		return this.salaryActualTime;
	}

	public void setSalaryActualTime(Float salaryActualTime) {
		this.salaryActualTime = salaryActualTime;
	}

	public Float getSalaryWeekendTime() {
		return this.salaryWeekendTime;
	}

	public void setSalaryWeekendTime(Float salaryWeekendTime) {
		this.salaryWeekendTime = salaryWeekendTime;
	}

	public Float getSalaryHolidayTime() {
		return this.salaryHolidayTime;
	}

	public void setSalaryHolidayTime(Float salaryHolidayTime) {
		this.salaryHolidayTime = salaryHolidayTime;
	}

}