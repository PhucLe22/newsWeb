package vn.iotstar.controller.Author;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.Paper;
import vn.iotstar.entity.PaperDetail;
import vn.iotstar.impl.service.*;
import vn.iotstar.service.*;

@WebServlet(urlPatterns = { "/author/paperDetail" })
public class PaperDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperDetailService paperDetailService = new PaperDetailService();
	private IPaperService paperService = new PaperService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Paper> listPaper = paperService.getAllPapers();
		String idStr = req.getParameter("id");
	    if (idStr == null) {
	        resp.sendRedirect(req.getContextPath() + "/author/paper/list"); // hoặc về danh sách
	        return;
	    }
	    
	    
	    int paperId = Integer.parseInt(idStr);
	    req.setAttribute("paperId", paperId);
	    req.setAttribute("listPaper", listPaper);

	    req.getRequestDispatcher("/views/author/paperDetail.jsp").forward(req, resp);
	}
}
