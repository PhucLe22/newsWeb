package vn.iotstar.controller.User;

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

@WebServlet(urlPatterns = { "/user/homepage" })
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private IPaperService paperService = new PaperService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		List<Object[]> bestPapers = paperService.getBestPapers(3);
		req.setAttribute("BestPapers", bestPapers);

		List<Object[]> todayPapers = paperService.getTodayPapers(10);
		req.setAttribute("TodayPapers", todayPapers);
		if (url.contains("/user/homepage")) {
			req.getRequestDispatcher("/views/user/index.jsp").forward(req, resp);
		}
	}
}