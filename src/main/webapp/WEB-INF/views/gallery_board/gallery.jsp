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
        <div class="grid__sizer"></div>
        <a href="#" class="grid__item">
            <div class="item__overlay">
                <button class="js-button btn btn-secondary-outline center-block" data-toggle="modal" data-target="#modalPicture" type="button" value="Expand photo">Expand photo</button>
            </div>
<%--            <img src="https://i.ytimg.com/vi/1WlaZXAd1v0/maxresdefault.jpg" alt="Credits to Unsplash.com" />--%>
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