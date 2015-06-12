package com.hrms.message.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

import com.hrms.pojo.Message;

public class MessageDaoImpl implements MessageDao {

	@Resource
	SessionFactory sessionFactory;
	
	@Override
	public List<Message> checkMessage() {
		String query = "from Message order by messageOid desc";
		List<Message> messageList = sessionFactory.getCurrentSession().createQuery(query).list();
		return messageList;
	}

	@Override
	public Message insertMessage(Message message) {
		sessionFactory.getCurrentSession().persist(message);
		return message;
	}

	@Override
	public void deleteMessage(int messageOid) {
		// TODO Auto-generated method stub

	}

}
