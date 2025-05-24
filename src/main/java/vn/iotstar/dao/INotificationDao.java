package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.Notification;

public interface INotificationDao {
	public void save(Notification notification);
	public List<Notification> getAllNotifications();

}
