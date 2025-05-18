package vn.iotstar.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.*;
import vn.iotstar.impl.service.*;
import vn.iotstar.service.*;

@WebServlet(urlPatterns = { "/user/search" })

public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperService paperService = new PaperService(); // Tạo đối tượng service để gọi

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String keyWord = req.getParameter("keyword");
		List<Paper> papers = paperService.getAllPapers();
		List<Paper> matchedPapers = new ArrayList<>();
//		List<Paper> IdPapers = new ArrayList<>();

		System.out.println("Số paper đã load: " + papers.size());

		int i = 0;
		if (keyWord != null && !keyWord.trim().isEmpty()) {
			for (Paper paper : papers) {
				String paperName = paper.getPaperName();
				if (paperName != null && !paperName.trim().isEmpty()) {
					if (paperName.toLowerCase().contains(keyWord.trim().toLowerCase())) {
						matchedPapers.add(paper);
						i++;
					}
				}
			}
		}
		

		System.out.println("Số kết quả khớp: " + i);
		req.setAttribute("keyWord", keyWord);
		req.setAttribute("searchAmount", i);
		req.setAttribute("PaperList", matchedPapers);

		for (Paper c : matchedPapers) {
			System.out.println(c.getPaperName());
		}

		req.getRequestDispatcher("/views/user/searchPaper.jsp").forward(req, resp);
	}
}
