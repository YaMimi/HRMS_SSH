package com.hrms.cultivation.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.cultivation.service.CultivationService;
import com.hrms.pojo.Cultivation;
import com.hrms.pojo.Worker;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CultivationAction extends ActionSupport {
	private Cultivation cultivation;
	
	@Resource
	CultivationService cultivationService;
	
	public String showCultivation() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		List<Cultivation> cultivationList = cultivationService.showCultivation();
		session.put("cultivationList", cultivationList);
		return null;
	}
	
	public String newCultivation() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Worker w = (Worker) session.get("activeWorker");
		cultivation.setWorker(w);
		if(cultivation.getCultivationEndDate().getTime() - cultivation.getCultivationBeginDate().getTime() < 0) {
			session.put("state", "DATEERROR");
			return this.ERROR;
		}
		if(cultivationService.insertCultivation(cultivation)!=null) {
			session.put("state", "INSERTSUCCESS");
			return this.SUCCESS;
		}
		session.put("state", "INSERTERROR");
		return this.ERROR;
	}

	public Cultivation getCultivation() {
		return cultivation;
	}

	public void setCultivation(Cultivation cultivation) {
		this.cultivation = cultivation;
	}

	public CultivationService getCultivationService() {
		return cultivationService;
	}

	public void setCultivationService(CultivationService cultivationService) {
		this.cultivationService = cultivationService;
	}	
}
