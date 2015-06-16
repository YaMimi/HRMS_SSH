package com.hrms.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * Worker entity. @author MyEclipse Persistence Tools
 */

public class Worker  implements java.io.Serializable {


    // Fields    

     private Integer workerOid;
     private Department department;
     private String workerNo;
     private String workerName;
     private String workerSex;
     private Integer workerPermission;
     private Date workerEntryDate;
     private String workerId;
     private Date workerBirthDate;
     private String workerBirthPlace;
     private String workerAddress;
     private String workerBloodType;
     private String workerPolitical;
     private String workerNationality;
     private String workerEthnic;
     private String workerEducation;
     private String workerPhone;
     private String password;
     private Integer workerUnreadMessage;
     private Set vacations = new HashSet(0);
     private Set cultivationsigns = new HashSet(0);
     private Set rewardorpunishments = new HashSet(0);
     private Set salaries = new HashSet(0);
     private Set cultivationpersons = new HashSet(0);
     private Set messages = new HashSet(0);
     private Set cultivations = new HashSet(0);
     private Set attendances = new HashSet(0);


    // Constructors

    /** default constructor */
    public Worker() {
    }

	/** minimal constructor */
    public Worker(Department department, String workerNo, String workerName, String workerSex, Integer workerPermission, Date workerEntryDate, String workerId, Date workerBirthDate, String workerBirthPlace, String workerAddress, String workerBloodType, String workerPolitical, String workerNationality, String workerEthnic, String workerEducation, String workerPhone, String password) {
        this.department = department;
        this.workerNo = workerNo;
        this.workerName = workerName;
        this.workerSex = workerSex;
        this.workerPermission = workerPermission;
        this.workerEntryDate = workerEntryDate;
        this.workerId = workerId;
        this.workerBirthDate = workerBirthDate;
        this.workerBirthPlace = workerBirthPlace;
        this.workerAddress = workerAddress;
        this.workerBloodType = workerBloodType;
        this.workerPolitical = workerPolitical;
        this.workerNationality = workerNationality;
        this.workerEthnic = workerEthnic;
        this.workerEducation = workerEducation;
        this.workerPhone = workerPhone;
        this.password = password;
    }
    
    /** full constructor */
    public Worker(Department department, String workerNo, String workerName, String workerSex, Integer workerPermission, Date workerEntryDate, String workerId, Date workerBirthDate, String workerBirthPlace, String workerAddress, String workerBloodType, String workerPolitical, String workerNationality, String workerEthnic, String workerEducation, String workerPhone, String password, Integer workerUnreadMessage, Set vacations, Set cultivationsigns, Set rewardorpunishments, Set salaries, Set cultivationpersons, Set messages, Set cultivations, Set attendances) {
        this.department = department;
        this.workerNo = workerNo;
        this.workerName = workerName;
        this.workerSex = workerSex;
        this.workerPermission = workerPermission;
        this.workerEntryDate = workerEntryDate;
        this.workerId = workerId;
        this.workerBirthDate = workerBirthDate;
        this.workerBirthPlace = workerBirthPlace;
        this.workerAddress = workerAddress;
        this.workerBloodType = workerBloodType;
        this.workerPolitical = workerPolitical;
        this.workerNationality = workerNationality;
        this.workerEthnic = workerEthnic;
        this.workerEducation = workerEducation;
        this.workerPhone = workerPhone;
        this.password = password;
        this.workerUnreadMessage = workerUnreadMessage;
        this.vacations = vacations;
        this.cultivationsigns = cultivationsigns;
        this.rewardorpunishments = rewardorpunishments;
        this.salaries = salaries;
        this.cultivationpersons = cultivationpersons;
        this.messages = messages;
        this.cultivations = cultivations;
        this.attendances = attendances;
    }

   
    // Property accessors

    public Integer getWorkerOid() {
        return this.workerOid;
    }
    
    public void setWorkerOid(Integer workerOid) {
        this.workerOid = workerOid;
    }

    public Department getDepartment() {
        return this.department;
    }
    
    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getWorkerNo() {
        return this.workerNo;
    }
    
    public void setWorkerNo(String workerNo) {
        this.workerNo = workerNo;
    }

