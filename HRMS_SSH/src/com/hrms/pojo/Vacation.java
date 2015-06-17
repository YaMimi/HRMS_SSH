package com.hrms.pojo;

import java.util.Date;

/**
 * Vacation entity. @author MyEclipse Persistence Tools
 */

public class Vacation implements java.io.Serializable {

	// Fields

	private Integer vacationOid;
	private Worker worker;
	private Date vacationStartDate;
	private Date vacationEndDate;
	private String vacationType;
	private String vacationReason;
	private Integer vacationResult;

	// Constructors

	/** default constructor */
	public Vacation() {
	}

	/** full constructor */
	public Vacation(Worker worker, Date vacationStartDate,
			Date vacationEndDate, String vacationType, String vacationReason,
			Integer vacationResult) {
		this.worker = worker;
		this.vacationStartDate = vacationStartDate;
		this.vacationEndDate = vacationEndDate;
		this.vacationType = vacationType;
		this.vacationReason = vacationReason;
		this.vacationResult = vacationResult;
	}

	// Property accessors

	public Integer getVacationOid() {
		return this.vacationOid;
	}

	public void setVacationOid(Integer vacationOid) {
		this.vacationOid = vacationOid;
	}

	public Worker getWorker() {
		return this.worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}

	public Date getVacationStartDate() {
		return this.vacationStartDate;
	}

	public void setVacationStartDate(Date vacationStartDate) {
		this.vacationStartDate = vacationStartDate;
	}

	public Date getVacationEndDate() {
		return this.vacationEndDate;
	}

	public void setVacationEndDate(Date vacationEndDate) {
		this.vacationEndDate = vacationEndDate;
	}

	public String getVacationType() {
		return this.vacationType;
	}

	public void setVacationType(String vacationType) {
		this.vacationType = vacationType;
	}

	public String getVacationReason() {
		return this.vacationReason;
	}

	public void setVacationReason(String vacationReason) {
		this.vacationReason = vacationReason;
	}

	public Integer getVacationResult() {
		return this.vacationResult;
	}

	public void setVacationResult(Integer vacationResult) {
		this.vacationResult = vacationResult;
	}

}