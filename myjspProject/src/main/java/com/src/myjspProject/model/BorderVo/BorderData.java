package com.src.myjspProject.model.BorderVo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter @Setter
public class BorderData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "content", nullable = false)
    private String content;

    private String time;


    public BorderData() {

    }



    public BorderData (String id, String title, String content, String time) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.time = time;
    }

}
