package com.hrms.pojo;

import java.util.Date;

/**
 * Cultivation entity. @author MyEclipse Persistence Tools
 */

public class Cultivation implements java.io.Serializable {

	// Fields

	private Integer cultivationOid;
	private Worker worker;
	private Date cultivationBeginDate;
	private Date cultivationEndDate;
	private String cultivationType;
	private String cultivationProject;
	private String cultivationInstruction;
	private Integer cultivationMark;

	// Constructors

	/** default constructor */
	public Cultivation() {
	}

	/** minimal constructor */
	public Cultivation(Worker worker, Date cultivationBeginDate,
			Date cultivationEndDate, String cultivationType,
			String cultivationProject, String cultivationInstruction) {
		this.worker = worker;
		this.cultivationBeginDate = cultivationBeginDate;
		this.cultivationEndDate = cultivationEndDate;
		this.cultivationType = cultivationType;
		this.cultivationProject = cultivationProject;
		this.cultivationInstruction = cultivationInstruction;
	}

	/** full constructor */
	public Cultivation(Worker worker, Date cultivationBeginDate,
			Date cultivationEndDate, String cultivationType,
			String cultivationProject, String cultivationInstruction,
			Integer cultivationMark) {
		this.worker = worker;
		this.cultivationBeginDate = cultivationBeginDate;
		this.cultivationEndDate = cultivationEndDate;
		this.cultivationType = cultivationType;
		this.cultivationProject = cultivationProject;
		this.cultivationInstruction = cultivationInstruction;
		this.cultivationMark = cultivationMark;
	}

	// Property accessors

	public Integer getCultivationOid() {
		return this.cultivationOid;
	}

	public void setCultivationOid(Integer cultivationOid) {
		this.cultivationOid = cultivationOid;
	}

	public Worker getWorker() {
		return this.worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}

	public Date getCultivationBeginDate() {
		return this.cultivationBeginDate;
	}

	public void setCultivationBeginDate(Date cultivationBeginDate) {
		this.cultivationBeginDate = cultivationBeginDate;
	}

	public Date getCultivationEndDate() {
		return this.cultivationEndDate;
	}

	public void setCultivationEndDate(Date cultivationEndDate) {
		this.cultivationEndDate = cultivationEndDate;
	}

	public String getCultivationType() {
		return this.cultivationType;
	}

	public void setCultivationType(String cultivationType) {
		this.cultivationType = cultivationType;
	}

	public String getCultivationProject() {
		return this.cultivationProject;
	}

	public void setCultivationProject(String cultivationProject) {
		this.cultivationProject = cultivationProject;
	}

	public String getCultivationInstruction() {
		return this.cultivationInstruction;
	}

	public void setCultivationInstruction(String cultivationInstruction) {
		this.cultivationInstruction = cultivationInstruction;
	}

	public Integer getCultivationMark() {
		return this.cultivationMark;
	}

	public void setCultivationMark(Integer cultivationMark) {
		this.cultivationMark = cultivationMark;
	}

}