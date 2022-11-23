package com.slfinalproject.commurest.admin.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.domain.KakaoProfile;
import com.slfinalproject.commurest.admin.domain.OAuthToken;
import com.slfinalproject.commurest.admin.repository.AdminMapper;
import com.slfinalproject.commurest.admin.service.AdminService;
import com.slfinalproject.commurest.util.RandomString;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/login")
public class KakaoLoginController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private AuthenticationManager authenticationManager;


    @GetMapping("/kakao")
    public String kakaoOauthRedirect(@RequestParam String code, HttpSession session, Admin admin) {

        // POST 방식으로 key=value 데이터 요청(카카오쪽으로)
        RestTemplate rt = new RestTemplate();

        // 요청하는 데이터 타입 지정
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");


        // 저장
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        // 카카오 RESTAPI 키
        params.add("client_id", "eac6586e062e9e84f8798226d9ac9be8");
        // 카카오 redirect 주소
        params.add("redirect_uri", "http://localhost:8182/login/kakao");
        params.add("code", code);

        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
                new HttpEntity<>(params, headers);

        // 카카오로 요청하고 객체 반환받기
        ResponseEntity<String> response = rt.exchange(
                "https://kauth.kakao.com/oauth/token",
                HttpMethod.POST,
                kakaoTokenRequest,
                String.class
        );


        ObjectMapper objectMapper = new ObjectMapper();
        OAuthToken oAuthToken = null;
        try {
            oAuthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }


        System.out.println(oAuthToken.getAccess_token());


        RestTemplate rt2 = new RestTemplate();

        // 요청하는 데이터 타입 지정
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization", "Bearer " + oAuthToken.getAccess_token());
        headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");


        HttpEntity<MultiValueMap<String, String>> kakaoEmailRequest =
                new HttpEntity<>(headers2);

        // 카카오로 요청하고 객체 반환받기
        ResponseEntity<String> response2 = rt2.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.POST,
                kakaoEmailRequest,
                String.class
        );

        System.out.println(response2.getBody());

        ObjectMapper objectMapper2 = new ObjectMapper();
        KakaoProfile kakaoProfile = null;
        try {
            kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

        RandomString randomName = new RandomString(10);


        Admin kakaoUser = new Admin();

        log.info("??" + adminService.selectOne(kakaoProfile.getKakao_account().getEmail()));
        kakaoUser.setUser_email(kakaoProfile.getKakao_account().getEmail());
        kakaoUser.setUser_pass("111");
        kakaoUser.setUser_name("(kakao)" + randomName.nextString() + "님");
        kakaoUser.setUser_sex("k");
        // db에 카카오 계정 정보가 없다면
        if (adminService.selectOne(kakaoProfile.getKakao_account().getEmail()) == null) {
            log.info("회원가입을 합니다");
            adminService.regist(kakaoUser);
        }

        log.info("로그인을 합니다");
        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(kakaoUser.getUsername(), kakaoUser.getPassword()));
        log.info("get username : " + kakaoUser.getUsername());
        SecurityContextHolder.getContext().setAuthentication(authentication);
        loginSuccess(session);


        Admin nameFInd = adminService.selectOne(kakaoProfile.getKakao_account().getEmail());
        log.info("이름이 뭐고 : " + nameFInd.getUser_name());
        if (nameFInd.getUser_name().contains("kakao")) {
            return "/member/myInfo";

        }
        return "redirect:/";
    }

    public Admin setLoginSession(HttpSession session) {
        Admin user = null;
        Object securityContextObject = session.getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
        SecurityContext securityContext = (SecurityContext) securityContextObject;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        user = (Admin) authentication.getPrincipal();

        log.info("현재 세션 정보 : " + user);
        return user;
    }

    public String loginSuccess(HttpSession session) {
        log.info("login success");
        String redirectURI = (String) session.getAttribute("redirectURI");
        Admin user = setLoginSession(session);
        if (user != null) {
            session.setAttribute("user", user);
            log.info("세션에 넣은 값 확인 - " + user);
        }

        return "redirect:" + redirectURI;
    }


}
