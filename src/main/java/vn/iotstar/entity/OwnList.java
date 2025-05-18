package vn.iotstar.entity;


import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Set;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "own_list")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OwnList implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    private LocalDateTime createdAt;

    // Tác giả sở hữu danh sách này
    @ManyToOne
    @JoinColumn(name = "author_id")
    private User author;

    // Danh sách các bài viết do tác giả này tạo (tùy chỉnh nhóm lại)
    @ManyToMany
    @JoinTable(
        name = "own_list_paper",
        joinColumns = @JoinColumn(name = "own_list_id"),
        inverseJoinColumns = @JoinColumn(name = "paper_id")
    )
    private Set<Paper> papers;
}
