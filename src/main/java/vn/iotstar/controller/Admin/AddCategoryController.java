package vn.iotstar.controller.Admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.PaperType;
import vn.iotstar.impl.service.PaperService;
import vn.iotstar.service.IPaperService;

@WebServlet(urlPatterns = { "/admin/add" })

public class AddCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperService PaperService = new PaperService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/admin/addCa.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String newPaperTypeName = req.getParameter("PaperTypeName");

		// Lấy danh sách các loại khóa học
		List<PaperType> list = PaperService.getAllPaperTypes();

		// Kiểm tra tên rỗng
		if (newPaperTypeName == null || newPaperTypeName.trim().isEmpty()) {
			req.setAttribute("message", "Tên khóa học không được để trống");
			req.getRequestDispatcher("/views/admin/addCa.jsp").forward(req, resp);
			return; // Dừng lại sau khi forward
		}

		// Kiểm tra tên trùng (so sánh bỏ qua khoảng trắng và không phân biệt hoa
		// thường)
		boolean isDuplicate = false;
		for (PaperType c : list) {
			if (c.getPaperTypeName().trim().equalsIgnoreCase(newPaperTypeName.trim())) {
				isDuplicate = true;
				break;
			}
		}

		if (isDuplicate) {
			req.setAttribute("message", "Tên khóa học đã tồn tại, vui lòng nhập tên khác!");
			req.getRequestDispatcher("/views/admin/addCa.jsp").forward(req, resp);
			return;
		}

		// Không trùng, tiến hành thêm mới
		PaperType PaperType = new PaperType();
		PaperType.setPaperTypeName(newPaperTypeName.trim());

		try {
			PaperService.addPaperType(PaperType);
			resp.sendRedirect(req.getContextPath() + "/admin/add");
		} catch (Exception e) {
			req.setAttribute("message", "Đã xảy ra lỗi khi thêm loại khóa học.");
			req.getRequestDispatcher("/views/admin/addCa.jsp").forward(req, resp);
		}
	}

}