package vn.iotstar.controller.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.impl.service.PaperService;
import vn.iotstar.service.IPaperService;
import vn.iotstar.entity.*;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = { "/user/favoriteList" })
public class favoriteListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperService paperService = new PaperService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		if (user == null) {
			String currentUrl = req.getRequestURI(); // lấy URL hiện tại
			System.out.println("Current URL: " + currentUrl);
			resp.sendRedirect(req.getContextPath() + "/user/login?redirect=" + currentUrl); // chuyển hướng kèm theo URL gốc
			System.out.println("Current URL: " + currentUrl);
			System.out.println("User in session: " + user);
			return;
		} else {
			List<FavoriteList> favoriteList = paperService.getFavoriteListByUserId(user.getId());
			req.setAttribute("favoriteList", favoriteList);
			req.getRequestDispatcher("/views/user/favoriteList.jsp").forward(req, resp);
		}
	}
}
