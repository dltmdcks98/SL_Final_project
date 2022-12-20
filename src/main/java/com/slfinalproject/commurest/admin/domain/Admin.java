package com.slfinalproject.commurest.admin.domain;

import com.slfinalproject.commurest.board.domain.Board;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Date;

@Data
public class Admin implements UserDetails {

    private int user_id;
    private String manager;
    private String user_birth;
    private String user_email;
    private String user_pass;
    private String user_name;
    private Date reg_date;
    private String user_sex;
    //프로필 설정
    private String profile;
    private Board board;

    private int failCnt;
    private boolean isAccountNonExpired;
    private boolean isAccountNonLocked;
    private boolean isCredentialIsNonExpired;
    private boolean isEnabled;


    private Collection<? extends GrantedAuthority> authorities;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.authorities;
    }

    @Override
    public String getPassword() {
        return this.user_pass;
    }

    @Override
    public String getUsername() {
        return this.user_email;
    }

    @Override
    public boolean isAccountNonExpired() { // 계정 만료 여부
        return true;
    }

    @Override
    public boolean isAccountNonLocked() { // 계정 잠김 여부
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() { // 비밀번호 만료 여부
        return true;
    }

    @Override
    public boolean isEnabled() { // 사용자 활성화 여부
        return true;
    }


}

