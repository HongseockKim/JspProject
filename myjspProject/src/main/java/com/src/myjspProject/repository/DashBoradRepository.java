package com.src.myjspProject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.src.myjspProject.model.chartDataVo.DashBoardeData;



public interface DashBoradRepository extends JpaRepository<DashBoardeData, Long>  {
}
