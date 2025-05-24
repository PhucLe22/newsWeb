package vn.iotstar.controller.User;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/user/logout" })
public class LogoutController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Lấy session hiện tại và xoá
		HttpSession session = req.getSession(false); // false để không tạo session mới nếu không tồn tại

		if (session != null) {
			session.invalidate(); // Xoá toàn bộ session
		}

		// Chuyển hướng về controller hiển thị trang chủ
		resp.sendRedirect(req.getContextPath() + "/user/homepage");
	}
}
