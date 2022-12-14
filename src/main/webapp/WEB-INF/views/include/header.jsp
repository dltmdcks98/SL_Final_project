<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
    li{
        font-family: 'Jeju Gothic', sans-serif;
    }
@media (max-width: 414px) {
    .form-group{
        width: fit-content;
    }

}


    @keyframes box-ani {
        0% { transform: translate(800px, 0); }
        100% { transform: translate(0px, 0px); }
    }
    .ani {
        animation-name: box-ani;
        animation: box-ani 2.3s;
    }

    .toggle_box {
        display: flex;
        align-items: center;
        z-index: -1;
        margin-top: 20px;
    }

    #custom_input {
        display: none;
    }

    #custom_input + label.toggle_btn_label {
        position: relative;
        width: 8rem;
        height: 3rem;
    }

    #custom_input + label.toggle_btn_label > span {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        border-radius: 40px;
        background-color: #ccc;

        transition: all .4s;

    }

    #custom_input + label.toggle_btn_label > span:before {
        display: flex;
        position: absolute;
        height: 2.5rem;
        width: fit-content;
        padding: 0 1rem;
        left: 0.25rem;
        bottom: 0.25rem;
        border-radius: 20px;
        background-color: #fff;

        content: "<";
        align-items: center;
        font-weight: bold;
        color: rgb(29, 29, 29);

        -webkit-transition: all .4s;
        transition: all .4s;
    }

    #custom_input:checked + label.toggle_btn_label > span {
        background-color: black;
    }

    #custom_input:checked + label.toggle_btn_label > span:before {
        -webkit-transform: translateX(calc(7.5rem - 100%));
        -ms-transform: translateX(calc(7.5rem - 100%));
        transform: translateX(calc(7.5rem - 100%));
        right: 0.25rem;
        bottom: 0.25rem;
        content: ">";
    }

    #custom_input:disabled + label.toggle_btn_label {
        display: none;
    }

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
            <div class = ani id="ani_id">
                <ul id ="sideside" class="" style="display: none">
                    <li><a href="/">Home</a></li>
                    <li class="dropdown magz-dropdown">
                    <li><a href="/board">Board</a></li>
                    <li><a href="/gallery">Gallery</a></li>
                </ul>
            </div>
            <div class="brand">
                <a href="/">
                    <img src="/img/logo.png" alt="Magz Logo">
                </a>
            </div>

            <div class="mobile-toggle">
                <a href="#" data-toggle="menu" data-target="#menu-list"><i class="ion-navicon-round"></i></a>
            </div>
            <div class="mobile-toggle">
                <input type="checkbox" id="custom_input" class = "sidebarr" onclick="openSide();" data-toggle="sidebar" data-target="#sidebar" style="color: #F73F52"/>
                <label for="custom_input" class="toggle_btn_label">
                    <span></span>
                </label>
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
<script>
    function openSide(){
        document.getElementById("sideside").style.display="block";
        document.getElementById("ani_id").style.display="block";
        document.getElementById("custom_input").setAttribute("onClick","closeSide()");
    }
    function closeSide(){
        document.getElementById("sideside").style.display="none";
        document.getElementById("ani_id").style.display="none";
        document.getElementById("custom_input").setAttribute("onClick","openSide()");
    }

</script>



<!-- //header -->