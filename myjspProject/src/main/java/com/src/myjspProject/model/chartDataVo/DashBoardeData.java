package com.src.myjspProject.model.chartDataVo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor
@Getter@Setter
public class DashBoardeData {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String title;
	private String content;
	private String time;
	private String topic;
	public DashBoardeData(long id,String title,String content,String time,String topic) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.time = time;
		this.topic = topic;
	}
}
