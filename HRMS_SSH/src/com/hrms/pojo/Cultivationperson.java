package com.hrms.pojo;

/**
 * Cultivationperson entity. @author MyEclipse Persistence Tools
 */

public class Cultivationperson implements java.io.Serializable {

	// Fields

	private Integer cultivationPersonOid;
	private Worker worker;
	private Cultivation cultivation;
	private Integer cultivationPersonMark;

	// Constructors

	/** default constructor */
	public Cultivationperson() {
	}

	/** minimal constructor */
	public Cultivationperson(Worker worker, Cultivation cultivation) {
		this.worker = worker;
		this.cultivation = cultivation;
	}

	/** full constructor */
	public Cultivationperson(Worker worker, Cultivation cultivation,
			Integer cultivationPersonMark) {
		this.worker = worker;
		this.cultivation = cultivation;
		this.cultivationPersonMark = cultivationPersonMark;
	}

	// Property accessors

	public Integer getCultivationPersonOid() {
		return this.cultivationPersonOid;
	}

	public void setCultivationPersonOid(Integer cultivationPersonOid) {
		this.cultivationPersonOid = cultivationPersonOid;
	}

	public Worker getWorker() {
		return this.worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}

	public Cultivation getCultivation() {
		return this.cultivation;
	}

	public void setCultivation(Cultivation cultivation) {
		this.cultivation = cultivation;
	}

	public Integer getCultivationPersonMark() {
		return this.cultivationPersonMark;
	}

	public void setCultivationPersonMark(Integer cultivationPersonMark) {
		this.cultivationPersonMark = cultivationPersonMark;
	}

}