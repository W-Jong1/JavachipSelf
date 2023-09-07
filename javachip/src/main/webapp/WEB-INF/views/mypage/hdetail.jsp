<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<script>
//금액 ,+원
	function moneyFn(str) {
		return str.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+"원";
	}
	
	$(document).ready(function() {
		var sum = 0;
		
		$(".shoping__cart__price").each(function() {
			var price = $.trim($(this).text());
			$(this).text(moneyFn(price));
		});
		$(".shoping__cart__total").each(function() {
			var price = $.trim($(this).text());
			sum += parseInt(price);
			$(this).text(moneyFn(price));
		});
		
		$("#sumPrice").text(moneyFn(sum));
		var oTotalPrice = $.trim($("#calPrice").text());
		$("#discount").text(moneyFn(parseInt(sum)-parseInt(oTotalPrice)));
		$("#calPrice").text(moneyFn(oTotalPrice));
		
	});
</script>
<!-- 메인 작성 영역 -->
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>구매내역 상세정보</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">홈</a>
                            <a href="main.do">마이페이지</a>
                            <span>구매내역 상세정보</span>
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
	                    <h4>주문번호 ${thisOrder.oNo}</h4>
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총합</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orderDetail}" var="list">
                                <tr>
                                    <td class="shoping__cart__item">
                                    	<c:if test="${empty list.aChangeName}">
		                                    <img src="<%= request.getContextPath() %>/resources/img/cart/cart-1.jpg"
		                                    style="width: auto; height: auto; max-width: 100px; max-height: 100px;" alt="">
		                                </c:if>
		                                <c:if test="${not empty list.aChangeName}">
		                                    <img src="<%= request.getContextPath() %>/resources/upload/${regular.aChangeName}"
		                                    style="width: auto; height: auto; max-width: 100px; max-height: 100px;" alt="">
		                                </c:if>
                                        <h5>${list.pName}</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        ${list.pPrice}
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <b>${list.dCount}</b>
                                    </td>
                                    <td class="shoping__cart__total">
                                        ${list.pPrice*list.dCount}
                                    </td>
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
                        <!-- <a href="#" class="primary-btn cart-btn">배송조회</a> -->
                    </div>
                </div>
                <div class="col-lg-6">
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>결제 총합</h5>
                        <ul>
                            <li>판매가 <span id="sumPrice">0원</span></li>
                            <li>할인 <span id="discount">0원</span></li>
                            <li>총액 <span id="calPrice">${thisOrder.oTotalPrice}</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>