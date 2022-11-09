package com.slfinalproject.commurest.admin.service;

import com.slfinalproject.commurest.admin.domain.Admin;

import com.slfinalproject.commurest.admin.repository.AdminMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AdminService {
    private final AdminMapper adminMapper;


    // 회원가입 처리
    @Transactional
    public boolean regist(Admin admin){
       return adminMapper.regist(admin);
    }

    public Admin selectOne(Admin admin){
        return adminMapper.selectOne(admin);
    }


}
