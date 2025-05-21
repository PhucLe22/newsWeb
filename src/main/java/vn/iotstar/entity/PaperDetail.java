package vn.iotstar.entity;

import java.io.Serializable;
import java.sql.Date;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.NamedQuery;
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
@Table(name = "paper_detail")
@NamedQuery(name = "PaperDetail.findAll", query = "SELECT cd from PaperDetail cd")
public class PaperDetail implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "description", length = 10000)
	private String description;

	@Column(name = "paper_introduction", length = 1000)
	private String paperIntroduction;

	@Lob
	@Column(name = "paper_image", columnDefinition = "LONGTEXT")
	private String paperImage;

	@Column(name = "paper_image_description", length = 1000)
	private String paperImageDescription;

	@Lob
	@Column(name = "paper_video", columnDefinition = "LONGTEXT")
	private String paperVideo;

	@Lob
	@Column(name = "content", columnDefinition = "LONGTEXT")
	private String paperContent;

	@OneToOne(mappedBy = "paperDetail")
	private Paper paper;

	@Column(name = "created_at")
	private java.util.Date createdAt; 
}