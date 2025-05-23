package vn.iotstar.controller.User;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.Paper;
import vn.iotstar.entity.User;

@WebServlet("/user/profile")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		if (user == null) {
			resp.sendRedirect(req.getContextPath() + "/user/login");
			return;
		}

		// Lấy danh sách bài đã lưu (nếu có)
		List<Paper> savedPapers = user.getSavedPapers();

		// Truyền user và danh sách paper xuống JSP
		req.setAttribute("user", user);
		req.setAttribute("savedPapers", savedPapers);

		req.getRequestDispatcher("/views/user/profile.jsp").forward(req, resp);
	}
}