    public String getWorkerName() {
        return this.workerName;
    }
    
    public void setWorkerName(String workerName) {
        this.workerName = workerName;
    }

    public String getWorkerSex() {
        return this.workerSex;
    }
    
    public void setWorkerSex(String workerSex) {
        this.workerSex = workerSex;
    }

    public Integer getWorkerPermission() {
        return this.workerPermission;
    }
    
    public void setWorkerPermission(Integer workerPermission) {
        this.workerPermission = workerPermission;
    }

    public Date getWorkerEntryDate() {
        return this.workerEntryDate;
    }
    
    public void setWorkerEntryDate(Date workerEntryDate) {
        this.workerEntryDate = workerEntryDate;
    }

    public String getWorkerId() {
        return this.workerId;
    }
    
    public void setWorkerId(String workerId) {
        this.workerId = workerId;
    }

    public Date getWorkerBirthDate() {
        return this.workerBirthDate;
    }
    
    public void setWorkerBirthDate(Date workerBirthDate) {
        this.workerBirthDate = workerBirthDate;
    }

    public String getWorkerBirthPlace() {
        return this.workerBirthPlace;
    }
    
    public void setWorkerBirthPlace(String workerBirthPlace) {
        this.workerBirthPlace = workerBirthPlace;
    }

    public String getWorkerAddress() {
        return this.workerAddress;
    }
    
    public void setWorkerAddress(String workerAddress) {
        this.workerAddress = workerAddress;
    }

    public String getWorkerBloodType() {
        return this.workerBloodType;
    }
    
    public void setWorkerBloodType(String workerBloodType) {
        this.workerBloodType = workerBloodType;
    }

    public String getWorkerPolitical() {
        return this.workerPolitical;
    }
    
    public void setWorkerPolitical(String workerPolitical) {
        this.workerPolitical = workerPolitical;
    }

    public String getWorkerNationality() {
        return this.workerNationality;
    }
    
    public void setWorkerNationality(String workerNationality) {
        this.workerNationality = workerNationality;
    }

    public String getWorkerEthnic() {
        return this.workerEthnic;
    }
    
    public void setWorkerEthnic(String workerEthnic) {
        this.workerEthnic = workerEthnic;
    }

    public String getWorkerEducation() {
        return this.workerEducation;
    }
    
    public void setWorkerEducation(String workerEducation) {
        this.workerEducation = workerEducation;
    }

    public String getWorkerPhone() {
        return this.workerPhone;
    }
    
    public void setWorkerPhone(String workerPhone) {
        this.workerPhone = workerPhone;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getWorkerUnreadMessage() {
        return this.workerUnreadMessage;
    }
    
    public void setWorkerUnreadMessage(Integer workerUnreadMessage) {
        this.workerUnreadMessage = workerUnreadMessage;
    }

    public Set getVacations() {
        return this.vacations;
    }
    
    public void setVacations(Set vacations) {
        this.vacations = vacations;
    }

    public Set getCultivationsigns() {
        return this.cultivationsigns;
    }
    
    public void setCultivationsigns(Set cultivationsigns) {
        this.cultivationsigns = cultivationsigns;
    }

    public Set getRewardorpunishments() {
        return this.rewardorpunishments;
    }
    
    public void setRewardorpunishments(Set rewardorpunishments) {
        this.rewardorpunishments = rewardorpunishments;
    }

    public Set getSalaries() {
        return this.salaries;
    }
    
    public void setSalaries(Set salaries) {
        this.salaries = salaries;
    }

    public Set getCultivationpersons() {
        return this.cultivationpersons;
    }
    
    public void setCultivationpersons(Set cultivationpersons) {
        this.cultivationpersons = cultivationpersons;
    }

    public Set getMessages() {
        return this.messages;
    }
    
    public void setMessages(Set messages) {
        this.messages = messages;
    }

    public Set getCultivations() {
        return this.cultivations;
    }
    
    public void setCultivations(Set cultivations) {
        this.cultivations = cultivations;
    }

    public Set getAttendances() {
        return this.attendances;
    }
    
    public void setAttendances(Set attendances) {
        this.attendances = attendances;
    }
   








}