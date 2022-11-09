package com.slfinalproject.commurest.admin.domain;

import lombok.Data;

import java.util.Date;

@Data
public class Admin {
    private int user_id;
    private String manager;
    private String user_birth;
    private String user_email;
    private String user_pass;
    private String user_name;
    private Date reg_date;
    private String user_sex;



}

