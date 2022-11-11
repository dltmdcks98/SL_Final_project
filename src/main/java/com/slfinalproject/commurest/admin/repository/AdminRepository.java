package com.slfinalproject.commurest.admin.repository;

import com.slfinalproject.commurest.admin.domain.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminRepository {
    @Autowired
    AdminMapper adminMapper;

    public Admin selectOne(String username){
        return adminMapper.selectOne(username);
    }
}
