<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
    li{
        font-family: 'Jeju Gothic', sans-serif;
    }

</style>

<!-- header -->

        <div class="firstbar">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-12">
                        <div class="brand">
                            <a href="/">
                                <img src="/img/logo1.png" alt="Magz Logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <form action="/search"  class="search" autocomplete="off">
                            <div class="form-group">
                                <div class="input-group">
                                    <input id="keyword" type="text" name="keyword" class="form-control" placeholder="검색어를 입력하세요">
                                    <div class="input-group-btn">
                                        <button class="btn btn-primary"><i class="ion-search"></i></button>
                                    </div>
                                </div>

                            </div>
                            <div class="help-block">
                                <div>Popular Tag:</div>
                                <ul>
                                    <c:forEach var="TagList" items="${hotTagList}">
                                    <li><a href="/gallery/search-tag?tag=${TagList.tagValue}"><c:out value="${TagList.tagValue}"/></a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-3 col-sm-12 text-right">
                        <ul class="nav-icons">
                            <c:if test="${empty user}">
                                <li><a href="/register"><i class="ion-person-add"></i>
                                    <div>회원가입</div>
                                </a></li>
                                <li><a href="/login"><i class="ion-person"></i>
                                    <div>로그인</div>
                                </a></li>
                            </c:if>
                            <c:if test="${not empty user}">
                                <li><a href="/logout"><i class="ion-person"></i>
                                    <div>로그아웃</div>
                                </a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    <!-- Start nav -->

    <nav class="menu">
        <div class="container">
            <div class="mobile-toggle">
                <a href="#" data-toggle="active" data-target="#sidebar"><i class="ion-navicon-round"></i></a>
            </div>
            <div class="mobile-toggle">
                <a href="#" data-toggle="sidebar" data-target="#sidebar"><i class="ion-ios-arrow-left"></i></a>
            </div>
            <div id="menu-list">
                <ul class="nav-list">
                    <li class="for-tablet nav-title"><a>Menu</a></li>
                    <li class="for-tablet"><a href="/login">Login</a></li>
                    <li class="for-tablet"><a href="/register">Register</a></li>

                    <li class="dropdown magz-dropdown">

                        <a href="/">Standard <i class="ion-ios-arrow-right"></i></a>

                        <ul class="dropdown-menu">
                            <li><a href="/">Home</a></li>
                            <li class="dropdown magz-dropdown">
                            <li><a href="/board">Board</a></li>
                            <li><a href="/gallery">Gallery</a></li>
                        </ul>

                    </li>
                    <li class="dropdown magz-dropdown">

                        <a href="/mypage">Mypage <i class="ion-ios-arrow-right"></i></a>

                        <ul class="dropdown-menu">
                            <li><a href="/mypage">Home</a></li>
                            <li class="dropdown magz-dropdown">
                            <li><a href="/mypage/myinfo">My Information</a></li>
                        </ul>

                    </li>


                </ul>
            </div>
        </div>
    </nav>
        <!-- End nav -->
<!-- //header -->
<script>
    const mobileToggle = document.querySelector('.mobile-toggle a');
    mobileToggle.addEventListener('click',e=>{
        e.stopImmediatePropagation();
        document.querySelector('.sidebar').classList.toggle('active');
        e.preventDefault();

    });

    document.addEventListener('click',e=>{
        document.querySelector('.sidebar').classList.remove('active');

    });
</script>