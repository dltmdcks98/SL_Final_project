<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty user}">
    <div class="col-xs-6 col-md-4 sidebar" id="sidebar">
        <aside>
            <div class="aside-body">
                <div class="featured-author">
                    <div class="featured-author-inner">

                        <div class="featured-author-body2">
                            <div class="box-body">
                                <h4>Login</h4>
                                <form method="POST" action="/admin/login" name="myForm">
                                    <div class="form-group2">
                                        <input type="text" name="user_email" class="myForm-email">
                                    </div>
                                    <div>
                                        <input type="password" name="user_pass"
                                               class="myForm-pass">
                                        <button name="button" class="myBtn">
                                            로그인
                                        </button>
                                    </div>
                                    <div>
                                    </div>
                                </form>
                                <button class="aaa"
                                        onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=eac6586e062e9e84f8798226d9ac9be8&redirect_uri=http://localhost:8182/login/kakao&response_type=code'"
                                        type="button" id="img_btn">
                                    <img src="/img/kakao_login_medium_wide.jpg">
                                </button>
                            </div>
                        </div>

                        <div class="block">
                            <h3 class="block-title">Hot Interests</h3>
                            <c:forEach var="imgUrl" items="${userTagImgs}">
                                <img src="${imgUrl}" onerror="this.style.display=`none`"/>
                            </c:forEach>
                        </div>

                    </div>
                </div>
            </div>
        </aside>

    </div>

</c:if>

<c:if test="${not empty user}">
    <div class="col-xs-6 col-md-4 sidebar" id="sidebar">
        <aside>
            <div class="aside-body">
                <div class="featured-author">
                    <div class="featured-author-inner">


                        <div class="featured-author-body">
                            <div class="featured-author-cover">
                                <div class="badges">
                                    <div class="badge-item"><i class="ion-star"></i> 프로필</div>
                                </div>
                                <div class="featured-author-center">
                                    <figure class="featured-author-picture">
                                        <img src="/img/img01.jpg" alt="Sample Article">
                                    </figure>
                                    <div class="featured-author-info">
                                        <div class="user-name">${user.user_name}</div>
                                    </div>

                                </div>
                            </div>
                            <div class="featured-author-count">
                                <div class="item">
                                    <a href="/mypage/myposting">
                                        <div class="name" >게시글</div>
                                        <div class="value"><c:out value="${userBoardCnt}"/></div>
                                    </a>
                                </div>
                                <div class="item">
                                    <a href='/mypage/mycomment'>
                                        <div class="name" >댓글</div>
                                        <div class="value"><c:out value="${userReplyCnt}"/> </div>
                                    </a>
                                </div>
                                <div class="item">
                                    <a href="/mypage">
                                        <div class="icon">
                                            <div >더보기</div>
                                            <i class="ion-chevron-right"></i>
                                        </div>
                                    </a>
                                </div>
                            </div>


                        </div>

                        <div class="block">
                            <h3 class="block-title">My Interests</h3>
                            <c:forEach var="imgUrl" items="${userTagImgs}">
                                <img src="${imgUrl}" onerror="this.style.display=`none`"/>
                            </c:forEach>
                        </div>

                    </div>
                </div>
            </div>
        </aside>

    </div>

</c:if>