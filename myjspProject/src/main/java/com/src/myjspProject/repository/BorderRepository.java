package com.src.myjspProject.repository;

import com.src.myjspProject.model.BorderVo.BorderData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BorderRepository extends JpaRepository<BorderData, String> {

}
