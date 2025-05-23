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

@WebServlet(urlPatterns = { "/favorite/list" })
public class favoriteListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperService paperService = new PaperService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("account");

		if (user == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		List<FavoriteList> favoriteList = paperService.getFavoriteListByUserId(user.getId());

		req.setAttribute("favoriteList", favoriteList);

		req.getRequestDispatcher("/WEB-INF/views/user/favoriteList.jsp").forward(req, resp);
	}
}
