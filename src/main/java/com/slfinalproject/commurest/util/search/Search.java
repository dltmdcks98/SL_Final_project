package com.slfinalproject.commurest.util.search;


import com.slfinalproject.commurest.util.paging.Page;
import lombok.*;

@Setter @Getter @ToString
@NoArgsConstructor // 파라미터가 없는 기본 생성자
@AllArgsConstructor // 모든 필드 값을 파라미터로 받는 생성자
public class Search extends Page {

    // 검색 조건  : 제목, 내용, 작성자, 제목+내용
    private String type;

    // 검색 키워드
    private String keyword;
}
