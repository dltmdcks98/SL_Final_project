package com.slfinalproject.commurest.admin.service;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class AdminServiceTest {

    @Autowired
    AdminService adminService;

    @Test
    @DisplayName("get profile")
    void getFile() {
        String str = adminService.getFiles(6);
        assertNotNull(str);
        System.out.println(str);
    }

    @Test
    @DisplayName("update profile")
    void updateFile(){
        assertTrue(adminService.updateProfile("tetettet",6));
    }

}