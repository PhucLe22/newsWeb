package vn.iotstar.controller.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.entity.User;
import vn.iotstar.impl.service.UserService;
import vn.iotstar.service.IUserService;

@WebServlet(urlPatterns = { "/user/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IUserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String redirectUrl = req.getParameter("redirect"); // lấy redirect nếu có
		req.setAttribute("redirect", redirectUrl); // gửi xuống form login
		req.getRequestDispatcher("/views/user/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String redirectUrl = req.getParameter("redirect"); // lấy redirect từ form
		System.out.println("Redirect after login: " + redirectUrl);


		try {
			// TH: Admin cố định
			if ("admin@gmail.com".equals(email) && "admin123".equals(password)) {
				User admin = new User();
				admin.setEmail(email);
				admin.setAvatarUrl("https://as2.ftcdn.net/jpg/02/72/43/23/1000_F_272432381_K2Hr5iaoCEhqpC9zSvnGOIHMSqgsQcjb.jpg");
				admin.setFullname("Quản trị viên");
				admin.setActive(true);
				session.setAttribute("user", admin);

				System.out.println("Đăng nhập với tài khoản admin thành công!");

				resp.sendRedirect(req.getContextPath() + "/admin/home");
				return;
			}

			// TH: User từ database
			User user = userService.findByEmailAndPassword(email, password);

			if (user != null && user.isActive()) {
				session.setAttribute("user", user);

				System.out.println("Đăng nhập thành công: " + user.getEmail());

				int roleId = user.getRole().getId(); // lấy roleId từ user

				if (roleId == 1) {
					// Quay lại redirect nếu có
					if (redirectUrl != null && !redirectUrl.isEmpty()) {
						resp.sendRedirect(redirectUrl); // đã có context rồi → dùng luôn
					} else {
						resp.sendRedirect(req.getContextPath() + "/user/homepage");
					}
				} else if (roleId == 2) {
					resp.sendRedirect(req.getContextPath() + "/author/paper/list");
				} else {
					resp.sendRedirect(req.getContextPath() + "/views/user/index.jsp");
				}
			} else {
				req.setAttribute("error", "Email hoặc mật khẩu không đúng!");
				req.setAttribute("redirect", redirectUrl); // giữ lại redirect nếu lỗi
				req.getRequestDispatcher("/views/user/login.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
			req.setAttribute("redirect", redirectUrl); // giữ lại redirect nếu lỗi
			req.getRequestDispatcher("/views/user/login.jsp").forward(req, resp);
		}
	}
}
