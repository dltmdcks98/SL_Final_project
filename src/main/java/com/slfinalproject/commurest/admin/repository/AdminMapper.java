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
    boolean update(Admin admin);

    boolean nameUpdate(Admin admin);
    // 회원 검색
    Admin selectOne(String admin);

    Admin selectOne2(int userId);



    //프로필 이미지 조회
    String getProfile(int userId);


    //프로필 업데이트
    boolean updateProfile(String profile, int userId);

}
