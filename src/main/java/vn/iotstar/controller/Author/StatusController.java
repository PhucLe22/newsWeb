package vn.iotstar.controller.Author;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.Paper;
import vn.iotstar.impl.service.PaperService;
import vn.iotstar.service.IPaperService;

@WebServlet(urlPatterns = { "/author/paper/status" })
public class StatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperService paperService = new PaperService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String statusStr = req.getParameter("status");
		String paperIdStr = req.getParameter("paperId"); // lấy id paper

		int status = 0;
		int paperId = 0;

		try {
			status = Integer.parseInt(statusStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		try {
			paperId = Integer.parseInt(paperIdStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		if (paperId == 0) {
			// paperId không hợp lệ, xử lý lỗi hoặc trả về trang lỗi
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid paper ID");
			return;
		}

		// Lấy paper hiện tại từ DB để update
		Paper paper = paperService.findById(paperId);
		if (paper == null) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Paper not found");
			return;
		}

		paper.setStatus(status);
		paperService.updatePaper(paper);
		
		// Có thể redirect về danh sách hoặc trang cần thiết
		resp.sendRedirect(req.getContextPath() + "/author/paper/list");
	}
}
