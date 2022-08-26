package com.test.demo.repository;

import com.test.demo.domain.Board;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@RequiredArgsConstructor
public class boardRepository {

    private final SqlSession session;

    public List<Board> boardList(Board board) {
        List<Board> boardList = session.selectList("boardList", board);

        return boardList;
    }

    public Board getBoard(long id) {
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
        session.insert("insertBoard", boardDto);
    }

}




