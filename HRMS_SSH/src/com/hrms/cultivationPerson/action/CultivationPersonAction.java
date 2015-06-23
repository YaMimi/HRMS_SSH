package com.hrms.cultivationPerson.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.cultivation.service.CultivationService;
import com.hrms.cultivationPerson.service.CultivationPersonService;
import com.hrms.pojo.Cultivation;
import com.hrms.pojo.Cultivationperson;
import com.hrms.pojo.Worker;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CultivationPersonAction extends ActionSupport {
	private Cultivationperson cultivationPerson;
	private String cultivationOid;
	private String cultivationPersonOid;
	
	@Resource
	CultivationPersonService cultivationPersonService;
	@Resource
	CultivationService cultivationService;
	
	
	public String deleteCultivationPerson() {
		cultivationPersonService.deleteCultivation(Integer.parseInt(cultivationPersonOid));
		return this.SUCCESS;
	}
	
	public String newCultivationPerson() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Worker w = (Worker) session.get("activeWorker");
		Cultivation c = cultivationService.findCultivation(Integer.parseInt(cultivationOid));
		Cultivationperson cp = new Cultivationperson();
		cp.setCultivation(c);
		cp.setWorker(w);
		
		cultivationPersonService.insertCultivation(cp);
		cp = null;
		
		return this.SUCCESS;
	}

	public Cultivationperson getCultivationPerson() {
		return cultivationPerson;
	}

	public void setCultivationPerson(Cultivationperson cultivationPerson) {
		this.cultivationPerson = cultivationPerson;
	}

	public String getCultivationPersonOid() {
		return cultivationPersonOid;
	}

	public void setCultivationPersonOid(String cultivationPersonOid) {
		this.cultivationPersonOid = cultivationPersonOid;
	}

	public CultivationPersonService getCultivationPersonService() {
		return cultivationPersonService;
	}

	public void setCultivationPersonService(
			CultivationPersonService cultivationPersonService) {
		this.cultivationPersonService = cultivationPersonService;
	}

	public String getCultivationOid() {
		return cultivationOid;
	}

	public void setCultivationOid(String cultivationOid) {
		this.cultivationOid = cultivationOid;
	}

	public CultivationService getCultivationService() {
		return cultivationService;
	}

	public void setCultivationService(CultivationService cultivationService) {
		this.cultivationService = cultivationService;
	}
	
}
