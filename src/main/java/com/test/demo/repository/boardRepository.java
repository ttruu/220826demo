package com.test.demo.repository;

import com.test.demo.entity.board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface boardRepository extends JpaRepository<board, Integer> {


}