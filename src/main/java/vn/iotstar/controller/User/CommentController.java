package vn.iotstar.controller.User;

import java.io.IOException;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.*;
import vn.iotstar.service.IPaperService;
import vn.iotstar.impl.service.PaperService;

@WebServlet(urlPatterns = { "/user/comment" })
public class CommentController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private IPaperService paperService = new PaperService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		System.out.println("CommentController được gọi!");


		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("account");

		if (user == null) {
			// Nếu chưa đăng nhập, chuyển đến trang login
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		String content = req.getParameter("content");
		String paperIdStr = req.getParameter("paperId");

		if (content == null || content.trim().isEmpty()) {
			req.setAttribute("error", "Nội dung bình luận không được để trống.");
			req.getRequestDispatcher("/views/user/paperDetail.jsp").forward(req, resp);
			return;
		}

		try {
			int paperId = Integer.parseInt(paperIdStr);
			Paper paper = paperService.getPaperById(paperId);

			if (paper == null) {
				req.setAttribute("error", "Không tìm thấy bài viết.");
				req.getRequestDispatcher("/views/user/paperDetail.jsp").forward(req, resp);
				return;
			}
			java.util.Date currentTime = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(currentTime.getTime());
			Comment comment = new Comment();
			comment.setContent(content.trim());
			comment.setCreatedAt(sqlDate);
			comment.setUser(user);
			comment.setPaper(paper);

			paperService.insertComment(comment);

			resp.sendRedirect(req.getContextPath() + "/paper/detail?id=" + paperId);

		} catch (NumberFormatException e) {
			req.setAttribute("error", "ID bài viết không hợp lệ.");
			req.getRequestDispatcher("/views/user/paperDetail.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Lỗi khi lưu bình luận.");
			req.getRequestDispatcher("/views/user/paperDetail.jsp").forward(req, resp);
		}
	}
}
