package com.hrms.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * Cultivation entity. @author MyEclipse Persistence Tools
 */

public class Cultivation  implements java.io.Serializable {


    // Fields    

     private Integer cultivationOid;
     private Worker worker;
     private String cultivationProject;
     private String cultivationType;
     private String cultivationInstruction;
     private String cultivationLocation;
     private Date cultivationBeginDate;
     private Date cultivationEndDate;
     private Set cultivationpersons = new HashSet(0);
     private Set cultivationsigns = new HashSet(0);


    // Constructors

    /** default constructor */
    public Cultivation() {
    }

	/** minimal constructor */
    public Cultivation(Worker worker, String cultivationProject, String cultivationType, String cultivationInstruction, String cultivationLocation, Date cultivationBeginDate, Date cultivationEndDate) {
        this.worker = worker;
        this.cultivationProject = cultivationProject;
        this.cultivationType = cultivationType;
        this.cultivationInstruction = cultivationInstruction;
        this.cultivationLocation = cultivationLocation;
        this.cultivationBeginDate = cultivationBeginDate;
        this.cultivationEndDate = cultivationEndDate;
    }
    
    /** full constructor */
    public Cultivation(Worker worker, String cultivationProject, String cultivationType, String cultivationInstruction, String cultivationLocation, Date cultivationBeginDate, Date cultivationEndDate, Set cultivationpersons, Set cultivationsigns) {
        this.worker = worker;
        this.cultivationProject = cultivationProject;
        this.cultivationType = cultivationType;
        this.cultivationInstruction = cultivationInstruction;
        this.cultivationLocation = cultivationLocation;
        this.cultivationBeginDate = cultivationBeginDate;
        this.cultivationEndDate = cultivationEndDate;
        this.cultivationpersons = cultivationpersons;
        this.cultivationsigns = cultivationsigns;
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

    public String getCultivationProject() {
        return this.cultivationProject;
    }
    
    public void setCultivationProject(String cultivationProject) {
        this.cultivationProject = cultivationProject;
    }

    public String getCultivationType() {
        return this.cultivationType;
    }
    
    public void setCultivationType(String cultivationType) {
        this.cultivationType = cultivationType;
    }

    public String getCultivationInstruction() {
        return this.cultivationInstruction;
    }
    
    public void setCultivationInstruction(String cultivationInstruction) {
        this.cultivationInstruction = cultivationInstruction;
    }

    public String getCultivationLocation() {
        return this.cultivationLocation;
    }
    
    public void setCultivationLocation(String cultivationLocation) {
        this.cultivationLocation = cultivationLocation;
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

    public Set getCultivationpersons() {
        return this.cultivationpersons;
    }
    
    public void setCultivationpersons(Set cultivationpersons) {
        this.cultivationpersons = cultivationpersons;
    }

    public Set getCultivationsigns() {
        return this.cultivationsigns;
    }
    
    public void setCultivationsigns(Set cultivationsigns) {
        this.cultivationsigns = cultivationsigns;
    }
   








}