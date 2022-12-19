package com.slfinalproject.commurest.admin.repository;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class AdminMapperTest {

    @Autowired
    AdminMapper adminMapper;

    @Test
    @DisplayName("sql문 test")
    void updateProfile(){
        boolean status = adminMapper.updateProfile("ㅅㄷㄴㅅ",6);
        assertTrue(status);
    }

}