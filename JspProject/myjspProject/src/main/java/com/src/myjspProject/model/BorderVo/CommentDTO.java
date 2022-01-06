package com.src.myjspProject.model.BorderVo;

public class CommentDTO {
	private Long id;
	private String comments;
	private int borderId;
	private String time;



	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getBorderId() {
		return borderId;
	}
	public void setBorderId(int borderId) {
		this.borderId = borderId;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}


	public Comment toEntity(){
        return new Comment(0L,comments,borderId,time);
    }
}
