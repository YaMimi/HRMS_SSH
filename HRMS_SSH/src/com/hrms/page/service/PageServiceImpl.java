package com.hrms.page.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.page.bean.PageBean;
import com.hrms.page.dao.PageDao;
@Transactional
public class PageServiceImpl implements PageService {

	@Resource
	PageDao pagedao;
	
	/**
     * pageSizeΪÿҳ��ʾ�ļ�¼��
     * pageΪ��ǰ��ʾ����ҳ
     */
	@Override
	public PageBean getPageBean(String hql, int pageSize, int page) {
		// TODO Auto-generated method stub
		PageBean pageBean = new PageBean();
		int totalPage = pageBean.getTotalPages(pageSize, pagedao.getAllRowCount(hql));//��ҳ��
		//System.out.println("LODpage = "+page); 
		int currentPage = pageBean.getCurPage(page);//��ǰҳ
		int offset = pageBean.getCurrentPageOffset(pageSize, currentPage);
		
		List<Object> list = pagedao.queryByPage(hql, offset, pageSize);
		
		pageBean.setList(list);
        pageBean.setAllRows(pagedao.getAllRowCount(hql));
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        //System.out.println(pageBean.getTotalPage()); 
//        System.out.println("CurrentPage = "+pageBean.getCurrentPage()); 
//        System.out.println("TotalPage = "+pageBean.getTotalPage()); 
//        System.out.println("==========================="); 
		return pageBean;
	}

}
