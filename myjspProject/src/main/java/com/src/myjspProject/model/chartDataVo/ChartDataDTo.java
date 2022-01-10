package com.src.myjspProject.model.chartDataVo;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class ChartDataDTo {

	private long id;
	private String time;
	private String dataA;
	private String dataB;
	private String dataC;
	private String dataD;


	 public ChartData toEntity(){
	        return new ChartData(0L,time,dataA,dataB,dataC,dataD);
	    }

}
