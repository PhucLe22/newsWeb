package vn.iotstar.controller.Author;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.entity.*;
import vn.iotstar.service.*;
import vn.iotstar.impl.service.*;

@MultipartConfig
@WebServlet(urlPatterns = { "/author/edit" })
public class EditPaperController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IPaperService paperService = new PaperService();
	private IPaperTypeService paperTypeService = new PaperTypeService();
	private IPaperDetailService paperDetailService = new PaperDetailService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int paperId = Integer.parseInt(req.getParameter("id"));
		Paper paper = paperService.getPaperById(paperId);

		List<PaperType> paperTypes = paperTypeService.getAllPaperTypes();

		req.setAttribute("paper", paper);
		req.setAttribute("PaperTypes", paperTypes);

		req.getRequestDispatcher("/views/author/editPaper.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		try {
			int paperId = Integer.parseInt(req.getParameter("paperId"));
			String paperName = req.getParameter("PaperName");
			String paperTypeIdStr = req.getParameter("PaperTypeId");
			String paperImageStr = req.getParameter("PaperImage");
			String paperImageDescriptionStr = req.getParameter("PaperImageDescription");
			String paperContentStr = req.getParameter("PaperContent");
			String statusStr = req.getParameter("status");

			int paperTypeId = Integer.parseInt(paperTypeIdStr);
			int status = "Public".equalsIgnoreCase(statusStr) ? 1 : 0;

			Paper paper = paperService.getPaperById(paperId);
			if (paper == null) {
				req.setAttribute("message", "Không tìm thấy bài viết");
				resp.sendRedirect(req.getContextPath() + "/author/paper/list");
				return;
			}

			// Cập nhật nội dung bài viết
			paper.setPaperName(paperName);
			paper.setStatus(status);

			PaperType paperType = new PaperType();
			paperType.setId(paperTypeId);
			paper.setPaperType(paperType);

			// Cập nhật chi tiết bài viết
			PaperDetail detail = paper.getPaperDetail();
			detail.setPaperContent(paperContentStr);
			detail.setPaperImage(paperImageStr);
			detail.setPaperImageDescription(paperImageDescriptionStr);
			java.util.Date currentTime = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(currentTime.getTime());
			detail.setCreatedAt(sqlDate);

			// Lưu thay đổi
			paperDetailService.updatePaperDetail(detail);
			paperService.updatePaper(paper);

			req.setAttribute("message", "Cập nhật bài viết thành công");
			resp.sendRedirect(req.getContextPath() + "/author/paper/list");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Lỗi khi cập nhật bài viết");
			req.getRequestDispatcher("/views/author/editPaper.jsp").forward(req, resp);
		}
	}
}
