package com.hrms.pojo;



/**
 * Cultivationsign entity. @author MyEclipse Persistence Tools
 */

public class Cultivationsign  implements java.io.Serializable {


    // Fields    

     private Integer cultivationSignOid;
     private Worker worker;
     private Cultivation cultivation;
     private Integer cultivationSignResult;


    // Constructors

    /** default constructor */
    public Cultivationsign() {
    }

	/** minimal constructor */
    public Cultivationsign(Worker worker, Cultivation cultivation) {
        this.worker = worker;
        this.cultivation = cultivation;
    }
    
    /** full constructor */
    public Cultivationsign(Worker worker, Cultivation cultivation, Integer cultivationSignResult) {
        this.worker = worker;
        this.cultivation = cultivation;
        this.cultivationSignResult = cultivationSignResult;
    }

   
    // Property accessors

    public Integer getCultivationSignOid() {
        return this.cultivationSignOid;
    }
    
    public void setCultivationSignOid(Integer cultivationSignOid) {
        this.cultivationSignOid = cultivationSignOid;
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

    public Integer getCultivationSignResult() {
        return this.cultivationSignResult;
    }
    
    public void setCultivationSignResult(Integer cultivationSignResult) {
        this.cultivationSignResult = cultivationSignResult;
    }
   








}