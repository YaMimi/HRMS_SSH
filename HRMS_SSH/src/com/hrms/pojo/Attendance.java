package com.hrms.pojo;

import java.sql.Time;
import java.util.Date;

/**
 * Attendance entity. @author MyEclipse Persistence Tools
 */

public class Attendance implements java.io.Serializable {

	// Fields

	private Integer attendanceOid;
	private Worker worker;
	private Date attendanceDate;
	private Time attendanceOnTime;
	private Time attendanceOffTime;
	private Integer attendanceState;

	// Constructors

	/** default constructor */
	public Attendance() {
	}

	/** minimal constructor */
	public Attendance(Worker worker, Date attendanceDate,
			Integer attendanceState) {
		this.worker = worker;
		this.attendanceDate = attendanceDate;
		this.attendanceState = attendanceState;
	}

	/** full constructor */
	public Attendance(Worker worker, Date attendanceDate,
			Time attendanceOnTime, Time attendanceOffTime,
			Integer attendanceState) {
		this.worker = worker;
		this.attendanceDate = attendanceDate;
		this.attendanceOnTime = attendanceOnTime;
		this.attendanceOffTime = attendanceOffTime;
		this.attendanceState = attendanceState;
	}

	// Property accessors

	public Integer getAttendanceOid() {
		return this.attendanceOid;
	}

	public void setAttendanceOid(Integer attendanceOid) {
		this.attendanceOid = attendanceOid;
	}

	public Worker getWorker() {
		return this.worker;
	}

	public void setWorker(Worker worker) {
		this.worker = worker;
	}

	public Date getAttendanceDate() {
		return this.attendanceDate;
	}

	public void setAttendanceDate(Date attendanceDate) {
		this.attendanceDate = attendanceDate;
	}

	public Time getAttendanceOnTime() {
		return this.attendanceOnTime;
	}

	public void setAttendanceOnTime(Time attendanceOnTime) {
		this.attendanceOnTime = attendanceOnTime;
	}

	public Time getAttendanceOffTime() {
		return this.attendanceOffTime;
	}

	public void setAttendanceOffTime(Time attendanceOffTime) {
		this.attendanceOffTime = attendanceOffTime;
	}

	public Integer getAttendanceState() {
		return this.attendanceState;
	}

	public void setAttendanceState(Integer attendanceState) {
		this.attendanceState = attendanceState;
	}

}