package vn.iotstar.impl.dao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import edu.stanford.nlp.pipeline.CoreDocument;
import edu.stanford.nlp.pipeline.CoreEntityMention;
import edu.stanford.nlp.pipeline.StanfordCoreNLP;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.IPaperDao;
import vn.iotstar.entity.*;

public class PaperDao implements IPaperDao {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa-hibernate-mysql");

	@Override
	public List<Paper> searchByKeyword(String keyword) {
		EntityManager em = emf.createEntityManager();
		List<Paper> PaperResults = new ArrayList<>();
		try {
			String queryStr = "SELECT s FROM Paper s WHERE s.paperName LIKE :keyword"; // Same keyWord
			TypedQuery<Paper> query = em.createQuery(queryStr, Paper.class);
			query.setParameter("keyword", "%" + keyword + "%");
			PaperResults = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen())
				em.close();
		}
		return PaperResults;
	}

	@Override
	public List<Paper> getAllPapers() {
		EntityManager em = emf.createEntityManager();
		List<Paper> Papers = new ArrayList<>();
		try {
			String sql = "SELECT c FROM Paper c";
			Papers = em.createQuery(sql, Paper.class).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close(); // Ensuring session is closed after use
			}
		}
		return Papers;
	}

	@Override
	public List<Paper> getBestPapers(int limit) {
		EntityManager em = emf.createEntityManager();
		List<Paper> result = new ArrayList<>();
		try {
			String jpql = "SELECT DISTINCT r.paper FROM Review r WHERE r.rate >= 4";
			result = em.createQuery(jpql, Paper.class).setMaxResults(limit).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		return result;
	}

	@Override
	public List<Paper> getTodayPapers(int limit) {
		EntityManager em = emf.createEntityManager();
		List<Paper> result = new ArrayList<>();
		try {
			LocalDateTime twoDaysAgo = LocalDateTime.now().minusDays(2);
			LocalDateTime today = LocalDateTime.now();

			String jpql = "SELECT p FROM Paper p JOIN p.paperDetail pd "
					+ "WHERE pd.createdAt >= :twoDaysAgo AND pd.createdAt <= :today " + "ORDER BY pd.createdAt DESC";

			result = em.createQuery(jpql, Paper.class).setParameter("twoDaysAgo", twoDaysAgo)
					.setParameter("today", today).setMaxResults(limit).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		return result;
	}

	@Override
	public Paper findById(int id) {
		EntityManager em = emf.createEntityManager();
		try {
			return em.find(Paper.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			em.close();
		}
	}

	@Override
	public void addPaper(Paper paper) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			if (paper == null) {
				throw new IllegalArgumentException("Paper cannot be null");
			}

			trans.begin();

			// Lấy PaperType từ DB dựa trên id
			int paperTypeId = paper.getPaperType().getId();
			PaperType paperType = em.find(PaperType.class, paperTypeId);
			if (paperType == null) {
				throw new IllegalArgumentException("PaperType not found with id: " + paperTypeId);
			}
			paper.setPaperType(paperType);

			// Lấy PaperDetail từ DB dựa trên id (nếu paperDetail đã có id)
			PaperDetail paperDetail = paper.getPaperDetail();
			if (paperDetail != null) {
				if (paperDetail.getId() != 0) {
					PaperDetail persistedPaperDetail = em.find(PaperDetail.class, paperDetail.getId());
					if (persistedPaperDetail == null) {
						throw new IllegalArgumentException("PaperDetail not found with id: " + paperDetail.getId());
					}
					paper.setPaperDetail(persistedPaperDetail);
				} else {
					// Nếu chưa có id thì lưu PaperDetail trước
					em.persist(paperDetail);
					// Giờ paperDetail có id rồi
					paper.setPaperDetail(paperDetail);
				}
			} else {
				throw new IllegalArgumentException("PaperDetail không được null");
			}

			// Lưu Paper
			em.persist(paper);

			trans.commit();
		} catch (Exception e) {
			if (trans.isActive()) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
	}

	public boolean isForeignRelated(String content) {
		// Danh sách các quốc gia phổ biến (có thể mở rộng thêm)
		String[] countries = { "Mỹ", "Trung Quốc", "Nhật Bản", "Hàn Quốc", "Pháp", "Anh", "Đức", "Ý", "Australia",
				"Canada", "Ấn Độ", "Nga", "Brazil", "Hàn Quốc", "Thái Lan", "Liên Hợp Quốc", "Mexico", "Argentina",
				"Indonesia", "Nigeria", "Nam Phi", "Saudi Arabia", "Italy", "Hà Lan", "Thụy Sĩ", "Bỉ", "Thụy Điển",
				"Đan Mạch", "New Zealand", "Singapore", "Hồng Kông", "Malaysia", "Philippines", "Israel", "UAE",
				"Chile", "Colombia", "Turkey", "Egypt", "Bangladesh", "Pakistan", "Nigeria", "South Korea", "Finland",
				"Portugal", "Poland", "Romania", "Greece", "Peru", "Czech Republic", "Thế giới" };
		// Kiểm tra xem bài viết có chứa tên quốc gia nào trong danh sách
		String normalizedContent = content.toLowerCase();
		for (String country : countries) {
			if (normalizedContent.contains(country.toLowerCase())) {
				return true; // Nếu có, bài viết có thể liên quan đến nước ngoài
			}
		}

		return false; // Nếu không tìm thấy quốc gia nào, không liên quan đến nước ngoài
	}

	// Phương thức để lấy danh sách các Paper có nội dung liên quan đến nước ngoài
	public List<Paper> getForeignRelatedPapers() {
		EntityManager em = JPAConfig.getEntityManager();
		List<Paper> foreignRelatedPapers = new ArrayList<>();

		try {
			// Truy vấn tất cả các Paper từ cơ sở dữ liệu
			List<Paper> papers = em.createQuery("SELECT p FROM Paper p", Paper.class).getResultList();

			// Kiểm tra xem bài viết có liên quan đến nước ngoài không
			for (Paper paper : papers) {
				String content = paper.getPaperDetail().getPaperContent(); // Giả sử Paper có trường content
				if (isForeignRelated(content)) {
					foreignRelatedPapers.add(paper); // Nếu có, thêm vào danh sách
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}

		return foreignRelatedPapers; // Trả về danh sách các bài viết liên quan đến nước ngoài
	}

	@Override
	public List<PaperType> getAllPaperTypes() {
		EntityManager em = JPAConfig.getEntityManager();
		List<PaperType> PaperTypes = new ArrayList<>();

		try {
			String sql = "SELECT ct FROM PaperType ct";
			PaperTypes = em.createQuery(sql, PaperType.class).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close(); // Đảm bảo đóng EntityManager
			}
		}
		return PaperTypes;
	}

	@Override
	public void addPaperType(PaperType PaperType) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			if (PaperType == null) {
				throw new IllegalArgumentException("PaperType cannot be null");
			}

			trans.begin();

			// Lưu PaperType vào DB
			em.persist(PaperType);

			// Commit transaction
			trans.commit();
		} catch (Exception e) {
			if (trans.isActive()) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close(); // Đảm bảo đóng EntityManager
			}
		}
	}

	@Override
	public boolean updatePaperType(PaperType PaperType) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();

		try {
			trans.begin();

			PaperType existingType = enma.find(PaperType.class, PaperType.getId());
			if (existingType != null) {
				existingType.setPaperTypeName(PaperType.getPaperTypeName());
				enma.merge(existingType);
			} else {
				return false; // Không tìm thấy
			}

			trans.commit();
			return true;
		} catch (Exception e) {
			if (trans.isActive()) {
				trans.rollback();
			}
			e.printStackTrace();
			return false;
		} finally {
			enma.close();
		}
	}

	@Override
	public void updatePaper(Paper paper) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			if (paper == null || paper.getId() == 0) {
				throw new IllegalArgumentException("Paper không hợp lệ hoặc chưa có ID để cập nhật");
			}

			trans.begin();

			// Tìm Paper hiện có trong DB
			Paper existingPaper = em.find(Paper.class, paper.getId());
			if (existingPaper == null) {
				throw new IllegalArgumentException("Không tìm thấy Paper với ID: " + paper.getId());
			}

			// Cập nhật PaperType nếu cần
			int paperTypeId = paper.getPaperType().getId();
			PaperType paperType = em.find(PaperType.class, paperTypeId);
			if (paperType == null) {
				throw new IllegalArgumentException("PaperType không tồn tại với ID: " + paperTypeId);
			}
			existingPaper.setPaperType(paperType);

			// Cập nhật PaperDetail
			PaperDetail newDetail = paper.getPaperDetail();
			if (newDetail == null) {
				throw new IllegalArgumentException("PaperDetail không được null");
			}

			if (newDetail.getId() != 0) {
				// Nếu đã tồn tại PaperDetail
				PaperDetail existingDetail = em.find(PaperDetail.class, newDetail.getId());
				if (existingDetail == null) {
					throw new IllegalArgumentException("Không tìm thấy PaperDetail với ID: " + newDetail.getId());
				}
				// Cập nhật nội dung chi tiết (nếu có)
				existingDetail.setPaperContent(newDetail.getPaperContent());
				existingPaper.setPaperDetail(existingDetail);
			} else {
				// Nếu là PaperDetail mới
				em.persist(newDetail);
				existingPaper.setPaperDetail(newDetail);
			}

			// Cập nhật các trường còn lại của Paper
			existingPaper.setPaperName(paper.getPaperName());
			existingPaper.setStatus(paper.getStatus());
			em.merge(existingPaper);

			trans.commit();
		} catch (Exception e) {
			if (trans.isActive()) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
	}

	@Override
	public PaperType getPaperTypeById(int id) {
		EntityManager em = JPAConfig.getEntityManager();
		PaperType PaperType = null;
		try {
			PaperType = em.find(PaperType.class, id); // Tìm theo khóa chính
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		return PaperType;
	}

	@Override
	public List<FavoriteList> getFavoriteListByUserId(int userId) {
		EntityManager em = JPAConfig.getEntityManager();
		List<FavoriteList> favoriteList = new ArrayList<>();

		try {
			String jpql = "SELECT f FROM Favorite f WHERE f.user.id = :userId";
			TypedQuery<FavoriteList> query = em.createQuery(jpql, FavoriteList.class);
			query.setParameter("userId", userId);
			favoriteList = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		return favoriteList;
	}

	@Override
	public List<FavoriteList> getAllFavoriteList() {
		EntityManager em = JPAConfig.getEntityManager();
		List<FavoriteList> favoriteLists = new ArrayList<>();

		try {
			String jpql = "SELECT f FROM Favorite f";
			TypedQuery<FavoriteList> query = em.createQuery(jpql, FavoriteList.class);
			favoriteLists = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}

		return favoriteLists;
	}

	@Override
	public boolean save(FavoriteList favoriteList) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		boolean result = false;

		try {
			trans.begin();
			em.persist(favoriteList); // Tự động lưu vào bảng phụ favorite_list_paper
			trans.commit();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
			if (trans.isActive()) {
				trans.rollback();
			}
		} finally {
			em.close();
		}

		return result;
	}

	@Override
	public Paper getPaperById(int id) {
		EntityManager em = JPAConfig.getEntityManager();
		Paper paper = null;
		try {
			paper = em.find(Paper.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		return paper;
	}

	@Override
	public void insertComment(Comment comment) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction tx = em.getTransaction();

		try {
			tx.begin();
			em.persist(comment);
			tx.commit();
		} catch (Exception e) {
			if (tx.isActive())
				tx.rollback();
			e.printStackTrace();
		} finally {
			em.close();
		}
	}

	@Override
	public List<Comment> getCommentsByPaperId(int paperId) {
		EntityManager em = JPAConfig.getEntityManager();
		List<Comment> comments = null;
		try {
			String jpql = "SELECT c FROM Comment c " + "JOIN FETCH c.user " + "JOIN FETCH c.paper "
					+ "WHERE c.paper.id = :paperId " + "ORDER BY c.createdAt DESC";

			TypedQuery<Comment> query = em.createQuery(jpql, Comment.class);
			query.setParameter("paperId", paperId);
			comments = query.getResultList();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		return comments;
	}
}