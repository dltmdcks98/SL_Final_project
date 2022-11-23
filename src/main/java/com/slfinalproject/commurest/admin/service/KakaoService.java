package com.slfinalproject.commurest.admin.service;

import com.slfinalproject.commurest.admin.repository.AdminMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;


@Service
@RequiredArgsConstructor

public class KakaoService {

    @Autowired
    private final AdminMapper adminMapper;



}
