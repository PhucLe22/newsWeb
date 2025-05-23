package vn.iotstar.entity;

import java.io.Serializable;
import java.sql.Date;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "comment")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(columnDefinition = "TEXT")
    private String content;

    // Quan hệ: Comment được viết bởi 1 User
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    // Quan hệ: Comment thuộc về một Paper
    @ManyToOne
    @JoinColumn(name = "paper_id")
    private Paper paper;
}
