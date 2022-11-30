package com.slfinalproject.commurest.security;

import com.slfinalproject.commurest.admin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    AdminService adminService;


    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception{
        return authenticationConfiguration.getAuthenticationManager();
    }






    // 기능 설명
    // hasRole('role1')	 권한(role1)을 가지고 있는 경우
    // hasAnyRole('role1', 'role2')	 권한들(role1, role2) 하나라도 가지고 있을 경우 (갯수는 제한없다)
    // pemitAll	 권한 있든 말든 모두 접근 가능하다.
    // denyAll	 권한 있든 말든 모두 접근 불가능하다.
    // isAnonymous()	 Anonymous 사용자일 경우 (인증을 하지 않은 사용자)
    // isRememberMe()	 Remember-me 기능으로 로그인한 사용자일 경우
    // isAuthenticated()	 Anonymous 사용자가 아닐 경우 (인증을 한 사용자)
    // isFullyAuthenticated()	 Anonymous 사용자가 아니고 Remember-me 기능으로 로그인 하지 않은 사용자 일 경우
    @Bean
    protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeRequests() // 각 경로에 따른 권한 지정
                .antMatchers("/", "/login", "/register", "/index", "/css/**", "/fonts/**", "/img/**", "/js/**", "/scripts/**", "/scss/**", "/src/**", "/gallery/**", "/ajax-gallery/**", "/board", "/board/content/**","/ajax/replies/**","/login/**","/search/**", "/loadFile/**", "/board/file/**").permitAll() // 누구나 가능
                .antMatchers(HttpMethod.POST,"/upload","/ajax-upload", "/admin/regist", "/admin/login", "/board/**", "/ajax/replies/**", "/update","/update-kakao","userDelete", "/board/heart").permitAll()
                .antMatchers("/board/**").hasAnyRole("ADMIN","USER","KAKAO") // "admin"만 접근 가능, 테이블에 ROLE_권한명 으로 저장해야함
                .anyRequest().authenticated() // 로그인된 사용자가 요청을 수행할 때 필요
                .and()
                .formLogin()
                .loginPage("/login") // 로그인이 수행될 경로
                .loginProcessingUrl("/admin/login") // 로그인form의 action이랑 일치해야함
                .usernameParameter("user_email")
                .passwordParameter("user_pass")
                    .defaultSuccessUrl("/login_success",true) // 로그인 성공시 이동할 경로
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
                .ignoringAntMatchers("/board/**")
                .ignoringAntMatchers("/admin/regist")
                .ignoringAntMatchers("/update")
                .ignoringAntMatchers("/update-kakao")
                .ignoringAntMatchers("/userDelete")
                .ignoringAntMatchers("/ajax/replies/**")
                .ignoringAntMatchers("/ajax-upload")
                .ignoringAntMatchers("/upload")
                .ignoringAntMatchers("/board/heart")
        ;


        return http.build();
    }


}
