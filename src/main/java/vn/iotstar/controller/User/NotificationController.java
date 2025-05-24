package vn.iotstar.controller.User;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.Notification;
import vn.iotstar.entity.Paper;
import vn.iotstar.entity.User;
import vn.iotstar.impl.service.NotificationService;
import vn.iotstar.impl.service.PaperService;
import vn.iotstar.service.INotificationService;
import vn.iotstar.service.IPaperService;

@WebServlet(urlPatterns = { "/user/notify" })
public class NotificationController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private INotificationService notificationService = new NotificationService();
	private IPaperService paperService = new PaperService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		// 1. Lấy bài báo và người dùng từ request/session
		User author = (User) req.getSession().getAttribute("currentUser");

		List<Paper> listPa = paperService.getAllPapers();

		for (Paper paper : listPa) {
			if (author != null && paper.getStatus() != 0) {
				Notification noti = new Notification();

				String content = "Tác giả \"" + author.getFullname() + "\" vừa đăng bài viết mới: \""
						+ paper.getPaperName() + "\"";
				String sentDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

				noti.setContent(content);
				noti.setSentDate(sentDate);
				noti.setSender(author);
				noti.setReceiver(null);

				notificationService.save(noti);
			}
		}
		List<Notification> list = notificationService.getAllNotifications();
		req.setAttribute("NotiList", list);

		for (Notification n : list) {
			System.out.println(n.getContent());
		}
		req.getRequestDispatcher("/views/header.jsp").forward(req, resp);
	}
}
