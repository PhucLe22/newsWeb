package vn.iotstar.controller.User;

import java.io.IOException;
import java.io.PrintWriter;
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
		resp.setContentType("application/json; charset=UTF-8");

		System.out.println("CommentController được gọi!");

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user"); // Sửa từ "account" thành "user"

		PrintWriter out = resp.getWriter();

		if (user == null) {
			// Trả về JSON error thay vì redirect
			out.print("{\"error\": \"Bạn cần đăng nhập để bình luận.\"}");
			out.flush();
			return;
		}

		// Sửa tên parameter từ "content" thành "comment" để khớp với JSP
		String content = req.getParameter("comment");
		String paperIdStr = req.getParameter("paperId");

		System.out.println("Content: " + content);
		System.out.println("PaperId: " + paperIdStr);

		if (content == null || content.trim().isEmpty()) {
			out.print("{\"error\": \"Nội dung bình luận không được để trống.\"}");
			out.flush();
			return;
		}

		try {
			int paperId = Integer.parseInt(paperIdStr);
			Paper paper = paperService.getPaperById(paperId);

			if (paper == null) {
				out.print("{\"error\": \"Không tìm thấy bài viết.\"}");
				out.flush();
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

			// Trả về JSON success
			out.print("{\"success\": \"Bình luận đã được thêm thành công.\"}");
			out.flush();

		} catch (NumberFormatException e) {
			out.print("{\"error\": \"ID bài viết không hợp lệ.\"}");
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
			out.print("{\"error\": \"Lỗi khi lưu bình luận.\"}");
			out.flush();
		}
	}
}