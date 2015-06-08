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

	// Constructors

	/** default constructor */
	public Attendance() {
	}

	/** full constructor */
	public Attendance(Worker worker, Date attendanceDate,
			Time attendanceOnTime, Time attendanceOffTime) {
		this.worker = worker;
		this.attendanceDate = attendanceDate;
		this.attendanceOnTime = attendanceOnTime;
		this.attendanceOffTime = attendanceOffTime;
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

}