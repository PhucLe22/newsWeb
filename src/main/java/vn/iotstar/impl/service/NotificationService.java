package vn.iotstar.impl.service;

import java.util.List;

import vn.iotstar.service.INotificationService;
import vn.iotstar.dao.INotificationDao;
import vn.iotstar.entity.Notification;
import vn.iotstar.impl.dao.NotificationDao;

public class NotificationService implements INotificationService {

	private INotificationDao notificationDao = new NotificationDao();
	
	@Override
	public void save(Notification notification)
	{
		notificationDao.save(notification);
	}
	public List<Notification> getAllNotifications()
	{
		return notificationDao.getAllNotifications();
	}

}
