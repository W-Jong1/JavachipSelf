<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
    <!-- 배너 섹션 시작 -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>찾아오시는 길</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.jsp">홈</a>
                            <a href="#">회사 소개</a>
                            <a href="./info-contact.jsp">찾아오시는 길</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 배너 섹션 끝 -->

    <!-- 찾아오시는 길 시작 -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4>전화번호</h4>
                        <p>063-123-4567</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4>주소</h4>
                        <p>전북 전주시 덕진구 백제대로 572</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_clock_alt"></span>
                        <h4>고객센터 운영 시간</h4>
                        <p>9:00 am ~ 6:00 pm</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>Email</h4>
                        <p><a href="mailto:﻿superman@test.com" style="color:#666666;">javachip0703@gmail.com</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 찾아오시는 길 끝 -->

    <!-- 지도 시작 -->
    <div class="map">
        <iframe width="600" height="450" style="border:0" loading="lazy" allowfullscreen src="https://www.google.com/maps/embed/v1/place?q=%EB%B0%B1%EC%A0%9C%EB%8C%80%EB%A1%9C%20572&key=AIzaSyAGJtR9Wd4Y-7OR6UldcKauosF0X6dZOXk"></iframe></iframe>
    </div>
    <!-- 지도 끝 -->
<%@ include file="../include/footer.jsp" %>