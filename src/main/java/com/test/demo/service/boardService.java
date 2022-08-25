package com.test.demo.service;

import com.test.demo.entity.board;
import com.test.demo.repository.boardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class boardService {

    @Autowired
    private boardRepository boardRepository;

    public boolean write(board boardDto) {
        boardDto.setInserted(LocalDateTime.now());
        boardRepository.save(boardDto);
        return false;
    }

    public List<board> boardList(String type, String keyword) {
        return boardRepository.findAll();
    }

    public board getBoard(Integer id) {
        return boardRepository.findById(id).get();
    }
}
