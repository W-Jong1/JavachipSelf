<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- 메인 작성 영역 -->
    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>상품목록</span>
                        </div>
                        <ul>
                            <li><a href="./shop-grid.jsp">원두</a></li>
                            <li><a href="./shop-grid.jsp">생두</a></li>
                            <li><a href="./shop-grid.jsp">드립백</a></li>
                            <li><a href="./shop-grid.jsp">캡슐</a></li>
                            <li><a href="./shop-grid.jsp">도매</a></li>
                            <li><a href="./shop-grid.jsp">커피용품</a></li>
                            <li><a href="./shop-grid.jsp">정기배송</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    모든 항목
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="무엇이 필요하신가요?">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>063) 123 - 4567</h5>
                                <span>운영시간 09:00 ~ 18:00</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>배송조회</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.jsp">홈</a>
                            <a href="./mypage-main.jsp">마이페이지</a>
                            <span>배송조회</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">구매정보 (클릭 시 상세 정보 조회)</th>
                                    <th>결제금액</th>
                                    <th>주문일자</th>
                                    <th>배송현황</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                            for(int i=0; i<5; i++) {
                            %>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <h5><a href="./shoping-history.jsp">주문 번호(장바구니 번호)</a></h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $55.00
                                    </td>
                                    <td class="shoping__cart__total">
                                        2023-07-11
                                    </td>
                                    <td class="shoping__cart__quantity" style="width:100px;">
                                    	배송준비중
                                    	<input type="button" value="배송조회" onclick="location.href='shop-details.jsp'">
                                    </td>
                                </tr>
                            <%
                            }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="javascript:history.back()" class="primary-btn cart-btn">돌아가기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>