package vn.iotstar.controller.Admin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.PaperType;
import vn.iotstar.impl.service.PaperService;
import vn.iotstar.service.*;

@WebServlet(urlPatterns = { "/admin/edit" })
public class EditCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperService paperService = new PaperService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String idStr = req.getParameter("id");
		String newPaperTypeName = req.getParameter("paperTypeName");
		int id = 0;

		try {
			id = Integer.parseInt(idStr);
		} catch (NumberFormatException e) {
			req.setAttribute("message", "ID không hợp lệ");
			req.getRequestDispatcher("/views/admin/editCa.jsp").forward(req, resp);
			return;
		}

		if (newPaperTypeName == null || newPaperTypeName.trim().isEmpty()) {
			req.setAttribute("message", "Tên loại khóa học không được để trống");
			PaperType paperType = paperService.getPaperTypeById(id);
			req.setAttribute("paperType", paperType);
			System.out.println(paperType.getPaperTypeName());

			req.getRequestDispatcher("/views/admin/editCa.jsp").forward(req, resp);
			return;
		}

		PaperType paperType = paperService.getPaperTypeById(id);
		if (paperType == null) {
			req.setAttribute("message", "Không tìm thấy loại khóa học");
			req.getRequestDispatcher("/views/admin/editCa.jsp").forward(req, resp);
			return;
		}

		paperType.setPaperTypeName(newPaperTypeName.trim());
		boolean isUpdated = paperService.updatePaperType(paperType);
		if (isUpdated) {
			req.setAttribute("message", "Cập nhật thành công");
			resp.sendRedirect(req.getContextPath() + "/admin/edit");
		} else {
			req.setAttribute("message", "Cập nhật thất bại");
			req.setAttribute("paperType", paperType);
			req.getRequestDispatcher("/views/admin/editCa.jsp").forward(req, resp);
		}
	}
}