package com.slfinalproject.commurest.admin.repository;

import com.slfinalproject.commurest.admin.domain.Admin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {

    // 회원가입 기능
    boolean regist(Admin admin);

    // 회원 삭제
    void delete(Admin admin);

    // 회원 수정
    void update(Admin admin);

    // 회원 검색
    Admin selectOne(String admin);

    Admin selectOne2(Admin admin);

}
