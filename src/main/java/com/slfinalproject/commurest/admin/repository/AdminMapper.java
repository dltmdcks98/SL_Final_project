package com.slfinalproject.commurest.admin.repository;

import com.slfinalproject.commurest.admin.domain.Admin;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {

    // 회원가입 기능
    boolean regist(Admin admin);

    // 회원 삭제
    void delete(Admin admin);

    // 회원 수정
    void update(Admin admin);

    void nameUpdate(Admin admin);
    // 회원 검색
    Admin selectOne(String admin);

    List<Admin> selectAll(String admin);

    Admin selectOne2(int userId);

    List<String> insertProfile(int userId);
}
