package vn.iotstar.service;

import java.util.List;

import vn.iotstar.entity.Notification;

public interface INotificationService {
	public void save(Notification notification);
	public List<Notification> getAllNotifications();
}
