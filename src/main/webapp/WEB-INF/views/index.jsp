<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <%@ include file="./include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
</head>

<body>
    <%@ include file="./include/header.jsp"%>

    <!-- main begin -->

    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-12 col-xs-12">



                    <div class="line">

                        <div><a href="/board">인기글</a></div>

                    </div>


                    <div class="row">

                            <div class="row">
                                <div class="tableWrapper">
                                    <table class="tableList">
                                        <thead class="thead">
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>글쓴이</th>
                                            <th>작성일</th>
                                            <th>조회</th>
                                            <th>추천</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <tr>
                                            <td>132131</td>
                                            <td class="title">갤 오늘이 첨이라 물어볼라고...</td>

                                            <td>ㅇㅇ</td>
                                            <td>16:03</td>
                                            <td>23</td>
                                            <td>2</td>
                                        </tr>
                                        <tr>
                                            <td>132130</td>
                                            <td class="title">뉴비 진로 질문</td>
                                            <td>뉴우비</td>
                                            <td>16:02</td>
                                            <td>11</td>
                                            <td>1</td>
                                        </tr>
                                        <tr>
                                            <td>132129</td>
                                            <td class="title">메인 페이지 헤카테 못바꿈?</td>
                                            <td>ㅇㅇ</td>
                                            <td>16:01</td>
                                            <td>686</td>
                                            <td>123</td>
                                        </tr>

                                        <tr>
                                            <td>1129</td>
                                            <td class="title">메인 페이ㄷㅈㄱㄷㄱ지 헤카테 못바꿈?</td>
                                            <td>ㅇㅈㄷㅈㅂㅇ</td>
                                            <td>16:01</td>
                                            <td>686</td>
                                            <td>123</td>
                                        </tr>

                                        <tr>
                                            <td>22</td>
                                            <td class="title">대충 제목</td>
                                            <td>작성자임ㅋ</td>
                                            <td>15:22</td>
                                            <td>1111</td>
                                            <td>1</td>
                                        </tr>



                                        </tbody>
                                    </table>
                                </div>

                            </div>


                    </div>

                    <div class="line transparent little"></div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6 trending-tags">
                            <h1 class="title-col">인기 관심사</h1>
                            <div class="body-col">
                                <ol class="tags-list">
                                    <li><a href="#">아이유</a></li>
                                    <li><a href="#">롤</a></li>
                                    <li><a href="#">피파</a></li>
                                    <li><a href="#">이쁜사진</a></li>
                                    <li><a href="#">배경사진</a></li>
                                    <li><a href="#">뭐시기뭐시기</a></li>

                                </ol>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <h1 class="title-col">
                                HOT 게시물
                                <div class="carousel-nav" id="hot-news-nav">
                                    <div class="prev">
                                        <i class="ion-ios-arrow-left"></i>
                                    </div>
                                    <div class="next">
                                        <i class="ion-ios-arrow-right"></i>
                                    </div>
                                </div>
                            </h1>
                            <div class="body-col vertical-slider" data-max="4" data-nav="#hot-news-nav" data-item="article">


                                    <div class="tableWrapper">
                                        <table class="tableList">
                                          <tbody>
                                            <tr>
                                                <td class="title">여자 인증욤ㅋ [1823]</td>

                                            </tr>
                                            <tr>
                                                <td class="title">뉴비 진로 질문 [32] </td>
                                            </tr>
                                            <tr>
                                                <td class="title">이거 뽑았는데 좋은건가요? [231]</td>
                                            </tr>

                                            <tr>
                                                <td class="title">(ㅎㅂ) 헉...뒷태..! [999]</td>
                                            </tr>

                                            <tr>
                                                <td class="title">대충 조회수, 댓글 많은 글 [12313]</td>
                                            </tr>

                                            </tbody>
                                        </table>
                                    </div>


                            </div>
                        </div>
                    </div>
                    <div class="line top">
                        <div>Just Another News</div>
                    </div>
                    <div class="row">
                        <article class="col-md-12 article-list">
                            <div class="inner">
                                <figure>
                                    <a href="#">
                                        <img src="/img/news/img11.jpg" alt="Sample Article">
                                    </a>
                                </figure>
                                <div class="details">
                                    <div class="detail">
                                        <div class="category">
                                            <a href="#">Film</a>
                                        </div>
                                        <div class="time">December 19, 2016</div>
                                    </div>
                                    <h1><a href="#">Donec consequat arcu at ultrices sodales quam erat aliquet diam</a></h1>
                                    <p>
                                        Donec consequat, arcu at ultrices sodales, quam erat aliquet diam, sit amet interdum libero nunc accumsan nisi.
                                    </p>
                                    <footer>
                                        <a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>273</div></a>
                                        <a class="btn btn-primary more" href="#">
                                            <div>More</div>
                                            <div><i class="ion-ios-arrow-thin-right"></i></div>
                                        </a>
                                    </footer>
                                </div>
                            </div>
                        </article>
                        <article class="col-md-12 article-list">
                            <div class="inner">
                                <div class="badge">
                                    Sponsored
                                </div>
                                <figure>
                                    <a href="#">
                                        <img src="/img/news/img02.jpg" alt="Sample Article">
                                    </a>
                                </figure>
                                <div class="details">
                                    <div class="detail">
                                        <div class="category">
                                            <a href="#">Travel</a>
                                        </div>
                                        <div class="time">December 18, 2016</div>
                                    </div>
                                    <h1><a href="#">Maecenas accumsan tortor ut velit pharetra mollis</a></h1>
                                    <p>
                                        Maecenas accumsan tortor ut velit pharetra mollis. Proin eu nisl et arcu iaculis placerat sollicitudin ut est. In fringilla dui.
                                    </p>
                                    <footer>
                                        <a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>4209</div></a>
                                        <a class="btn btn-primary more" href="#">
                                            <div>More</div>
                                            <div><i class="ion-ios-arrow-thin-right"></i></div>
                                        </a>
                                    </footer>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>


                <div class="col-xs-6 col-md-4 sidebar" id="sidebar">
                    <aside>
                        <div class="aside-body">
                            <div class="featured-author">
                                <div class="featured-author-inner">
                                    <div class="featured-author-cover">
                                        <div class="badges">
                                            <div class="badge-item"><i class="ion-star"></i> 이달의 인기태그</div>
                                        </div>
                                        <div class="featured-author-center">
                                            <figure class="featured-author-picture">
                                                <img src="/img/img01.jpg" alt="Sample Article">
                                            </figure>
                                            <div class="featured-author-info">
                                                <h2 class="name">John Doe</h2>
                                                <div class="desc"># 아이유</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="featured-author-body">
                                        <div class="featured-author-count">
                                            <div class="item">
                                                <a href="#">
                                                    <div class="name">게시글</div>
                                                    <div class="value">208</div>
                                                </a>
                                            </div>
                                            <div class="item">
                                                <a href="#">
                                                    <div class="name">댓글</div>
                                                    <div class="value">3,729</div>
                                                </a>
                                            </div>
                                            <div class="item">
                                                <a href="#">
                                                    <div class="icon">
                                                        <div>더보기</div>
                                                        <i class="ion-chevron-right"></i>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="featured-author-quote">
                                            " 아이유 "
                                        </div>
                                        <div class="block">
                                            <h2 class="block-title">Photos</h2>
                                                <img src="/img/img01.jpg" alt="Sample Article" style="width: 30%">
                                                <img src="/img/img02.jpg" alt="Sample Article" style="width: 30%">
                                                <img src="/img/img03.jpg" alt="Sample Article" style="width: 30%">
                                                <img src="/img/img04.jpg" alt="Sample Article" style="width: 30%">
                                                <img src="/img/img05.jpg" alt="Sample Article" style="width: 30%">
                                                <img src="/img/img06.jpg" alt="Sample Article" style="width: 30%">
                                                <img src="/img/img07.jpg" alt="Sample Article" style="width: 30%">
                                                <img src="/img/img08.jpg" alt="Sample Article" style="width: 30%">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </aside>

                </div>
            </div>
        </div>
    </section>


    <!-- main end -->
    <%@ include file="./include/footer.jsp"%>
</body>
</html>