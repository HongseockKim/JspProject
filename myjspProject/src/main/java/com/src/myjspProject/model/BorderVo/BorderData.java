package com.src.myjspProject.model.BorderVo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "BorderData", schema = "contentdata")
@Getter
@Setter
public class BorderData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title", nullable = false, length = 255)
    private String title;

    @Column(name = "content", nullable = false, length = 255)
    private String content;

    @Column(name = "time", length = 255)
    private String time;


    public BorderData() {

    }



    public BorderData (Long id, String title, String content, String time) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.time = time;
    }
}
