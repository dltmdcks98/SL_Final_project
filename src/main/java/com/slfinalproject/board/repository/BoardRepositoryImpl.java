package com.slfinalproject.board.repository;

import com.slfinalproject.board.domain.Board;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class BoardRepositoryImpl implements BoardRepository {
    @Override
    public boolean save(Board board) {
        return false;
    }

    @Override
    public List<Board> selectAll() {
        return null;
    }
}
