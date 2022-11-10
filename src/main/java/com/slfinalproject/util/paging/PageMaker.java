package com.slfinalproject.util.paging;

public class PageMaker {

    // 한번에 나올 페이지 수 (1~10페이지)
    private static int PAGE_COUNT =10;

    // 렌더링시 페이지 시작과 끝 값
    private int beginPage, endPage, finalPage;

    // 페이지 버튼 활성화 기능
    private boolean prev, next;

    // 현재 위치한 페이지 정보
    private Page page;

    // 총 게시물 수
    private int totalPage;

    public PageMaker(Page page) {
        this.page=page;
        this.totalPage=totalPage;
        PageInit();
    }
    private void PageInit() {
        // endPage 계산
        this.endPage= (int)(Math.ceil(page.getPageNum()/(double)PAGE_COUNT) * PAGE_COUNT);
        // beginPage 계산
        this.beginPage=endPage-(PAGE_COUNT+1);

        int realEnd =(int)Math.ceil((double)totalPage/page.getAmount());

        this.finalPage=realEnd;

        if(realEnd < endPage) {
            this.endPage=realEnd;
        }

        this.prev=beginPage >1;

        this.next=endPage<realEnd;
    }
}
