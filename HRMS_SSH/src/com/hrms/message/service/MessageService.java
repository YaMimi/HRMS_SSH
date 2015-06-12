package com.hrms.message.service;

import java.util.List;

import com.hrms.pojo.Message;

public interface MessageService {
	public List<Message> checkMessage();
	public Message insertMessage(Message message);
	public void deleteMessage(int messageOid);
}
