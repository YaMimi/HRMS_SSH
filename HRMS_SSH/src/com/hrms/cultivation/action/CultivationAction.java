package com.hrms.cultivation.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.cultivation.service.CultivationService;
import com.hrms.pojo.Cultivation;
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
}
