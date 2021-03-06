package com.src.myjspProject.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.src.myjspProject.model.BorderVo.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
	@Query(value = "select * from comment where borderId = :borderid ORDER by id DESC",nativeQuery = true)
	List<Comment> findAllById(@Param(value = "borderid")long borderid);
}