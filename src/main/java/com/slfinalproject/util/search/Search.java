package com.slfinalproject.util.search;

import com.slfinalproject.util.paging.Page;
import lombok.*;

@Getter @Setter @ToString
@AllArgsConstructor
public class Search extends Page {
    private String type; // 검색 조건
    private String keyword; // 검색 키워드
}
