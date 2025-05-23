package vn.iotstar.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Set;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "favorite_list")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FavoriteList implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

	@Column(name = "created_at")
	private java.util.Date createdAt; 

    // Danh sách yêu thích thuộc về 1 người dùng
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    // Mỗi danh sách có thể chứa nhiều bài viết
    @ManyToMany
    @JoinTable(
        name = "favorite_list_paper",
        joinColumns = @JoinColumn(name = "favorite_list_id"),
        inverseJoinColumns = @JoinColumn(name = "paper_id")
    )
    private Set<Paper> papers;
}
