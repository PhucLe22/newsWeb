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
		List<PaperType> listType = paperTypeService.getAllPaperTypes();

		Map<PaperType, List<Paper>> groupedByType = new HashMap<>();
		for (PaperType t : listType) {
			groupedByType.put(t, new ArrayList<>());
		}
		for (Paper p : list) {
			PaperType pt = p.getPaperType();
			if (groupedByType.containsKey(pt)) {
				groupedByType.get(pt).add(p);
			}
		}
		for (Paper p : list) {
			PaperType pt = p.getPaperType();
			System.out.println("Paper: " + p.getPaperName() + " | Type: " + pt.getPaperTypeName());

			if (groupedByType.containsKey(pt)) {
				groupedByType.get(pt).add(p);
			} else {
				System.out.println("PaperType không tồn tại trong groupedByType: " + pt.getPaperTypeName());
			}
		}


		req.setAttribute("groupedByType", groupedByType);
		req.getRequestDispatcher("/views/user/category.jsp").forward(req, resp);
	}
}
