package com.hrms.message.dao;

import java.util.List;

import com.hrms.pojo.Message;

public interface MessageDao {
	public List<Message> checkMessage();
	public Message insertMessage(Message message);
	public void deleteMessage(int messageOid);
}
