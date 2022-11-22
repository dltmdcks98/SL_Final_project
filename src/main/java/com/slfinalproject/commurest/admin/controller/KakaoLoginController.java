package com.slfinalproject.commurest.admin.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.slfinalproject.commurest.admin.domain.OAuthToken;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/login")
public class KakaoLoginController {

    @GetMapping("/kakao")
    public String kakaoOauthRedirect(@RequestParam String code) {

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
        headers2.add("Authorizaition","Bearer "+oAuthToken.getAccess_token());
        headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");


        HttpEntity<MultiValueMap<String, String>> kakaoEmailRequest =
                new HttpEntity<>( headers2);

        // 카카오로 요청하고 객체 반환받기
        ResponseEntity<String> response2 = rt2.exchange(
                "https://kauth.kakao.com",
                HttpMethod.POST,
                kakaoEmailRequest,
                String.class
        );

        System.out.println(response2.getBody());
        return response2.getBody();

    }


}
