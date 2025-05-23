package vn.iotstar.controller.Author;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.Comment;
import vn.iotstar.entity.Paper;
import vn.iotstar.entity.PaperDetail;
import vn.iotstar.entity.User;
import vn.iotstar.impl.service.*;
import vn.iotstar.service.*;

@WebServlet(urlPatterns = { "/user/paperDetail" })
public class PaperDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperDetailService paperDetailService = new PaperDetailService();
	private IPaperService paperService = new PaperService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Paper> listPaper = paperService.getAllPapers();

		String idStr = req.getParameter("id");
		if (idStr == null) {
			resp.sendRedirect(req.getContextPath() + "/author/paper/list");
			return;
		}

		int paperId = Integer.parseInt(idStr);
		Paper selectedPaper = paperService.findById(paperId);
		req.getSession().removeAttribute("paperId");
		HttpSession session = req.getSession();

		if (selectedPaper == null) {
			resp.sendRedirect(req.getContextPath() + "/author/paper/list");
			return;
		}

		// Danh sách liên quan: cùng loại, khác ID
		List<Paper> relatedList = listPaper.stream()
				.filter(p -> p.getPaperType().getId() == selectedPaper.getPaperType().getId() && p.getId() != paperId)
				.limit(10)
				.toList();

		// Kiểm tra xem có user trong session không
		boolean commentAllowed = false;
		User user = (User) session.getAttribute("user");
		if (user != null) {
			commentAllowed = true;
		}

		req.setAttribute("comment", commentAllowed); 
		req.setAttribute("paperId", paperId);
		req.setAttribute("selectedPaper", selectedPaper);
		req.setAttribute("relatedList", relatedList);
		req.setAttribute("listPaper", listPaper);

		req.getRequestDispatcher("/views/user/paperDetail.jsp").forward(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    req.setCharacterEncoding("UTF-8");
	    resp.setContentType("application/json");
	    resp.setCharacterEncoding("UTF-8");
	    
	    System.out.println("Bắt đầu xử lý POST comment");
	    
	    HttpSession session = req.getSession(false);
	    if (session == null) {
	        System.out.println("Session chưa tồn tại, yêu cầu đăng nhập lại");
	        resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	        resp.getWriter().write("{\"error\": \"Bạn cần đăng nhập.\"}");
	        return;
	    }
	    
	    User u = (User) session.getAttribute("user");
	    if (u == null) {
	        System.out.println("User chưa đăng nhập (user=null trong session)");
	        resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	        resp.getWriter().write("{\"error\": \"Bạn cần đăng nhập.\"}");
	        return;
	    }
	    int userId = u.getId();
	    System.out.println("User ID lấy được từ session: " + userId);
	    
	    // Lấy paperId từ parameter POST
	    String paperIdStr = req.getParameter("paperId");
	    System.out.println("Giá trị paperId nhận được từ client: " + paperIdStr);
	    
	    if (paperIdStr == null || paperIdStr.trim().isEmpty()) {
	        System.out.println("paperId không được gửi lên hoặc rỗng");
	        resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	        resp.getWriter().write("{\"error\": \"paperId không hợp lệ.\"}");
	        return;
	    }
	    
	    int paperId = 0;
	    try {
	        paperId = Integer.parseInt(paperIdStr);
	        System.out.println("paperId chuyển thành số nguyên: " + paperId);
	    } catch (NumberFormatException e) {
	        System.out.println("Lỗi chuyển đổi paperId: " + e.getMessage());
	        resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	        resp.getWriter().write("{\"error\": \"paperId không hợp lệ.\"}");
	        return;
	    }
	    
	    String content = req.getParameter("comment");
	    System.out.println("Nội dung comment nhận được: " + content);
	    if (content == null || content.trim().isEmpty()) {
	        System.out.println("Nội dung comment rỗng");
	        resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	        resp.getWriter().write("{\"error\": \"Nội dung bình luận không được để trống.\"}");
	        return;
	    }
	    
	    Comment comment = new Comment();
	    comment.setContent(content);
	    
	    Paper paper = new Paper();
	    paper.setId(paperId);
	    comment.setPaper(paper);
	    
	    User user = new User();
	    user.setId(userId);
	    comment.setUser(user);
	    
	    System.out.println("Đang lưu comment vào database...");
	    paperService.saveComment(comment);
	    System.out.println("Lưu comment thành công!");
	    
	    resp.getWriter().write("{\"message\": \"Bình luận đã được gửi.\"}");
	}



}
