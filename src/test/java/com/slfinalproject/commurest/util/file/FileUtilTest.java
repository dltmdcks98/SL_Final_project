package com.slfinalproject.commurest.util.file;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class FileUtilTest {


    @Test
    @DisplayName("정규식 test")
    void testst(){
        String str = "[6520539] iu_new-20190708-222946-003-resize.jpg";


        System.out.println(str.replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9.]", ""));
    }

}