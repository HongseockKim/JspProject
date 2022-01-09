package com.src.myjspProject.model.chartDataVo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "ChartData", schema = "contentdata")
@NoArgsConstructor
@Getter@Setter
public class ChartData {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String time;
	private String dataA;
	private String dataB;
	private String dataC;
	private String dataD;

	public ChartData(long id, String time, String dataA, String dataB, String dataC, String dataD) {
		this.id = id;
		this.time = time;
		this.dataA = dataA;
		this.dataB = dataB;
		this.dataC = dataC;
		this.dataD = dataD;
	}

}
