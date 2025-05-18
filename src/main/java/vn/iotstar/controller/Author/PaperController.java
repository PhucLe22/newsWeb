package vn.iotstar.controller.Author;

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

@WebServlet(urlPatterns = { "/author/paper/list" })

public class PaperController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperService paperService = new PaperService();
	private IPaperDetailService paperDetailService = new PaperDetailService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Paper> listPaper = paperService.getAllPapers();
		List<PaperDetail> listDetail = paperDetailService.getAllPaperDetails(); 

		req.setAttribute("ListPaper", listPaper);
		req.setAttribute("ListDetail", listDetail);
		req.getRequestDispatcher("/views/author/paperList.jsp").forward(req, resp);
	}
}