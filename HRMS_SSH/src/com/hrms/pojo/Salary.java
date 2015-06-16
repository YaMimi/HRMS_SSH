package com.hrms.pojo;

/**
 * Salary entity. @author MyEclipse Persistence Tools
 */

public class Salary implements java.io.Serializable {

	// Fields

	private Integer salaryOid;
	private Hourlysalary hourlysalary;
	private Worker worker;
	private String salaryDate;
	private Float salaryStandardTime;
	private Float salaryActualTime;
	private Float salaryWeekTime;
	private Float salaryWeekendTime;
	private Float salaryHolidayTime;
	private Float salaryAttendanceReward;
	private Float salaryTotal;

	// Constructors

	/** default constructor */
	public Salary() {
	}

	/** full constructor */
	public Salary(Hourlysalary hourlysalary, Worker worker, String salaryDate,
			Float salaryStandardTime, Float salaryActualTime,
			Float salaryWeekTime, Float salaryWeekendTime,
			Float salaryHolidayTime, Float salaryAttendanceReward,
			Float salaryTotal) {
		this.hourlysalary = hourlysalary;
		this.worker = worker;
		this.salaryDate = salaryDate;
		this.salaryStandardTime = salaryStandardTime;
		this.salaryActualTime = salaryActualTime;
		this.salaryWeekTime = salaryWeekTime;
		this.salaryWeekendTime = salaryWeekendTime;
		this.salaryHolidayTime = salaryHolidayTime;
		this.salaryAttendanceReward = salaryAttendanceReward;
		this.salaryTotal = salaryTotal;
	}

	// Property accessors

	public Integer getSalaryOid() {
		return this.salaryOid;
	}

	public void setSalaryOid(Integer salaryOid) {
		this.salaryOid = salaryOid;
	}

	public Hourlysalary getHourlysalary() {
		return this.hourlysalary;
	}

	public void setHourlysalary(Hourlysalary hourlysalary) {
		this.hourlysalary = hourlysalary;
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

	public Float getSalaryWeekTime() {
		return this.salaryWeekTime;
	}

	public void setSalaryWeekTime(Float salaryWeekTime) {
		this.salaryWeekTime = salaryWeekTime;
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

	public Float getSalaryAttendanceReward() {
		return this.salaryAttendanceReward;
	}

	public void setSalaryAttendanceReward(Float salaryAttendanceReward) {
		this.salaryAttendanceReward = salaryAttendanceReward;
	}

	public Float getSalaryTotal() {
		return this.salaryTotal;
	}

	public void setSalaryTotal(Float salaryTotal) {
		this.salaryTotal = salaryTotal;
	}

}