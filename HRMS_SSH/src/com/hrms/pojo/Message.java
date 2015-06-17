package com.hrms.pojo;

import java.util.Date;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */

public class Message implements java.io.Serializable {

	// Fields

	private Integer messageOid;
	private Worker worker;
	private Date messageDate;
	private String messageTitle;
	private String messageContent;

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** full constructor */
	public Message(Worker worker, Date messageDate, String messageTitle,
			String messageContent) {
		this.worker = worker;
		this.messageDate = messageDate;
		this.messageTitle = messageTitle;
		this.messageContent = messageContent;
	}

	// Property accessors

	public Integer getMessageOid() {
		return this.messageOid;
	}

	public void setMessageOid(Integer messageOid) {
		this.messageOid = messageOid;
	}

	public Worker getWorker() {
		return this.worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}

	public Date getMessageDate() {
		return this.messageDate;
	}

	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}

	public String getMessageTitle() {
		return this.messageTitle;
	}

	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

	public String getMessageContent() {
		return this.messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

}