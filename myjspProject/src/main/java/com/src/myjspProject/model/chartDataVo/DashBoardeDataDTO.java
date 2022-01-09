package com.src.myjspProject.model.chartDataVo;

public class DashBoardeDataDTO {

	private long id;
	private String title;
	private String content;
	private String topic;
	private String time;

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}


	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}


	public DashBoardeData toEntity() {
		return new DashBoardeData(0L,title,content,time,topic);
	}



}
