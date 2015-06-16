package com.hrms.cultivationPerson.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.cultivationPerson.service.CultivationPersonService;
import com.hrms.pojo.Cultivationperson;
import com.hrms.pojo.Worker;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CultivationPersonAction extends ActionSupport {
	private Cultivationperson cultivationPerson;
	
	@Resource
	CultivationPersonService cultivationPersonService;
	
	public String checkCultivationPersonUnfinished() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Worker worker = (Worker) session.get("activeWorker");
		if(worker==null) {
			return this.LOGIN;
		}
		List<Cultivationperson> cultivationPersonUList = cultivationPersonService.checkCultivationUnfinished(worker);
		int cultivationPersonUNum = cultivationPersonUList.size();
		session.put("cultivationPersonUList", cultivationPersonUList);
		session.put("cultivationPersonUNum", cultivationPersonUNum);
		return null;
	}
	
	public String checkCultivationPersonFinished() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Worker worker = (Worker) session.get("activeWorker");
		if(worker==null) {
			return this.LOGIN;
		}
		List<Cultivationperson> cultivationPersonList = cultivationPersonService.checkCultivationFinished(worker);
		session.put("cultivationPersonList", cultivationPersonList);
		return null;
	}
}
