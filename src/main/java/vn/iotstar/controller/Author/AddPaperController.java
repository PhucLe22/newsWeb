package vn.iotstar.controller.Author;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
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
@WebServlet(urlPatterns = { "/author/add" })
public class AddPaperController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IPaperService paperService = new PaperService();
	private IPaperTypeService paperTypeService = new PaperTypeService();
	private IPaperDetailService paperDetailService = new PaperDetailService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idStr = req.getParameter("id");
		if (idStr != null) {
			int paperId = Integer.parseInt(idStr);
			// Redirect sang controller hiển thị chi tiết
			resp.sendRedirect(req.getContextPath() + "/author/paperDetail?id=" + paperId);
			return;
		}
		// Nếu không có id (nghĩa là truy cập thêm bài viết mới)
		req.getRequestDispatcher("/views/author/addPaper.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		List<PaperType> paperTypes = paperTypeService.getAllPaperTypes();
		req.setAttribute("PaperTypes", paperTypes);

		String paperName = req.getParameter("PaperName");
		System.out.println("Paper name: " + paperName);
		String paperTypeIdStr = req.getParameter("PaperTypeId");
		String paperImageStr = req.getParameter("PaperImage");
		String paperImageDescriptionStr = req.getParameter("PaperImageDescription");
		String paperContentStr = req.getParameter("PaperContent");
		String description = req.getParameter("description");
		String statusStr = req.getParameter("status");
		int status = 0; // default Private = 0
		if ("Public".equalsIgnoreCase(statusStr)) {
			status = 1;
		}
		// giờ biến status có giá trị 1 (Public) hoặc 0 (Private)

		if (paperName == null || paperName.trim().isEmpty()) {
			req.getRequestDispatcher("/views/author/editPaper.jsp").forward(req, resp);
			return;
		}

		int paperTypeId;
		try {
			paperTypeId = Integer.parseInt(paperTypeIdStr);
		} catch (NumberFormatException e) {
			req.setAttribute("message", "Loại bài viết không hợp lệ");
			req.getRequestDispatcher("/views/author/editPaper.jsp").forward(req, resp);
			return;
		}

		try {
			// Bước 1: Tạo PaperDetail
			PaperDetail paperDetail = new PaperDetail();
			paperDetail.setPaperContent(paperContentStr);
			paperDetail.setPaperImage(paperImageStr);
			paperDetail.setPaperImageDescription(paperImageDescriptionStr);
			paperDetail.setDescription(description);
			java.util.Date currentTime = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(currentTime.getTime());
			paperDetail.setCreatedAt(sqlDate);

			// Lưu PaperDetail trước để lấy ID
			paperDetailService.addPaperDetail(paperDetail);
			int paperDetailId = paperDetail.getId();

			// Bước 2: Tạo Paper và gán ID PaperDetail
			Paper paper = new Paper();
			paper.setPaperName(paperName);
			PaperType paperType = new PaperType();
			paperType.setId(paperTypeId);
			paper.setPaperType(paperType);
			paper.setStatus(status);
			paper.setActive(true);
			paper.setPaperDetail(paperDetail);
			paperDetail.setId(paperDetailId);
			paper.setPaperDetail(paperDetail);

			// Bước 3: Lưu Paper
			paperService.addPaper(paper);

			// Điều hướng đến danh sách bài viết
			resp.sendRedirect(req.getContextPath() + "/author/paper/list");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Lỗi khi thêm bài viết. Vui lòng thử lại.");
			req.getRequestDispatcher("/views/author/editPaper.jsp").forward(req, resp);
		}
	}
}
