<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-xs-6 col-md-4 sidebar" id="sidebar">
  <aside>
    <div class="aside-body">
      <div class="featured-author">
        <div class="featured-author-inner">
          <div class="featured-author-cover">
            <div class="badges">
              <div class="badge-item"><i class="ion-star"></i> 인기 관심사</div>
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
              " <c:out value="${hotTagList[0].tagValue}"/> "
            </div>
            <div class="block">
              <h2 class="block-title">Photos</h2>

            </div>

          </div>
        </div>
      </div>
    </div>
  </aside>

</div>