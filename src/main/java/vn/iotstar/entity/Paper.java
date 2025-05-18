package vn.iotstar.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "paper")
@NamedQuery(name = "Paper.findAll", query = "SELECT p from Paper p")
public class Paper implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "paper_name")
	private String paperName;

	@ManyToOne
	@JoinColumn(name = "paper_type_id", nullable = false)
	private PaperType paperType;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "paper_detail_id", referencedColumnName = "id")
	private PaperDetail paperDetail;

//	@Column(name = "paper_price")
//	private double paperPrice;

	@ManyToOne
	@JoinColumn(name = "author_id")
	private Author author;

	@OneToMany(mappedBy = "paper", cascade = CascadeType.ALL)
	private Set<Review> review = new HashSet<>();

	@ManyToMany(mappedBy = "papers", cascade = CascadeType.ALL)
	private Set<FavoriteList> favoritePaper = new HashSet<>();

	@Column(name = "is_active")
	private boolean isActive;

	@Column(name = "status")
	private int status;
}
