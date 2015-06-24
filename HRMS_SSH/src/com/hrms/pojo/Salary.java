package com.hrms.pojo;

import java.util.Date;

/**
 * Salary entity. @author MyEclipse Persistence Tools
 */

public class Salary implements java.io.Serializable {

	// Fields

	private Integer salaryOid;
	private Worker worker;
	private Date salaryDate;
	private Float salaryHourly;
	private Float salaryStandardTime;
	private Float salaryActualTime;
	private Float salaryWeekTime;
	private Float salaryWeekendTime;
	private Float salaryHolidayTime;
	private Float salaryAttendanceReward;
	private Float salaryRop;
	private Float salaryTotal;
	private Integer salaryResult;

	// Constructors

	/** default constructor */
	public Salary() {
	}

	/** full constructor */
	public Salary(Worker worker, Date salaryDate, Float salaryHourly,
			Float salaryStandardTime, Float salaryActualTime,
			Float salaryWeekTime, Float salaryWeekendTime,
			Float salaryHolidayTime, Float salaryAttendanceReward,
			Float salaryRop, Float salaryTotal, Integer salaryResult) {
		this.worker = worker;
		this.salaryDate = salaryDate;
		this.salaryHourly = salaryHourly;
		this.salaryStandardTime = salaryStandardTime;
		this.salaryActualTime = salaryActualTime;
		this.salaryWeekTime = salaryWeekTime;
		this.salaryWeekendTime = salaryWeekendTime;
		this.salaryHolidayTime = salaryHolidayTime;
		this.salaryAttendanceReward = salaryAttendanceReward;
		this.salaryRop = salaryRop;
		this.salaryTotal = salaryTotal;
		this.salaryResult = salaryResult;
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

	public Date getSalaryDate() {
		return this.salaryDate;
	}

	public void setSalaryDate(Date salaryDate) {
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

	public Float getSalaryRop() {
		return this.salaryRop;
	}

	public void setSalaryRop(Float salaryRop) {
		this.salaryRop = salaryRop;
	}

	public Float getSalaryTotal() {
		return this.salaryTotal;
	}

	public void setSalaryTotal(Float salaryTotal) {
		this.salaryTotal = salaryTotal;
	}

	public Integer getSalaryResult() {
		return this.salaryResult;
	}

	public void setSalaryResult(Integer salaryResult) {
		this.salaryResult = salaryResult;
	}
	
	/*
	 * 总工资
	 */
	public float getTotalSalary(){
		return getActualSalary()+getWeekSalary()+getWeekendSalary()+getHolidaySalary()+getAttendanceRewardSalary()+getRopSalary();
	}
	
	/*
	 * 额定工资
	 */
	public float getStandardSalary(){
		return this.salaryStandardTime*this.salaryHourly;
		
	}
	
	/*
	 * 实际工资
	 */
	public float getActualSalary(){
		return this.salaryActualTime*this.salaryHourly;
		
	}
	
	/*
	 * 工作日加班工资
	 */
	public float getWeekSalary(){
		return (float) (1.5*this.salaryWeekTime*this.salaryHourly);
		
	}
	
	/*
	 * 双休加班工资
	 */
	public float getWeekendSalary(){
		return (float) (2.0*this.salaryWeekendTime*this.salaryHourly);
		
	}
	
	/*
	 * 假日加班工资
	 */
	public float getHolidaySalary(){
		return (float) (3.0*this.salaryHolidayTime*this.salaryHourly);
		
	}
	
	/*
	 * 全勤奖励
	 */
	public float getAttendanceRewardSalary(){
		if(this.salaryActualTime>this.salaryStandardTime){
			return (float) (this.salaryHourly*40.0);
		}else{
			return (float) 0.0;
		}
	}
	
	/*
	 * 奖罚工资
	 */
	public float getRopSalary(){
		return this.salaryRop;
		
	}

}