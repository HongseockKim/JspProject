package com.src.myjspProject.model.memberVo;



import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class MemberDTO {
	private long id;
	private String name;
	private int age;
	private String email;
	private String password;
	private String userId;

	public Memberdata toEntity() {
		return new Memberdata(0L,name,age,email,password,userId);
	}

}
