package vn.iotstar.controller.Author;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.Paper;
import vn.iotstar.entity.PaperDetail;
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

		if (selectedPaper == null) {
			resp.sendRedirect(req.getContextPath() + "/author/paper/list");
			return;
		}

		// Danh sách liên quan: cùng loại, khác ID
		List<Paper> relatedList = listPaper.stream()
				.filter(p -> p.getPaperType().getId() == selectedPaper.getPaperType().getId() && p.getId() != paperId)
				.limit(10) // Optional: chỉ lấy 5 bài liên quan gần nhất
				.toList();

		req.setAttribute("paperId", paperId);
		req.setAttribute("selectedPaper", selectedPaper);
		req.setAttribute("relatedList", relatedList);
		req.setAttribute("listPaper", listPaper); // nếu còn dùng

		req.getRequestDispatcher("/views/user/paperDetail.jsp").forward(req, resp);
	}
}
