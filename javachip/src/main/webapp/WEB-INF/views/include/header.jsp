<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JavaChip | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/table.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/elegant-icons.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/nice-select.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/jquery-ui.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.carousel.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/slicknav.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" type="text/css"/>
    
    <!-- Js Plugins -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- jc Begin -->
    <div class="jc__menu__overlay"></div>
    <div class="jc__menu__wrapper">
        <div class="jc__menu__logo">
            <a href="#"><img src="<%=request.getContextPath() %>/resources/img/logo.png" alt=""></a>
        </div>
        <div class="jc__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="jc__menu__widget">
            <div class="header__top__right__language">
                <img src="<%=request.getContextPath() %>/resources/img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <!-- 모바일 메뉴 -->
        <nav class="jc__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="<%=request.getContextPath() %>/">Home</a></li>
                <li><a href="./shop-grid.jsp">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="<%=request.getContextPath() %>/shop/details.do">Shop Details</a></li>
                        <li><a href="<%=request.getContextPath() %>/mypage/cart.do">Shoping Cart</a></li>
                        <li><a href="<%=request.getContextPath() %>/shop/checkout.do">Check Out</a></li>
                        <li><a href="#">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="#">Blog</a></li>
                <li><a href="<%=request.getContextPath() %>/info/contact.do">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <!-- 모바일 메뉴 end -->
        <div class="jc__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- jc End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li>5만원 이상 무료 배송</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <c:if test="${empty login}">
                                <a href="<%=request.getContextPath() %>/member/login.do">로그인</a>
                                <a href="<%=request.getContextPath() %>/member/joinSelect.do">회원가입</a>
								</c:if>
									
								<c:if test="${ not empty login}">
								${login.uName}님 환영합니다!&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="<%=request.getContextPath()%>/member/logout.do">로그아웃</a>
									<c:if test="${login.uStatus eq 'A'}">
									<a href="<%=request.getContextPath() %>/admin/main.do">관리자페이지</a>
									</c:if>
								</c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        	<a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath() %>/resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="<%=request.getContextPath() %>/">Home</a></li>
                            <li><a href="<%=request.getContextPath() %>/shop/grid.do">쇼핑몰</a></li>
                            <li><a href="<%=request.getContextPath() %>/mypage/main.do">마이페이지</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="<%=request.getContextPath() %>/mypage/history.do">주문내역</a></li>
                                    <li><a href="<%=request.getContextPath() %>/mypage/myinfo.do">회원정보수정</a></li>
                                    <li><a href="<%=request.getContextPath() %>/mypage/mileage.do">적립금</a></li>
                                    <li><a href="<%=request.getContextPath() %>/mypage/myqna.do">후기/QNA</a></li>
                                    <li><a href="<%=request.getContextPath() %>/mypage/regular.do">정기배송</a></li>
                                </ul>
                            </li>
                            <li><a href="<%=request.getContextPath() %>/help/notice.do">고객센터</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="<%=request.getContextPath() %>/help/notice.do">공지사항</a></li>
                                    <li><a href="<%=request.getContextPath() %>/help/qna.do">Q&A</a></li>
                                    <li><a href="<%=request.getContextPath() %>/help/faq.do">자주 묻는 질문</a></li>
                                </ul>
                            </li>
                            <li><a href="<%=request.getContextPath() %>/info/intro.do">회사 소개</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="<%=request.getContextPath() %>/info/intro.do">회사 소개</a></li>
                                    <li><a href="<%=request.getContextPath() %>/info/contact.do">찾아오시는 길</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                    	<c:if test="${empty login}">
                            <li><a href="<%=request.getContextPath() %>/mypage/cart.do"><i class="fa fa-shopping-bag"></i></a></li>
                    	</c:if>
                    	<c:if test="${not empty login}">
                            <li><a href="<%=request.getContextPath() %>/mypage/cart.do"><i class="fa fa-shopping-bag"></i> <span>${cntCart}</span></a></li>
                    	</c:if>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="jc__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->