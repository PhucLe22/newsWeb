package vn.iotstar.controller.User;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.*;
import vn.iotstar.impl.service.*;
import vn.iotstar.service.*;

@WebServlet(urlPatterns = { "/user/favoriteList" })
public class CheckFavoriteListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IPaperService paperService = new PaperService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();

		// Fake login test (nếu chưa có session)
		if (session.getAttribute("account") == null) {
			User user1 = new User();
			user1.setId(3);
			user1.setEmail("tphuc.nhamaxpower@gmail.com");
			user1.setFullname("abc");
			user1.setAvatarUrl("default.jpg");
			Calendar cal = Calendar.getInstance();
			cal.set(1999, Calendar.JANUARY, 19);
			session.setAttribute("account", user1);
		}

		User user = (User) session.getAttribute("account");

		if (user == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		String paperIdStr = req.getParameter("paperId");
		String listName = req.getParameter("listName");
		String description = req.getParameter("description");

		if (paperIdStr == null || listName == null || listName.trim().isEmpty()) {
			req.setAttribute("error", "Thiếu thông tin yêu cầu");
			req.getRequestDispatcher("/views/user/createFavorite.jsp").forward(req, resp);
			return;
		}

		int paperId = Integer.parseInt(paperIdStr);
		Paper paper = paperService.getPaperById(paperId);
		if (paper == null) {
			req.setAttribute("error", "Bài viết không tồn tại");
			req.getRequestDispatcher("/views/user/createFavorite.jsp").forward(req, resp);
			return;
		}

		List<FavoriteList> favoriteLists = paperService.getFavoriteListByUserId(paperId);
		List<FavoriteList> faList = paperService.getAllFavoriteList();
		System.out.println("Favorite lists size: " + (favoriteLists == null ? "null" : favoriteLists.size()));
		System.out.println("FaLists size: " + (faList == null ? "null" : faList.size()));

		FavoriteList targetList = null;
		System.out.println(listName);
		System.out.println("toi day!");
		for (FavoriteList list : faList) {
			if (user.getId() == list.getId()) {
				System.out.println("Checking list name: '" + list.getName() + "' vs input: '" + listName + "'");
				if (list.getName() != null && list.getName().trim().equalsIgnoreCase(listName.trim())) {
					System.out.println("Found matching list: " + list.getName());
					targetList = list;
					break;
				}
			}
		}

		if (targetList != null) {
			if (!targetList.getPapers().contains(paper)) {
				targetList.getPapers().add(paper);
				paperService.save(targetList);
			}
		} else {
			FavoriteList newList = new FavoriteList();
			newList.setName(listName);
			newList.setDescription(description);
			newList.setUser(user);
			java.util.Date currentTime = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(currentTime.getTime());
			newList.setCreatedAt(sqlDate);

			Set<Paper> papers = new HashSet<>();
			papers.add(paper);
			newList.setPapers(papers);

			paperService.save(newList);
		}
		resp.sendRedirect(req.getContextPath() + "/favorite/list");
	}
}
