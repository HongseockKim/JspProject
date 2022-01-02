package com.src.myjspProject.model.BorderVo;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class BorderDataDTO {
    private String id;
    private String title;
    private String content;
    private String time;


    public BorderData toEntity(){
        return new BorderData(id,title,content,time);
    }


}

