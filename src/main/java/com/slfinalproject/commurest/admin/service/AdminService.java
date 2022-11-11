package com.slfinalproject.commurest.admin.service;

import com.slfinalproject.commurest.admin.domain.Admin;

import com.slfinalproject.commurest.admin.repository.AdminMapper;
import com.slfinalproject.commurest.admin.repository.AdminRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminService implements UserDetailsService {
    @Autowired
    private final AdminMapper adminMapper;


    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }





    Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    AdminRepository adminRepository;







    // 회원가입 처리
    @Transactional
    public boolean regist(Admin admin) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        admin.setUser_pass(passwordEncoder.encode(admin.getUser_pass()));
        admin.setManager("ADMIN");


        return adminMapper.regist(admin);
    }

    public Admin selectOne(String admin) {
        return adminMapper.selectOne(admin);
    }



    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("## loadUserByUsername ##");
        Admin admin = adminRepository.selectOne(username);
        System.out.println("계정정보" + admin);
        if (admin != null) {
            admin.setAuthorities(Arrays.asList(new SimpleGrantedAuthority(admin.getManager())));
        }


        return admin;


    }


}
