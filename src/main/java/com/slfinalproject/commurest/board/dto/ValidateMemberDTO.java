package com.slfinalproject.commurest.board.dto;

import com.slfinalproject.commurest.admin.domain.Auth;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
//@NoArgsConstructor
@AllArgsConstructor
public class ValidateMemberDTO {
    // account = user_id
    // auth = manager
    private String account;
    private Auth auth;

    public ValidateMemberDTO() {
        account = "no";
        auth= Auth.COMMON; // 등급으로 컷
    }
}
