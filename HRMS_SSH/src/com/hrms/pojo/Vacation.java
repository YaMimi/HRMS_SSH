package com.hrms.pojo;

import java.util.Date;

/**
 * Vacation entity. @author MyEclipse Persistence Tools
 */

public class Vacation implements java.io.Serializable {

	// Fields

	private Integer vacationOid;
	private Worker worker;
	private Date vacationDate;
	private String vacationType;
	private String vacationReason;
	private Integer vacationResult;

	// Constructors

	/** default constructor */
	public Vacation() {
	}

	/** full constructor */
	public Vacation(Worker worker, Date vacationDate, String vacationType,
			String vacationReason, Integer vacationResult) {
		this.worker = worker;
		this.vacationDate = vacationDate;
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

	public Date getVacationDate() {
		return this.vacationDate;
	}

	public void setVacationDate(Date vacationDate) {
		this.vacationDate = vacationDate;
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