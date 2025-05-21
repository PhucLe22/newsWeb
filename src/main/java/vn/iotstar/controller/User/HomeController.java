package vn.iotstar.controller.User;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
		
		List<PaperType> paperType = paperTypeService.getAllPaperTypes();
		req.setAttribute("paperType", paperType);

		List<Paper> bestPapers = paperService.getBestPapers(3);
		req.setAttribute("BestPapers", bestPapers);
		List<Paper> todayPapers = paperService.getTodayPapers(3);
		req.setAttribute("TodayPapers", todayPapers);

		List<Paper> foreignList = paperService.getForeignRelatedPapers();
		req.setAttribute("ForeignPapers", foreignList);
		System.out.println("Danh sách ForeignList:");
		for (Paper paper : foreignList) {
		    System.out.println(paper.getPaperName());
		}
		if (url.contains("/user/homepage")) {
			req.getRequestDispatcher("/views/user/index.jsp").forward(req, resp);
		}
	}
}