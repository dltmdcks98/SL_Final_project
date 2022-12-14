package com.slfinalproject.commurest.admin.service;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.repository.AdminMapper;
import com.slfinalproject.commurest.admin.repository.AdminRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.Arrays;

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

        // 카카오로 회원가입
        if(admin.getUser_sex()=="k"){
            admin.setManager("ROLE_KAKAO");
        }
        else{

            // 관리자용 회원가입
            //admin.setManager("ROLE_ADMIN");
            // 일반 유저용 회원가입
            admin.setManager("ROLE_USER");

        }

        return adminMapper.regist(admin);
    }

    // 업데이트 처리
    public boolean update(Admin admin) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        admin.setUser_pass(passwordEncoder.encode(admin.getUser_pass()));
        boolean flag = adminMapper.update(admin);
        return flag;
    }

    public boolean nameUpdate(Admin admin) {
        boolean flag = adminMapper.nameUpdate(admin);
        return flag;
    }

    // 회원탈퇴 처리
    public void delete(Admin admin){
        adminMapper.delete(admin);
    }

    public Admin selectOne2(int userId) {

        return adminMapper.selectOne2(userId);
    }


    public Admin selectOne(String admin){
        return adminMapper.selectOne(admin);
    }

    // 현재 세션 정보 가져오기
    public Admin setLoginSession(HttpSession session) {
        Admin user = null;
        Object securityContextObject = session.getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
        if (securityContextObject != null) {
            SecurityContext securityContext = (SecurityContext) securityContextObject;
            Authentication authentication = securityContext.getAuthentication();

            user = (Admin) authentication.getPrincipal();

        }

        return user;
    }


    //프로필 사진 조회
    public String getProfile(int userId) {
        if(adminMapper.getProfile(userId)==null || adminMapper.getProfile(userId).isEmpty())return null;
        return adminMapper.getProfile(userId);
    }
    // 프로필 사진 수정
    public boolean updateProfile(String profile, int userId) {
       boolean status =  adminMapper.updateProfile(profile,userId);

       return status;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Admin admin = adminMapper.selectOne(username);
        if (admin != null) {
            admin.setAuthorities(Arrays.asList(new SimpleGrantedAuthority(admin.getManager())));
        }

        return admin;


    }


}
