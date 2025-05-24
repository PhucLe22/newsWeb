package vn.iotstar.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.Role;
import vn.iotstar.entity.User;
import vn.iotstar.service.IRoleService;
import vn.iotstar.service.IUserService;
import vn.iotstar.impl.service.RoleService;
import vn.iotstar.impl.service.UserService;

@WebServlet(urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IUserService userService = new UserService();
	private IRoleService roleService = new RoleService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/user/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String phone = req.getParameter("phone");
		String avatarUrl = req.getParameter("avatarUrl");

		User user = new User();
		user.setFullname(fullname);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhoneNumber(phone);
		user.setAvatarUrl(avatarUrl);
		user.setActive(true);

		try {
			// Lấy role mặc định USER (id = 1)
			Role userRole = roleService.findById(1);
			if (userRole == null) {
				req.setAttribute("error", "Role USER không tồn tại!");
				req.getRequestDispatcher("/views/user/register.jsp").forward(req, resp);
				return;
			}

			// Gán role USER cho user
			user.setRole(userRole); // dùng setRole thay vì addRole (bạn đang dùng ManyToOne)

			// Lưu user vào database
			userService.saveUser(user);

			// Nếu đến đây không lỗi => redirect sang login
			resp.sendRedirect(req.getContextPath() + "/user/login");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
			req.getRequestDispatcher("/views/user/register.jsp").forward(req, resp);
		}
	}
}
