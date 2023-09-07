<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javachip.vo.MileageVO" %>
<!-- 메인 작성 영역 -->
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>적립 내역 조회</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">홈</a>
                            <a href="main.do">마이페이지</a>
                            <span>적립 내역 조회</span>
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
                                    <th>적립/사용</th>
                                    <th class="shoping__product">내역</th>
                                    <th>금액</th>
                                    <th>날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${empty mileageList}">
                            	<tr>
                            		<td colspan="4">적립 및 사용내역이 없습니다.</td>
                            	</tr>
                            </c:if>
                            <c:forEach items="${mileageList}" var="mileage" begin="0" end="19" step="1">
                                <tr>
                                    <c:choose>
	                                    <c:when test="${mileage.mPlus > 0 and mileage.mMinus eq 0}">
		                                    <td class="shoping__cart__price" style="width:16%;">
		                                    	적립
		                                    </td>
		                                    <td class="shoping__cart__item">
		                                        <h5>${mileage.mNote}</h5>
		                                    </td>
		                                    <td class="shoping__cart__price">
		                                        ${mileage.mPlus} P
		                                    </td>
		                                    <td class="shoping__cart__price">
		                                        ${mileage.mDate}
		                                    </td>
	                                    </c:when>
	                                    <c:otherwise>
		                                    <td class="shoping__cart__price" style="width:12%;">
		                                    	사용
		                                    </td>
		                                    <td class="shoping__cart__item">
		                                        <h5>${mileage.mNote}</h5>
		                                    </td>
		                                    <td class="shoping__cart__price" style="color:#dd2222;">
		                                        -${mileage.mMinus} P
		                                    </td>
		                                    <td class="shoping__cart__price">
		                                        ${mileage.mDate}
		                                    </td>
	                                    </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
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