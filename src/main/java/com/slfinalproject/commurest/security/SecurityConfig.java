package com.slfinalproject.commurest.security;

import com.slfinalproject.commurest.admin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    AdminService adminService;





    @Bean
    protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        http.authorizeRequests() // 각 경로에 따른 권한 지정
                    .antMatchers("/", "/login","/register","/index","/css/**","/fonts/**","/img/**","/js/**","/scripts/**","/scss/**","/src/**","/gallery/**","/ajax-gallery/**").permitAll() // 누구나 가능
                    .antMatchers(HttpMethod.POST, "/admin/regist","/admin/login").permitAll()
                    .antMatchers("/board/**").hasRole("ADMIN") // "admin"만 접근 가능, 테이블에 ROLE_권한명 으로 저장해야함
                    .anyRequest().authenticated() // 로그인된 사용자가 요청을 수행할 때 필요
                    .and()
                .formLogin()
                        .loginPage("/login") // 로그인이 수행될 경로
                        .loginProcessingUrl("/admin/login") // 로그인form의 action이랑 일치해야함
                        .usernameParameter("user_email")
                        .passwordParameter("user_pass")
//                TODO : 이전 페이지로 이동
                        .defaultSuccessUrl("/login_success") // 로그인 성공시 이동할 경로
                    .permitAll()
                    .and()
                .logout()
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/")
                    .and()
                .exceptionHandling()
                    .accessDeniedPage("/accessDenied_page") // 권한이 없는 대상이 접속을 시도했을때
                .and()
                    .csrf()
                    .ignoringAntMatchers("/admin/login")
                    .ignoringAntMatchers("/admin/regist");


        return http.build();
    }



}
