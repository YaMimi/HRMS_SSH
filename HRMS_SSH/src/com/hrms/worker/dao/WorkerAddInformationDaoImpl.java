package com.hrms.worker.dao;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.hrms.pojo.Department;
import com.hrms.pojo.Worker;

public class WorkerAddInformationDaoImpl implements WorkerAddInformationDao {

	@Resource
	private SessionFactory sessionFactory;
	
	/* (non-Javadoc)
	 * @see com.hrms.workerinformation.dao.WorkerAddInformationDao#SelectAllDepartmen(java.lang.String)
	 */
	@Override
	public ArrayList<Department> SelectAllDepartmen(String hql){
		ArrayList<Department> department1=(ArrayList<Department>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return department1;
		
	}

	@Override
	public Worker SaveWorkers(Worker worker) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(worker);
		return worker;
	}

	@Override
	public ArrayList<Worker> SelectCurrentWorkers(String hql) {
		ArrayList<Worker> department1=(ArrayList<Worker>) sessionFactory.getCurrentSession().createQuery(hql).list();
		
		return department1;
		
	}

	@Override
	public ArrayList<Worker> SelectAllWorkers(String hql) {
		// TODO Auto-generated method stub
		ArrayList<Worker> workers=(ArrayList<Worker>) sessionFactory.getCurrentSession().createQuery(hql).list();
		
		ArrayList list=new ArrayList();
		for(int i=0;i<workers.size();i++){
			list.add(workers.get(i).getDepartment().getDepartmentName());
		}
		
		return workers;
	}
	

	@Override
	public int DeleteWorker(String workerNo) {
		// TODO Auto-generated method stub
		  String hql1="delete Worker  where WorkerNo=?";

		  Query query=sessionFactory.getCurrentSession().createQuery(hql1);

		  query.setString(0, workerNo);

		  int result=query.executeUpdate();
		  return result;
	}

	@Override 
	public void UpdateWorker(Worker worker) {
		// TODO Auto-generated method stub
		Worker worker1=(Worker)sessionFactory.getCurrentSession().get(Worker.class, worker.getWorkerOid());
		worker1.setWorkerName(worker.getWorkerName());
		worker1.setWorkerNo(worker.getWorkerNo());
		worker1.setWorkerSex(worker.getWorkerSex());
		worker1.setDepartment(worker.getDepartment());
		worker1.setWorkerPermission(worker.getWorkerPermission());
		worker1.setWorkerEntryDate(worker.getWorkerEntryDate());
		worker1.setWorkerId(worker.getWorkerId());
		worker1.setWorkerBirthDate(worker.getWorkerBirthDate());
		worker1.setWorkerBirthPlace(worker.getWorkerBirthPlace());
		worker1.setWorkerAddress(worker.getWorkerAddress());
		worker1.setWorkerBloodType(worker.getWorkerBloodType());
		worker1.setWorkerPolitical(worker.getWorkerPolitical());
		worker1.setWorkerEthnic(worker.getWorkerEthnic());
		worker1.setWorkerEducation(worker.getWorkerEducation());
		worker1.setWorkerPhone(worker.getWorkerPhone());
		worker1.setWorkerNationality(worker.getWorkerNationality());
		worker1.setPassword(worker.getPassword());
		sessionFactory.getCurrentSession().update(worker1);
		
	}

	@Override
	public void flush() {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public ArrayList lWorkersAddDepartment() {
		// TODO Auto-generated method stub
		String sql="from Worker";
ArrayList<Worker> workers=(ArrayList<Worker>) sessionFactory.getCurrentSession().createQuery(sql).list();
		
		ArrayList list=new ArrayList();
		for(int i=0;i<workers.size();i++){
			list.add(workers.get(i).getDepartment().getDepartmentName());
		}
		
		return list;
	}

	@Override
	public ArrayList<Worker> EveryPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		String queryString="from Worker";
		Query queryObject= sessionFactory.getCurrentSession().createQuery(queryString);
		queryObject.setFirstResult((pageNo-1)*pageSize);
		queryObject.setMaxResults(pageSize);
		
		return (ArrayList<Worker>) queryObject.list();
	}

	@Override
	public int updateWorkerPassword(Worker worker,String newPassword,int workerOid) {
		// TODO Auto-generated method stub
		int result;
		Worker worker1=(Worker)sessionFactory.getCurrentSession().get(Worker.class, workerOid);
		//if(worker1.getPassword().equals(worker.getPassword())){//如果相等则修改
		String sql="UPDATE Worker SET Password=? WHERE WorkerOid=?";
		if(worker.getPassword().equals(worker1.getPassword())){
		Query query=sessionFactory.getCurrentSession().createQuery(sql);
		query.setString(0, newPassword);
		query.setInteger(1,workerOid );
		result=query.executeUpdate();
		}else{
			result=0;
		}
		return result;
	}
	
}
