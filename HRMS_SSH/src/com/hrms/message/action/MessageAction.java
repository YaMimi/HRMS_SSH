package com.hrms.message.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.hrms.login.service.LoginService;
import com.hrms.message.service.MessageService;
import com.hrms.page.bean.PageBean;
import com.hrms.page.service.PageService;
import com.hrms.pojo.Message;
import com.hrms.pojo.Worker;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MessageAction extends ActionSupport {
	private Message message;
	
	@Resource
	MessageService messageService;
	@Resource
	LoginService loginService;
	@Resource
	private PageService pageserivce;
	private int page;
	
	
	public String checkMessage() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		List<Message> messageList = messageService.checkMessage().subList(0, 3);
		session.put("messageList", messageList);
		Worker worker = (Worker) session.get("activeWorker");
		if(worker!=null) {
			worker = loginService.searchWorker(worker);
			session.put("activeWorker", worker);
		}
		return null;
	}
	
	public String showMessage() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String hql = "from Message order by messageOid desc";
		PageBean pageBean = pageserivce.getPageBean(hql, 5, page);
		session.put("messageListFull", pageBean.getList());
		session.put("pageBean", pageBean);
		Worker worker = (Worker) session.get("activeWorker");
		if(worker!=null) {
			worker = loginService.searchWorker(worker);
			worker.setWorkerUnreadMessage(0);
			worker = loginService.updateWorker(worker);
			session.put("activeWorker", worker);
		}
		return SUCCESS;
	}
	
	public String newMessage() {
		Date date = new Date();
		Map<String, Object> session = ActionContext.getContext().getSession();
		Worker worker = (Worker) session.get("activeWorker");
		message.setMessageDate(date);
		message.setWorker(worker);
		if(worker==null) {
			session.put("state", "LOGINPLEASE");
			return this.NONE;
		}
		
		if(messageService.insertMessage(message)!=null) {
			
			List<Worker> workerList = loginService.showWorker();
			if(worker!=null)
				for(Worker worker1 : workerList) {
					worker1.setWorkerUnreadMessage(worker1.getWorkerUnreadMessage()+1);
					loginService.updateWorker(worker1);
				}
			message = null;
			session.put("state", "SENDMSGSUCCESS");
			return this.SUCCESS;
		}
		message = null;
		session.put("state", "SENDMSGFAILED");
		return this.ERROR;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public MessageService getMessageService() {
		return messageService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public PageService getPageserivce() {
		return pageserivce;
	}

	public void setPageserivce(PageService pageserivce) {
		this.pageserivce = pageserivce;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	
}
