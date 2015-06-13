package com.hrms.page.dao;

import java.util.List;

public interface PageDao {
    
    public int getAllRowCount(String hql);

    public <T> List<T> queryByPage(String hql, int offset, int pageSize);
}
