package vn.iotstar.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.HashSet;
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
    private int id;

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
    // Một danh sách yêu thích chứa nhiều bài viết
    @OneToMany(mappedBy = "favoriteList", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Paper> papers = new HashSet<>();
}
