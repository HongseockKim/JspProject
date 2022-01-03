package com.src.myjspProject.model.BorderVo;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class BorderDataDTO {
    private Long id;
    private String title;
    private String content;
    private String time;


    public BorderData toEntity(){
        return new BorderData(0L,title,content,time);
    }


}

