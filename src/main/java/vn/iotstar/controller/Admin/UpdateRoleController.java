package vn.iotstar.controller.Admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.Role;
import vn.iotstar.entity.User;
import vn.iotstar.impl.service.RoleService;
import vn.iotstar.impl.service.UserService;
import vn.iotstar.service.IRoleService;
import vn.iotstar.service.IUserService;

@WebServlet(urlPatterns = { "/user/role/update" })
public class UpdateRoleController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IUserService userService = new UserService();
	private IRoleService roleService = new RoleService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<User> userList = userService.getAllUsers(); // hoặc get danh sách user
		List<Role> roleList = roleService.findAll(); // get tất cả vai trò từ DB

		req.setAttribute("userList", userList);
		req.setAttribute("roleList", roleList);

		req.getRequestDispatcher("/views/admin/updateRole.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userIdStr = req.getParameter("userId");
		String roleIdStr = req.getParameter("roleId");

		int userId = 0;
		int roleId = 0;

		try {
			userId = Integer.parseInt(userIdStr);
			roleId = Integer.parseInt(roleIdStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format");
			return;
		}

		User user = userService.findById(userId);
		if (user == null) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
			return;
		}

		Role role = roleService.findById(roleId);
		if (role == null) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Role not found");
			return;
		}
		System.out.println("userIdStr = " + userIdStr);
		System.out.println("roleIdStr = " + roleIdStr);

		user.setRole(role);
		userService.updateUser(user);

		resp.sendRedirect(req.getContextPath() + "/user/role/update");
	}
}
