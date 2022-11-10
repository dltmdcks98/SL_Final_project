package com.slfinalproject.commurest.admin.domain;

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
    public boolean isAccountNonExpired() {
        return this.isAccountNonExpired;
    }

    @Override
    public boolean isAccountNonLocked() {
        return this.isAccountNonLocked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return this.isCredentialIsNonExpired;
    }

    @Override
    public boolean isEnabled() {
        return this.isEnabled;
    }


}

