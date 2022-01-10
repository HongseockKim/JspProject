package com.src.myjspProject.model.memberVo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Memberdata", schema = "contentdata")
@NoArgsConstructor
@Getter@Setter
public class Memberdata {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String name;
	private int age;
	private String email;
	private String password;
	private String userId;

	public Memberdata(long id, String name, int age, String email, String password, String userId) {
		this.id=id;
		this.name =name;
		this.age = age;
		this.password = password;
		this.userId = userId;
	}
}
