package com.slfinalproject.commurest.admin.repository;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.board.domain.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {

    // 회원가입 기능
    boolean regist(Admin admin);

    // 회원 삭제
    void delete(Admin admin);

    // 회원 수정
    boolean update(Admin admin);

    boolean nameUpdate(Admin admin);
    // 회원 검색
    Admin selectOne(String admin);

    List<Admin> selectAll(String admin);

    Admin selectOne2(int userId);

    String fileNames(int userId);

    void addFile(String fileName, int userId);

    void updateFile(String fileName, int userId);
    // 프로필 이미지 등록
    List<Admin> findProfile();

    boolean checkProfile(int userId);


}
