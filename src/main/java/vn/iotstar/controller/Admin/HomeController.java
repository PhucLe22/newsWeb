package vn.iotstar.controller.Admin;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.User;
import vn.iotstar.impl.service.UserService;
import vn.iotstar.service.IUserService;

@WebServlet(urlPatterns = { "/admin/home" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IUserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		List<User> adminUsers = userService.getUsersByRole("ADMIN");
		req.setAttribute("adminUsers", adminUsers);
		
		req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
	}
}
