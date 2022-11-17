<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- header -->

<header>
    <div class="firstbar">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="brand">
                        <a href="/">
                            <img src="/img/logo.png" alt="Magz Logo">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <form class="search" autocomplete="off">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" name="q" class="form-control" placeholder="Type something here">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary"><i class="ion-search"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="help-block">
                            <div>Popular Tag:</div>
                            <ul>
                                <li><a href="#">아이유</a></li>
                                <li><a href="#">뭐시기</a></li>
                                <li><a href="#">인기태그 1</a></li>
                                <li><a href="#">인기태그 2</a></li>
                                <li><a href="#">인기태그 3</a></li>
                            </ul>
                        </div>
                    </form>
                </div>
                <div class="col-md-3 col-sm-12 text-right">
                    <ul class="nav-icons">
                        <c:if test="${empty user}">
                            <li><a href="/register"><i class="ion-person-add"></i><div>회원가입</div></a></li>
                            <li><a href="/login"><i class="ion-person"></i><div>로그인</div></a></li>
                        </c:if>
                        <c:if test="${not empty user}">
                            <li><a href="/logout"><i class="ion-person"></i><div>로그아웃</div></a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Start nav -->
    <nav class="menu">
        <div class="container">
            <div class="brand">
                <a href="/">
                    <img src="/img/logo.png" alt="Magz Logo">
                </a>
            </div>
            <div class="mobile-toggle">
                <a href="#" data-toggle="menu" data-target="#menu-list"><i class="ion-navicon-round"></i></a>
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
</header>
<!-- //header -->