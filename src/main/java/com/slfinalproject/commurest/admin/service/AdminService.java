package com.slfinalproject.commurest.admin.service;

import com.slfinalproject.commurest.admin.domain.Admin;

import com.slfinalproject.commurest.admin.repository.AdminMapper;
import com.slfinalproject.commurest.admin.repository.AdminRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AdminService implements UserDetailsService {
    @Autowired
    private final AdminMapper adminMapper;

    Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    AdminRepository adminRepository;

    // 회원가입 처리
    @Transactional
    public boolean regist(Admin admin){
       return adminMapper.regist(admin);
    }

    public Admin selectOne(String admin){
        return adminMapper.selectOne(admin);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("## loadUserByUsername ##");
        Admin admin = adminRepository.selectOne(username);
        System.out.println("계정정보"+admin);
        if(admin==null){
            throw new UsernameNotFoundException(username);
        }return admin;


    }

}
