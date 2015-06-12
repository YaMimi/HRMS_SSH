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
	public List<Worker> showWorker() {
		String query = "from Worker";
		List<Worker> workerList = sessionFactory.getCurrentSession().createQuery(query).list();
		return workerList;
	}
	
	@Override
	public Worker searchWorker(Worker worker) {
		String query = "select w.workerOid from Worker w where w.workerNo='" +worker.getWorkerNo()+ "'";
		List list = sessionFactory.getCurrentSession().createQuery(query).list();
		
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
	public Worker updateWorker(Worker worker) {
		sessionFactory.getCurrentSession().merge(worker);
		return worker;
	}

	@Override
	public String checkWorker(Worker worker) {
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
