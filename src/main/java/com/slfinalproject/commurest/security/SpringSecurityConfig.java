package com.slfinalproject.commurest.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfiguration {
    protected void configure(HttpSecurity http) throws Exception{
        http
                .authorizeRequests()
                // 로그인이 필요없는 url
                .antMatchers("/", "/login","/register").permitAll()
                    // 그 외 모든건 인증이 필요함
                    .anyRequest().authenticated()
                .and()
                    .formLogin()
                    .loginPage("/login")
                    .usernameParameter("user_email")
                    .passwordParameter("user_pass")
                    .defaultSuccessUrl("/",true)
                    .permitAll()
                .and()
                    .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logoutProc"));



    }
}
