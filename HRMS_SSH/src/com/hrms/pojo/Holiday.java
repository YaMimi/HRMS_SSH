package com.hrms.pojo;

import java.util.Date;

/**
 * Holiday entity. @author MyEclipse Persistence Tools
 */

public class Holiday implements java.io.Serializable {

	// Fields

	private Integer holidayOid;
	private Date holidayDate;
	private String holidayContent;

	// Constructors

	/** default constructor */
	public Holiday() {
	}

	/** full constructor */
	public Holiday(Date holidayDate, String holidayContent) {
		this.holidayDate = holidayDate;
		this.holidayContent = holidayContent;
	}

	// Property accessors

	public Integer getHolidayOid() {
		return this.holidayOid;
	}

	public void setHolidayOid(Integer holidayOid) {
		this.holidayOid = holidayOid;
	}

	public Date getHolidayDate() {
		return this.holidayDate;
	}

	public void setHolidayDate(Date holidayDate) {
		this.holidayDate = holidayDate;
	}

	public String getHolidayContent() {
		return this.holidayContent;
	}

	public void setHolidayContent(String holidayContent) {
		this.holidayContent = holidayContent;
	}

}