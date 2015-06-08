package com.hrms.login.dao;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

import com.hrms.pojo.Worker;

public class LoginDaoImpl implements LoginDao {
	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public Worker searchUser(Worker worker) {
		String sql = "select w.workerOid from Worker w where u.workerNo='" +worker.getWorkerNo()+ "'";
		List list = sessionFactory.getCurrentSession().createQuery(sql).list();
		
		if(!list.isEmpty()) {
            Iterator it = list.iterator();  
            while(it.hasNext()) {
                Integer get = (Integer) it.next();
                worker = (Worker) sessionFactory.getCurrentSession().get(Worker.class, get);
                return worker;
            }
		}
		return null;
	}

	@Override
	public String checkUser(Worker worker) {
		String query = "select w.password from Worker w where w.workerNo='" +worker.getWorkerNo()+ "'";
		List list = sessionFactory.getCurrentSession().createQuery(query).list();
		if(!list.isEmpty()) {
            Iterator it = list.iterator();  
            while(it.hasNext()) {
                String get = (String) it.next();
                if(get.equals(worker.getPassword())) {
                    return "CORRECT";
                }
            }
            return "WRONG";
        }
		return "EMPTY";
	}

}
