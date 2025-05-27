package vn.iotstar.controller.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.json.JSONObject;

import vn.iotstar.entity.FavoriteList;
import vn.iotstar.entity.Paper;
import vn.iotstar.entity.User;
import vn.iotstar.impl.service.*;
import vn.iotstar.service.*;

@WebServlet("/user/favoriteList")
public class FavoriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final IFavoriteListService favoriteListService = new FavoriteListService();
	private final IPaperService paperService = new PaperService();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		JSONObject json = new JSONObject();

		try {
			// Lấy thông tin từ form
			String listName = request.getParameter("listName");
			String description = request.getParameter("description");
			int paperId = Integer.parseInt(request.getParameter("paperId"));

			// Lấy người dùng hiện tại từ session
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");

			if (user == null) {
				json.put("error", "Bạn cần đăng nhập để thực hiện chức năng này.");
				out.print(json.toString());
				return;
			}

			// Tạo danh sách mới
			FavoriteList favoriteList = new FavoriteList();
			favoriteList.setName(listName);
			favoriteList.setDescription(description);
			favoriteList.setUser(user);
			favoriteList.setCreatedAt(new Date());
			System.out.println("Tên danh sách: " + listName);
			System.out.println("Mô tả: " + description);
			System.out.println("Paper ID: " + paperId);
			System.out.println("User: " + user);

			favoriteListService.save(favoriteList);

			// Lưu bài báo vào danh sách vừa tạo
			Paper paper = paperService.findById(paperId);
			paper.setFavoriteList(favoriteList); // gán danh sách
			paperService.updatePaper(paper);

			json.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			json.put("error", "Có lỗi xảy ra: " + e.getMessage());
		}
		out.print(json.toString());
	}
}
