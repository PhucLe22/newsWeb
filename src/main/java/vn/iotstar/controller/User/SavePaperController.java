package vn.iotstar.controller.User;

import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.entity.FavoriteList;
import vn.iotstar.entity.Paper;
import vn.iotstar.entity.User;
import vn.iotstar.service.*;
import vn.iotstar.impl.service.*;

@WebServlet(urlPatterns = { "/favoriteList/save" })
public class SavePaperController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IPaperService paperService = new PaperService();
	private IFavoriteListService favoriteListService = new FavoriteListService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession(false);
		if (session == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		User user = (User) session.getAttribute("account");
		if (user == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		// Lấy paperId từ request
		String paperIdStr = req.getParameter("paperId");
		if (paperIdStr == null || paperIdStr.trim().isEmpty()) {
			req.setAttribute("error", "Không có bài viết được chọn.");
			req.getRequestDispatcher("/somePage.jsp").forward(req, resp);
			return;
		}

		int paperId;
		try {
			paperId = Integer.parseInt(paperIdStr);
		} catch (NumberFormatException e) {
			req.setAttribute("error", "ID bài viết không hợp lệ.");
			req.getRequestDispatcher("/somePage.jsp").forward(req, resp);
			return;
		}

		Paper paper = paperService.getPaperById(paperId);
		if (paper == null) {
			req.setAttribute("error", "Không tìm thấy bài viết.");
			req.getRequestDispatcher("/somePage.jsp").forward(req, resp);
			return;
		}

		// Giả sử bạn có service lấy favoriteList theo userId
		List<FavoriteList> favoriteLists = favoriteListService.findByUserId(user.getId());

		if (favoriteLists == null || favoriteLists.isEmpty()) {
			// Chưa có danh sách yêu thích, chuyển sang trang tạo mới
			resp.sendRedirect(req.getContextPath() + "/favoriteList/create");
			return;
		}

		// Nếu có danh sách rồi thì add paper vào danh sách đầu tiên (hoặc danh sách bạn
		// chọn)
		FavoriteList favoriteList = favoriteLists.get(0); // ví dụ lấy danh sách đầu tiên

		// Thêm paper vào set
		Set<Paper> papers = favoriteList.getPapers();
		if (papers == null) {
			papers = new HashSet<>();
		}
		papers.add(paper);
		favoriteList.setPapers(papers);

//		boolean saved = favoriteListService.save(favoriteList);
//		if (saved) {
//			resp.sendRedirect(req.getContextPath() + "/favorite/list");
//		} else {
//			req.setAttribute("error", "Lưu danh sách yêu thích thất bại!");
//			req.getRequestDispatcher("/somePage.jsp").forward(req, resp);
//		}
	}

}
