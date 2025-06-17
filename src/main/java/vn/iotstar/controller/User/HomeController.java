package vn.iotstar.controller.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.*;
import vn.iotstar.impl.service.*;
import vn.iotstar.service.*;

@WebServlet(urlPatterns = { "/user/homepage" })
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private IPaperService paperService = new PaperService();
	private IPaperTypeService paperTypeService = new PaperTypeService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		// 1. Lấy danh sách loại bài báo
		List<PaperType> paperType = paperTypeService.getAllPaperTypes();
		req.setAttribute("paperType", paperType);

		// 2. Lấy bài báo hôm nay nhưng lọc status != 0
		List<Paper> todayPapersRaw = paperService.getTodayPapers(3);
		List<Paper> todayPapers = new ArrayList<>();
		for (Paper p : todayPapersRaw) {
			if (p.getStatus() != 0) {
				todayPapers.add(p);
			}
		}
		req.setAttribute("TodayPapers", todayPapers);

		// 3. Lấy tất cả bài báo nhưng lọc status != 0
		List<Paper> allPapersRaw = paperService.getAllPapers();
		List<Paper> activePapers = new ArrayList<>();
		for (Paper p : allPapersRaw) {
			if (p.getStatus() != 0) {
				activePapers.add(p);
			}
		}
		req.setAttribute("paperList", activePapers);

		if (url.contains("/user/homepage")) {
			req.getRequestDispatcher("/views/user/index.jsp").forward(req, resp);
		}
	}
}