package com.slfinalproject.commurest.util.paging;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
@AllArgsConstructor

public class Page {
    private int pageNum; // 페이지 번호
    private int amount; // 페이지당 나올 게시물 개수
    public Page() {
        this.pageNum=1;
        this.amount=10;
    }
    public int getStart() {
        return (pageNum-1)*amount;
    }
    public void setPageNum(int pageNum) {
        if(pageNum <=0 || pageNum > Integer.MAX_VALUE) {
            this.pageNum=1;
            return;
        }
        this.pageNum=pageNum;
    }
    public void setAmount(int amount) {
        if(amount <10 || amount >100) {
            this.amount=10;
            return;
        }
        this.amount=amount;
    }

}

