package com.hrms.pojo;

/**
 * Salary entity. @author MyEclipse Persistence Tools
 */

public class Salary implements java.io.Serializable {

	// Fields

	private Integer salaryOid;
	private Worker worker;
	private String salaryDate;
	private Float salaryHourly;
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
	public Salary(Worker worker, String salaryDate, Float salaryHourly,
			Float salaryStandardTime, Float salaryActualTime,
			Float salaryWeekTime, Float salaryWeekendTime,
			Float salaryHolidayTime, Float salaryAttendanceReward,
			Float salaryTotal) {
		this.worker = worker;
		this.salaryDate = salaryDate;
		this.salaryHourly = salaryHourly;
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

	public Float getSalaryHourly() {
		return this.salaryHourly;
	}

	public void setSalaryHourly(Float salaryHourly) {
		this.salaryHourly = salaryHourly;
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