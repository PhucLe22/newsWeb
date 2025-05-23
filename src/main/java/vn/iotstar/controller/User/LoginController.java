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
		req.getRequestDispatcher("/views/user/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		try {
			// TH: Admin cố định
			if ("admin@gmail.com".equals(email) && "admin123".equals(password)) {
				session = req.getSession();
				User admin = new User();
				admin.setEmail(email);
				admin.setAvatarUrl("https://www.shutterstock.com/image-vector/user-icon-vector-600nw-393536320.jpg");
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
				session = req.getSession();
				session.setAttribute("user", user);

				System.out.println("Đăng nhập thành công: " + user.getEmail());

				int roleId = user.getRole().getId(); // lấy roleId từ user

				if (roleId == 1) {
					// RoleId = 1 thì chuyển tới trang index user
					resp.sendRedirect(req.getContextPath() + "/user/homepage");
				} else if (roleId == 2) {
					// RoleId = 2 thì chuyển tới trang author/home
					resp.sendRedirect(req.getContextPath() + "/author/paper/list");
				} else {
					// Các role khác (nếu có), có thể redirect trang mặc định
					resp.sendRedirect(req.getContextPath() + "/views/user/index.jsp");
				}
			} else {
				req.setAttribute("error", "Email hoặc mật khẩu không đúng!");
				req.getRequestDispatcher("/views/user/login.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
			req.getRequestDispatcher("/views/user/login.jsp").forward(req, resp);
		}
	}
}
