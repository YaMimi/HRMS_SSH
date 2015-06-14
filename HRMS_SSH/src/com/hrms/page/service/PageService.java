package com.hrms.page.service;

import com.hrms.page.bean.PageBean;

public interface PageService {
	public PageBean getPageBean(String hql, int pageSize, int page);
}
