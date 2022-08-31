package com.test.demo.repository;

import com.test.demo.domain.Board;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@RequiredArgsConstructor
public class boardRepository {

    private final SqlSession session;

    public List<Board> boardList(Board board) {
        List<Board> boardList = session.selectList("boardList", board);

        if(board.getSearch() != null) {
            if(board.getSearch().equals("title")) {
                boardList = session.selectList("boardTitleSearch", board);
            } else {
                boardList = session.selectList("boardContentSearch", board);
            }
        }
        return boardList;
    }

    public int total(Board board) {
        int total;
        total = session.selectOne("total");

        if(board.getSearch() != null) {
            if(board.getSearch().equals("title")) {
                total = session.selectOne("boardTitleSearchTotal", board);
            } else {
                total = session.selectOne("boardContentSearchTotal", board);
            }
        }
        return total;
    }

    public Board getBoard(int id) {
        Board getBoard = session.selectOne("getBoard", id);

        return getBoard;
    }

    public void updateBoard(Board boardDto) {
        session.update("updateBoard", boardDto);
    }

    public void deleteBoardById(int id) {
        session.delete("deleteBoardById", id);
    }

    public void insertBoard(Board boardDto) {
        if (boardDto.getPassword() == null || boardDto.getPassword() == "") {
            session.insert("insertBoardNull", boardDto);
        } else {
            session.insert("insertBoard", boardDto);
        }
    }
}




