package com.slfinalproject.commurest.util;

import org.springframework.stereotype.Component;

import java.security.MessageDigest;

@Component
public class HashManager {
    public static String getConvertedPassword(String pass) {
        StringBuffer sb = null;

        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(pass.getBytes("UTF-8"));
            sb = new StringBuffer();
            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if (hex.length() == 1) {
                    sb.append("0");
                }
                sb.append(hex);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
}
