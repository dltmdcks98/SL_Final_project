<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 댓글관련 script -->

<script>

    // 로그인한 회원 계정명 -> 세션을 통해 얻고 있음
    const currentAccount = '${user.user_id}';
    const auth = '${user.manager}';
    console.log(currentAccount,auth);
    //원본 글 번호
    const bno = '${b.boardNo}';
    // console.log('bno:', bno);

    // 댓글 요청 URL
    const URL = '/ajax/replies';
    const $pageUl = document.querySelector('.pagination');
    //날짜 포맷 변환 함수
    function formatDate(datetime) {
        //문자열 날짜 데이터를 날짜객체로 변환
        const dateObj = new Date(datetime);
        // console.log(dateObj);
        //날짜객체를 통해 각 날짜 정보 얻기
        let year = dateObj.getFullYear();
        //1월이 0으로 설정되어있음.
        let month = dateObj.getMonth() + 1;
        let day = dateObj.getDate();
        let hour = dateObj.getHours();
        let minute = dateObj.getMinutes();
        /*        //오전, 오후 시간체크
                let ampm = '';
                if (hour < 12 && hour >= 6) {
                    ampm = '오전';
                } else if (hour >= 12 && hour < 21) {
                    ampm = '오후';
                    if (hour !== 12) {
                        hour -= 12;
                    }
                } else if (hour >= 21 && hour <= 24) {
                    ampm = '밤';
                    hour -= 12;
                } else {
                    ampm = '새벽';
                }*/
        //숫자가 1자리일 경우 2자리로 변환
        (month < 10) ? month = '0' + month: month;
        (day < 10) ? day = '0' + day: day;
        (hour < 10) ? hour = '0' + hour: hour;
        (minute < 10) ? minute = '0' + minute: minute;
        return year + "-" + month + "-" + day + " " + " " + hour + ":" + minute;
    }


    // 댓글 페이지 태그 생성 렌더링 함수
    function makePageDOM(pageInfo) {
        let tag = "";
        const begin = pageInfo.beginPage;
        const end = pageInfo.endPage;

        //이전 버튼 만들기
        if (pageInfo.prev) {
            tag += "<li class='page-item'><a class='page-link page-active' href='" + (begin - 1) +
                "'>이전</a></li>"
        }
        //페이지 번호 리스트 만들기
        for (let i = begin; i <= end; i++) {
            let active = '';
            if (pageInfo.page.pageNum == i) {
                active = 'p-active';
            }

            tag += "<li class='page-item " + active + "'><a class='page-link page-custom' href='" + i +
                "'>" + i + "</a></li>";
        }
        //다음 버튼 만들기
        if (pageInfo.next) {
            tag += "<li class='page-item'><a class='page-link page-active' href='" + (end + 1) +
                "'>다음</a></li>";
        }

        // 페이지태그 렌더링

        console.log(tag,$pageUl);
        $pageUl.innerHTML = tag;

        // ul에 마지막페이지 번호 저장.
        $pageUl.dataset.fp = pageInfo.finalPage;


    }


    // 댓글 목록 DOM을 생성하는 함수
    function makeReplyDOM({
                              replyList,
                              count,
                              maker
                          }) {
        // 각 댓글 하나의 태그
        let tag = '';

        if (replyList == null || replyList.length == 0) {
            tag += "<div id='replyContent' class='card-body'>댓글이 아직 없습니다</div>";

        } else {
            for (let rep of replyList) {
                console.log(rep);
                tag += "<div id='replyContent' class='card-body' data-replyId='" + rep.replyNo + "'>" +
                    "    <div class='row user-block'>" +
                    "       <span class='col-md-3'>" +
                    "         <b>" + rep.replyWriter + "</b>" +
                    "       </span>" +
                    "       <span class='offset-md-6 col-md-3 text-right'><b>" + rep.replyDate +
                    "</b></span>" +
                    "    </div><br>" +
                    "    <div class='row'>" +
                    "       <div class='col-md-6'>" + rep.replyText + "</div>" +
                    "       <div class='offset-md-2 col-md-4 text-right'>";

                //권한 확인
                if (currentAccount == rep.userAccount || auth == 'ADMIN') {
                    tag += "         <a id='replyModBtn' class='btn btn-sm btn-outline-dark' data-bs-toggle='modal' data-bs-target='#replyModifyModal'>수정</a>&nbsp;" +
                        "         <a id='replyDelBtn' class='btn btn-sm btn-outline-dark' href='#'>삭제</a>";
                }
                tag += "       </div>" +
                    "    </div>" +
                    " </div>";
            }
            console.log(tag);
        }

        // 댓글 목록에 생성된 DOM 추가
        document.getElementById('replyData').innerHTML = tag;

        // 댓글 수 배치
        document.getElementById('replyCnt').textContent = count;

        // 페이지 렌더링
        makePageDOM(maker);



    }

    // 댓글 목록을 서버로부터 비동기요청으로 불러오는 함수
    function showReplies(pageNum = 1) {

        fetch(URL + '?boardNo=' + bno + '&pageNum=' + pageNum)
            .then(res => res.json())
            .then(replyMap => {
                console.log("댓글 목록 비동기 콘솔"+replyMap.replyList);
                makeReplyDOM(replyMap);
            });
    }

    // 페이지 버튼 클릭이벤트 등록 함수
    function makePageButtonClickEvent() {
        // 페이지 버튼 클릭이벤트 처리
        // const $pageUl = document.querySelector('.pagination');
        $pageUl.onclick = e => {
            console.log(e);
            if (!e.target.matches('.page-item a')) return;

            e.preventDefault();
            // 누른 페이지 번호 가져오기
            const pageNum = e.target.getAttribute('href');
            // console.log(pageNum);

            // 페이지 번호에 맞는 목록 비동기 요청
            showReplies(pageNum);
        };
    }

    // 댓글 등록 이벤트 처리 핸들러 등록 함수
    function makeReplyRegisterClickEvent() {
        document.getElementById('replyAddBtn').onclick = makeReplyRegisterClickHandler;
    }

    // 댓글 등록 이벤트 처리 핸들러 함수
    function makeReplyRegisterClickHandler() {

        const $writerInput = document.getElementById('newReplyWriter');
        const $contentInput = document.getElementById('newReplyText');

        // 서버로 전송할 데이터들
        const replyData = {
            replyWriter: $writerInput.value,
            replyText: $contentInput.value,
            boardNo: bno
        };
        console.log(replyData);

        // POST요청을 위한 요청 정보 객체
        const reqInfo = {
            method: 'POST',
            headers: {
                'content-type': 'application/json'
            },
            body: JSON.stringify(replyData)
        };

        fetch(URL, reqInfo)
            .then(res => res.text())
            .then(msg => {
                if (msg == 'insert-success') {
                    alert('댓글 등록 성공');
                    // 댓글 입력창 리셋
                    // $writerInput.value = '';
                    $contentInput.value = '';
                    // 댓글 목록 재요청
                    showReplies($pageUl.dataset.fp);
                } else {
                    alert('댓글 등록 실패');
                }
            });
    }

    // 댓글 수정화면 열기 상세처리
    function processModifyShow(e, rno) {


        // 클릭한 버튼 근처에 있는 댓글 내용텍스트를 얻어온다.
        const replyText = e.target.parentElement.parentElement.firstElementChild.textContent;


        // 모달에 해당 댓글내용을 배치한다.
        document.getElementById('modReplyText').value = replyText;

        // 모달을 띄울 때 다음 작업(수정완료처리)을 위해 댓글번호를 모달에 달아두자.
        const $modal = document.querySelector('.modal');
        $modal.dataset.rno = rno;
    }

    // 댓글 삭제 상세처리
    function processRemove(rno) {
        if (!confirm('지울까요?')) return;

        fetch(URL + '/' + rno, {
            method: 'DELETE'
        })
            .then(res => res.text())
            .then(msg => {
                if (msg == 'del-success') {
                    alert('삭제 성공!!');
                    showReplies(); // 댓글 새로불러오기
                } else {
                    alert('삭제 실패!!');
                }
            });
    }


    // 댓글 수정화면 열기, 삭제 처리 핸들러 정의
    function makeReplyModAndDelHandler(e) {

        const rno = e.target.parentElement.parentElement.parentElement.dataset.replyid;
        console.log('mod get rno: ', rno);

        e.preventDefault();

        if (e.target.matches('#replyModBtn')) {
            processModifyShow(e, rno);
        } else if (e.target.matches('#replyDelBtn')) {
            processRemove(rno);
        }
    }

    // 댓글 수정 화면 열기, 삭제 이벤트 처리
    function openModifyModalAndRemoveEvent() {

        const $replyData = document.getElementById('replyData');
        $replyData.onclick = makeReplyModAndDelHandler;
    }

    // 댓글 수정 비동기 처리 이벤트
    function replyModifyEvent() {

        const $modal = $('#replyModifyModal');

        document.getElementById('replyModBtn').onclick =
            e => {
                // console.log('수정 완료 버튼 클릭!');

                // 서버에 수정 비동기 요청 보내기
                const rno = e.target.closest('.modal').dataset.rno;
                console.log('mod post rno', rno);

                const reqInfo = {
                    method: 'PUT',
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify({
                        replyText: $('#modReplyText').val(),
                        replyNo: rno
                    })
                };


                fetch(URL + '/' + rno, reqInfo)
                    .then(res => res.text())
                    .then(msg => {
                        if (msg == 'mod-success') {
                            alert('수정 성공!!');
                            $modal.modal('hide'); // 모달창 닫기
                            showReplies(); // 댓글 새로불러오기
                        } else {
                            alert('수정 실패!!');
                        }
                    });
            };
    }



    // 메인 실행부
    (function () {

        // 초기 화면 렌더링시 댓글 1페이지 렌더링
        showReplies();

        // 댓글 페이지 버튼 클릭이벤트 처리
        makePageButtonClickEvent();

        // // 댓글 등록 버튼 클릭이벤트 처리
        // makeReplyRegisterClickEvent();
        console.log(currentAccount);
        if(currentAccount!=''){
            makeReplyRegisterClickEvent();
        }

        // 댓글 수정 모달 오픈, 삭제 이벤트 처리
        openModifyModalAndRemoveEvent();

        // 댓글 수정 완료 버튼 이벤트 처리
        replyModifyEvent();

    })();
</script>
