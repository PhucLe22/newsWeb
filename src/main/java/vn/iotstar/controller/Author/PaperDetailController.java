package vn.iotstar.controller.Author;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.*;
import vn.iotstar.impl.service.*;
import vn.iotstar.service.*;

@WebServlet(urlPatterns = { "/user/paperDetail" })
public class PaperDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperDetailService paperDetailService = new PaperDetailService();
	private IPaperService paperService = new PaperService();
	// Thêm FavoriteService nếu cần
	// private IFavoriteService favoriteService = new FavoriteService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		List<Paper> listPaper = paperService.getAllPapers();
		String idStr = req.getParameter("id");

		if (idStr == null) {
			resp.sendRedirect(req.getContextPath() + "/user/home");
			return;
		}

		try {
			int paperId = Integer.parseInt(idStr);
			Paper selectedPaper = paperService.findById(paperId);

			if (selectedPaper == null) {
				resp.sendRedirect(req.getContextPath() + "/user/home");
				return;
			}

			// Lấy danh sách comment cho bài viết này
			List<Comment> commentList = paperService.getCommentsByPaperId(paperId);

			// Lấy danh sách favorite của user (nếu đã đăng nhập)
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");
			List<FavoriteList> favoriteLists = null;

			// TODO: Uncomment khi đã có FavoriteService
			// if (user != null) {
			// favoriteLists = favoriteService.getFavoriteListsByUserId(user.getId());
			// }

			// Danh sách liên quan: cùng loại, khác ID
			List<Paper> relatedList = listPaper.stream()
					.filter(p -> p.getPaperType() != null && selectedPaper.getPaperType() != null
							&& p.getPaperType().getId() == selectedPaper.getPaperType().getId() && p.getId() != paperId)
					.limit(10).toList();

			// Set attributes
			req.setAttribute("paperId", paperId);
			req.setAttribute("selectedPaper", selectedPaper);
			req.setAttribute("relatedList", relatedList);
			req.setAttribute("listPaper", listPaper);
			req.setAttribute("commentList", commentList);
			req.setAttribute("favoriteLists", favoriteLists);

			req.getRequestDispatcher("/views/user/paperDetail.jsp").forward(req, resp);

		} catch (NumberFormatException e) {
			System.err.println("Invalid paper ID: " + idStr);
			resp.sendRedirect(req.getContextPath() + "/user/home");
		} catch (Exception e) {
			System.err.println("Error in PaperDetailController: " + e.getMessage());
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/user/home");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Forward POST request đến CommentController
		req.getRequestDispatcher("/user/comment").forward(req, resp);
	}
}