package vn.iotstar.controller.Author;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.*;
import vn.iotstar.impl.service.*;
import vn.iotstar.service.*;

@WebServlet(urlPatterns = { "/author/paper/list" })

public class PaperController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperService paperService = new PaperService();
	private IPaperDetailService paperDetailService = new PaperDetailService();
	private INotificationService notificationService = new NotificationService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Paper> listPaper = paperService.getAllPapers();
		List<PaperDetail> listDetail = paperDetailService.getAllPaperDetails();

		req.setAttribute("ListPaper", listPaper);
		req.setAttribute("ListDetail", listDetail);
		req.getRequestDispatcher("/views/author/paperList.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User author = (User) req.getSession().getAttribute("currentUser");

		if (author != null) {
			List<Paper> listPa = paperService.getAllPapers().stream().filter(p -> p.getStatus() != 0)
					.collect(Collectors.toList());

			req.setAttribute("paperList", listPa);
			req.getRequestDispatcher("/WEB-INF/views/notification.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("login.jsp"); // hoặc trang báo lỗi chưa đăng nhập
		}
	}
}