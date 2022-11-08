<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <%@include file="include/static-head-gallery.jsp"%>


</head>
<body>
<section class="container-fluid gallery bg-faded">
    <header>
        <h1 class="text-center">Masonry Gallery</h1>
    </header>
    <div class="grid">
        <a href="#" class="grid__item grid__sizer">
            <div class="item__overlay">
                <button class="js-button btn btn-secondary-outline center-block" data-toggle="modal" data-target="#modalPicture" type="button" value="Expand photo" role="button">Expand photo</button>
            </div>
            <img src="https://i.ytimg.com/vi/1WlaZXAd1v0/maxresdefault.jpg" alt="Credits to Unsplash.com" />
        </a>
        <a href="#" class="grid__item grid__sizer">
            <div class="item__overlay">
                <button class="js-button btn btn-secondary-outline center-block" data-toggle="modal" data-target="#modalPicture" type="button" value="Expand photo" role="button">Expand photo</button>
            </div>
            <img src="https://assets.repress.co.kr/photos/2009ea104d2c842fed5461308d9f92d7/original.jpg" alt="Credits to Unsplash.com" />
        </a>
        <a href="#" class="grid__item grid__sizer">
            <div class="item__overlay">
                <button class="js-button btn btn-secondary-outline center-block" data-toggle="modal" data-target="#modalPicture" type="button" value="Expand photo" role="button">Expand photo</button>
            </div>
            <img src="https://t1.daumcdn.net/cfile/tistory/99BCFB485EDEDBAF25" alt="Credits to Unsplash.com" />
        </a>
        <a href="#" class="grid__item grid__sizer">
            <div class="item__overlay">
                <button class="js-button btn btn-secondary-outline center-block" data-toggle="modal" data-target="#modalPicture" type="button" value="Expand photo" role="button">Expand photo</button>
            </div>
             <img src="https://w.namu.la/s/59bbf73b123d0f9f693be3c3de9506b24a1f2a3067b4ffd0207a3a08eee32d750ebf1ca3e33084aa3bbcd6916bd0a8a187cc4556b87fa269c25f1a7ff3ea279f1e372d23aa0a6eee8d5932c70d5dac0ebedb6d926eeb95056849a1b9ea2a54d1ea4c5ebd439ea6d9c1f92d1ef4544ce2" alt="Credits to Unsplash.com" />
        </a>
        <a href="#" class="grid__item grid__sizer">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-hIkefXesrRZDk78JfnPeJ11hQyA5TW8Hrg&usqp=CAU" alt="Credits to Unsplash.com" />
            <div class="item__overlay">
                <button class="js-button btn btn-secondary-outline center-block" data-toggle="modal" data-target="#modalPicture" type="button" value="Expand photo" role="button">Expand photo</button>
            </div>
        </a>
        <a href="#" class="grid__item grid__sizer">
            <img src="http://img.etoday.co.kr/pto_db/2022/06/700/20220621121451_1766835_1056_1500.jpg" alt="Credits to Unsplash.com" />
            <div class="item__overlay">
                <button class="js-button btn btn-secondary-outline center-block" data-toggle="modal" data-target="#modalPicture" type="button" value="Expand photo" role="button">Expand photo</button>
            </div>
        </a>
    </div>
</section>
<!-- Modal -->
<div id="modalPicture" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalPictureLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <!-- img header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span class="fa fa-times" aria-hidden="true"></span>
                    <span class="sr-only">Close</span>
                </button>
            </div><!-- img header -->
            <!-- img body -->
            <div class="modal-body">
                <img class="js-modal-image" src="" alt="Credits to Unsplash.com" />
            </div><!-- .end img body -->
            <!-- img footer -->
            <div class="modal-footer">
                <a class="js-download m-r" href="#" aria-label="Download" download>
                    <span class="fa fa-download" aria-hidden="true"></span>
                    <span class="sr-only">Download</span>
                </a>
                <a class="js-heart m-r" href="#" aria-label="Like">
                    <span class="fa fa-heart" aria-hidden="true"></span>
                    <span class="sr-only">Like</span>
                </a>
            </div>
<%--            end img footer--%>
        </div>
    </div>
</div>

<%@include file="include/static-gallery-js.jsp"%>
</body>
</html>