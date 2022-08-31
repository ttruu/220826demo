package com.test.demo.repository;

import com.test.demo.domain.Board;
import com.test.demo.domain.Member;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@RequiredArgsConstructor
public class memberRepository {

    private final SqlSession session2;

    public void addMember(Board boardDto) {
        if (boardDto.getPassword() == null || boardDto.getPassword() == "") {
            session2.insert("addMemberNull", boardDto);
        } else {
            session2.insert("addMember", boardDto);
        }

    }
}
