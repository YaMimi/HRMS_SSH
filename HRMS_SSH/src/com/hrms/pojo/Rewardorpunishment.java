package com.hrms.pojo;

import java.util.Date;

/**
 * Rewardorpunishment entity. @author MyEclipse Persistence Tools
 */

public class Rewardorpunishment implements java.io.Serializable {

	// Fields

	private Integer ropoid;
	private Worker worker;
	private Date ropdate;
	private String roptype;
	private String ropreason;
	private Float ropamount;
	private Integer rop;

	// Constructors

	/** default constructor */
	public Rewardorpunishment() {
	}

	/** full constructor */
	public Rewardorpunishment(Worker worker, Date ropdate, String roptype,
			String ropreason, Float ropamount, Integer rop) {
		this.worker = worker;
		this.ropdate = ropdate;
		this.roptype = roptype;
		this.ropreason = ropreason;
		this.ropamount = ropamount;
		this.rop = rop;
	}

	// Property accessors

	public Integer getRopoid() {
		return this.ropoid;
	}

	public void setRopoid(Integer ropoid) {
		this.ropoid = ropoid;
	}

	public Worker getWorker() {
		return this.worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}

	public Date getRopdate() {
		return this.ropdate;
	}

	public void setRopdate(Date ropdate) {
		this.ropdate = ropdate;
	}

	public String getRoptype() {
		return this.roptype;
	}

	public void setRoptype(String roptype) {
		this.roptype = roptype;
	}

	public String getRopreason() {
		return this.ropreason;
	}

	public void setRopreason(String ropreason) {
		this.ropreason = ropreason;
	}

	public Float getRopamount() {
		return this.ropamount;
	}

	public void setRopamount(Float ropamount) {
		this.ropamount = ropamount;
	}

	public Integer getRop() {
		return this.rop;
	}

	public void setRop(Integer rop) {
		this.rop = rop;
	}

}