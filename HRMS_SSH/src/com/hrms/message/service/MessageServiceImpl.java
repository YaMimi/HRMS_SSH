package com.hrms.message.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.hrms.message.dao.MessageDao;
import com.hrms.pojo.Message;
@Transactional
public class MessageServiceImpl implements MessageService {

	@Resource
	MessageDao messageDao;
	
	@Override
	public List<Message> checkMessage() {
		// TODO Auto-generated method stub
		return messageDao.checkMessage();
	}

	@Override
	public Message insertMessage(Message message) {
		// TODO Auto-generated method stub
		return messageDao.insertMessage(message);
	}

	@Override
	public void deleteMessage(int messageOid) {
		// TODO Auto-generated method stub

	}

}
