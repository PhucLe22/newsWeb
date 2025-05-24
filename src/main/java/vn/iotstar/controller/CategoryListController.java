package vn.iotstar.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.impl.service.PaperService;
import vn.iotstar.impl.service.PaperTypeService;
import vn.iotstar.service.IPaperService;
import vn.iotstar.service.IPaperTypeService;
import vn.iotstar.entity.*;

@WebServlet(urlPatterns = { "/user/category" })

public class CategoryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperService paperService = new PaperService();
	private IPaperTypeService paperTypeService = new PaperTypeService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Paper> list = paperService.getAllPapers();
		Map<Integer, List<Paper>> groupedByTypeId = new HashMap<>();

		// Tạo biến tạm lưu theo loại
		List<Paper> currentGroup = new ArrayList<>();
		Integer currentTypeId = null;

		for (Paper p : list) {
			Integer paperTypeId = p.getPaperType().getId();

			// Nếu là lần đầu hoặc loại giống nhau thì tiếp tục add vào currentGroup
			if (currentTypeId == null || paperTypeId.equals(currentTypeId)) {
				currentGroup.add(p);
				currentTypeId = paperTypeId;
			} else {
				// Gặp loại mới -> đưa currentGroup vào map
				groupedByTypeId.put(currentTypeId, new ArrayList<>(currentGroup));
				currentGroup.clear();
				currentGroup.add(p);
				currentTypeId = paperTypeId;
			}
		}

		// Đưa group cuối cùng vào map nếu còn
		if (!currentGroup.isEmpty() && currentTypeId != null) {
			groupedByTypeId.put(currentTypeId, currentGroup);
		}

		// Lấy danh sách tất cả PaperType để hiển thị tên
		List<PaperType> listType = paperTypeService.getAllPaperTypes();
		Map<Integer, String> typeNames = new HashMap<>();
		for (PaperType t : listType) {
			typeNames.put(t.getId(), t.getPaperTypeName());
		}

		req.setAttribute("groupedByTypeId", groupedByTypeId);
		req.setAttribute("typeNames", typeNames);
		req.getRequestDispatcher("/views/user/category.jsp").forward(req, resp);
	}
}
