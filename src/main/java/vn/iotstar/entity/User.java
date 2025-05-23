package vn.iotstar.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString(exclude = { "role", "savedPapers", "sender", "receiver" })
@Table(name = "users")
@Inheritance(strategy = InheritanceType.JOINED)
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
@Entity
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	protected int id;

	@Column(name = "fullname", columnDefinition = "NVARCHAR(200) NOT NULL")
	@NotEmpty(message = "Không được phép rỗng")
	protected String fullname;

	@Column(name = "email")
	protected String email;

	@Column(name = "phoneNumber")
	protected String phoneNumber;

	@Column(name = "avatarUrl", columnDefinition = "NVARCHAR(200) NOT NULL")
	@NotEmpty(message = "Không được phép rỗng")
	protected String avatarUrl;

	@Column(name = "password")
	protected String password;

	@ManyToOne
	@JoinColumn(name = "roleId", nullable = false) // Foreign key roleId, không cho phép null nếu bắt buộc nhập Role
	private Role role;

	@OneToOne(mappedBy = "sender")
	private Notification sender;

	@OneToOne(mappedBy = "receiver")
	private Notification receiver;

	@Column(name = "is_active")
	private boolean isActive;

	@ManyToMany
	@JoinTable(name = "user_saved_paper", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "paper_id"))
	private List<Paper> savedPapers;
}
