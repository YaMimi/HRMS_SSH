package com.hrms.pojo;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */

public class Message implements java.io.Serializable {

	// Fields

	private Integer messageOid;
	private Worker workerByMessageToWorkerOid;
	private Worker workerByMessageFromWorkerOid;
	private String messageContent;
	private String messageDate;

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** full constructor */
	public Message(Worker workerByMessageToWorkerOid,
			Worker workerByMessageFromWorkerOid, String messageContent,
			String messageDate) {
		this.workerByMessageToWorkerOid = workerByMessageToWorkerOid;
		this.workerByMessageFromWorkerOid = workerByMessageFromWorkerOid;
		this.messageContent = messageContent;
		this.messageDate = messageDate;
	}

	// Property accessors

	public Integer getMessageOid() {
		return this.messageOid;
	}

	public void setMessageOid(Integer messageOid) {
		this.messageOid = messageOid;
	}

	public Worker getWorkerByMessageToWorkerOid() {
		return this.workerByMessageToWorkerOid;
	}

	public void setWorkerByMessageToWorkerOid(Worker workerByMessageToWorkerOid) {
		this.workerByMessageToWorkerOid = workerByMessageToWorkerOid;
	}

	public Worker getWorkerByMessageFromWorkerOid() {
		return this.workerByMessageFromWorkerOid;
	}

	public void setWorkerByMessageFromWorkerOid(
			Worker workerByMessageFromWorkerOid) {
		this.workerByMessageFromWorkerOid = workerByMessageFromWorkerOid;
	}

	public String getMessageContent() {
		return this.messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getMessageDate() {
		return this.messageDate;
	}

	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}

}