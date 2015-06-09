package com.hrms.pojo;

import java.util.Date;

/**
 * Affiche entity. @author MyEclipse Persistence Tools
 */

public class Affiche implements java.io.Serializable {

	// Fields

	private Integer afficheOid;
	private Worker worker;
	private Date afficheDate;
	private String afficheTitle;
	private String afficheContent;

	// Constructors

	/** default constructor */
	public Affiche() {
	}

	/** full constructor */
	public Affiche(Worker worker, Date afficheDate, String afficheTitle,
			String afficheContent) {
		this.worker = worker;
		this.afficheDate = afficheDate;
		this.afficheTitle = afficheTitle;
		this.afficheContent = afficheContent;
	}

	// Property accessors

	public Integer getAfficheOid() {
		return this.afficheOid;
	}

	public void setAfficheOid(Integer afficheOid) {
		this.afficheOid = afficheOid;
	}

	public Worker getWorker() {
		return this.worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}

	public Date getAfficheDate() {
		return this.afficheDate;
	}

	public void setAfficheDate(Date afficheDate) {
		this.afficheDate = afficheDate;
	}

	public String getAfficheTitle() {
		return this.afficheTitle;
	}

	public void setAfficheTitle(String afficheTitle) {
		this.afficheTitle = afficheTitle;
	}

	public String getAfficheContent() {
		return this.afficheContent;
	}

	public void setAfficheContent(String afficheContent) {
		this.afficheContent = afficheContent;
	}

}