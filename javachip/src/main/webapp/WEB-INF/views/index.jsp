<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<script>
	//금액 ,+원
	function moneyFn(str) {
		return str.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+"원"
	}
	
	function moneyToNum(str) {
		var newStr = str.toString().replace(',' ,'');
		return newStr.toString().replace('원' ,'');
	}
	
	function addCartFn(pNo) {
		$.ajax({
			url:"shop/addCart.do",
			type:"post",
			data:{
				pNo: pNo,
				cCount: 1
			},
			success:function(data) {
				if(data == 1) {
					if(confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?")) {
						location.href="mypage/cart.do";
					}
				}else if(data == 2) {
					if(confirm("이미 장바구니에 있는 상품입니다. 장바구니로 이동하시겠습니까?")) {
						location.href="mypage/cart.do";
					}
				}else if(data == -1) {
					alert("로그인이 필요한 서비스입니다.");
					location.href="member/login.do";
				}else {
					alert("오류가 발생했습니다.");
				}
			},
			error:function(){
				alert("오류가 발생했습니다.");
			}
		});
	}
	
	$(document).ready(function() {
		$(".money").each(function() {
			var price = $(this).text();
			$(this).text(moneyFn(price));
		});
	}); 
</script>
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>상품목록</span>
                        </div>
                        <ul>
                            <li><a href="shop/grid.do">전체</a></li>
                            <li><a href="shop/grid.do?searchType=pType&searchValue=A">원두</a></li>
                            <li><a href="shop/grid.do?searchType=pType&searchValue=B">생두</a></li>
                            <li><a href="shop/grid.do?searchType=pType&searchValue=C">드립백</a></li>
                            <li><a href="shop/grid.do?searchType=pType&searchValue=D">캡슐</a></li>
                            <li><a href="shop/grid.do?searchType=pType&searchValue=E">도매</a></li>
                            <li><a href="shop/grid.do?searchType=pType&searchValue=F">커피용품</a></li>
                            <li><a href="shop/grid.do?searchType=pType&searchValue=G">정기배송</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form method="get" action="shop/grid.do">
                            	<input type="hidden" name="searchType" value="pName">
                                <input type="text" name="searchValue" placeholder="무엇이 필요하신가요?">
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
                    <div class="hero__item set-bg" data-setbg="resources/img/hero/roasted_bean.jpg">
                        <div class="hero__text">
                            <span>Roasted Bean</span>
                            <h2>커피 원두 <br />100% 직수입</h2>
                            <p>신선한 커피 원두를 구매하시면 바로 배송해드립니다.</p>
                            <a href="shop/grid.do?searchType=pType&searchValue=A" class="primary-btn">지금 구매하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-1.jpg"
                        	onClick="javascript:location.href='shop/grid.do?searchType=pType&searchValue=A'"
                        	style="cursor:pointer;">
                            <h5><a>원두</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-2.jpg"
							onClick="javascript:location.href='shop/grid.do?searchType=pType&searchValue=B'"
                        	style="cursor:pointer;">
                            <h5><a>생두</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-3.jpg"
							onClick="javascript:location.href='shop/grid.do?searchType=pType&searchValue=C'"
                        	style="cursor:pointer;">
                            <h5><a>드립백</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-4.jpg"
	                        onClick="javascript:location.href='shop/grid.do?searchType=pType&searchValue=D'"
	                        style="cursor:pointer;">
                            <h5><a>캡슐</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-5.jpg"
	                        onClick="javascript:location.href='shop/grid.do?searchType=pType&searchValue=E'"
	                        style="cursor:pointer;">
                            <h5><a>도매</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-6.jpg"
	                        onClick="javascript:location.href='shop/grid.do?searchType=pType&searchValue=F'"
	                        style="cursor:pointer;">
                            <h5><a>커피용품</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-7.jpg"
	                        onClick="javascript:location.href='shop/grid.do?searchType=pType&searchValue=G'"
	                        style="cursor:pointer;">
                            <h5><a>정기배송</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>판매 상품</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".typeA">원두</li>
                            <li data-filter=".typeB">생두</li>
                            <li data-filter=".typeC">드립백</li>
                            <li data-filter=".typeD">캡슐</li>
                            <li data-filter=".typeF">커피용품</li>
                            <li data-filter=".typeG">정기배송</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            <c:forEach items="${indexList}" var="index">
           	<c:if test="${index.pType ne 'G'}">
                <div class="col-lg-3 col-md-4 col-sm-6 mix type${index.pType}">
                    <div class="featured__item">
	                    	<c:if test="${empty index.aChangeName}">
		                        <div class="featured__item__pic set-bg" data-setbg="resources/img/categories/cat-1.jpg"
		                        	 onClick="javascript:location.href='shop/details.do?pNo=${index.pNo}'" style="cursor:pointer;">
		                            <ul class="featured__item__pic__hover">
		                                <li><a href="javascript:addCartFn(${index.pNo})"><i class="fa fa-shopping-cart"></i></a></li>
		                            </ul>
		                        </div>
	                    	</c:if>
	                    	<c:if test="${not empty index.aChangeName}">
		                        <div class="featured__item__pic set-bg" data-setbg="resources/upload/${index.aChangeName}"
		                        	 onClick="javascript:location.href='shop/details.do?pNo=${index.pNo}'" style="cursor:pointer;">
		                            <ul class="featured__item__pic__hover">
		                                <li><a href="javascript:addCartFn(${index.pNo})"><i class="fa fa-shopping-cart"></i></a></li>
		                            </ul>
		                        </div>
	                    	</c:if>
	                        <div class="featured__item__text">
	                            <h6><a href="shop/details.do?pNo=${index.pNo}">${index.pName}</a></h6>
	                            <h5 class="money">${index.pPrice}</h5>
	                        </div>
                    </div>
                </div>
            </c:if>
            </c:forEach>
            <c:if test="${empty indexList}">
            	<div style="height:200px; line-height:200px; width:100%; text-align:center;">
            		상품 준비 중입니다.
            	</div>
            </c:if>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="resources/img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="resources/img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad" style="margin-bottom:80px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>신상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                            <c:forEach items="${newList}" var="newer" begin="0" end="2" step="1">
                                <a href="shop/details.do?pNo=${newer.pNo}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                    <c:if test="${empty newer.aChangeName}">
                                        <img src="resources/img/latest-product/lp-1.jpg"
                                        style="width: auto; height: auto; max-width: 110px; max-height: 110px;" alt="">
                                    </c:if>
                                    <c:if test="${not empty newer.aChangeName}">
                                        <img src="resources/upload/${newer.aChangeName}"
                                        style="width: auto; height: auto; max-width: 110px; max-height: 110px;" alt="">
                                    </c:if>
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${newer.pName}</h6>
                                        <span class="money">${newer.pPrice}</span>
                                    </div>
                                </a>
                            </c:forEach>
                            <c:if test="${empty newList}">
				            	<div style="height:200px; line-height:200px; width:100%; text-align:center;">
				            		상품 준비 중입니다.
				            	</div>
				            </c:if>
                            </div>
                            <div class="latest-prdouct__slider__item">
                            <c:forEach items="${newList}" var="newer" begin="3" end="5" step="1">
                                <a href="shop/details.do?pNo=${newer.pNo}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                    <c:if test="${empty newer.aChangeName}">
                                        <img src="resources/img/latest-product/lp-1.jpg"
                                        style="width: auto; height: auto; max-width: 110px; max-height: 110px;" alt="">
                                    </c:if>
                                    <c:if test="${not empty newer.aChangeName}">
                                        <img src="resources/upload/${newer.aChangeName}"
                                        style="width: auto; height: auto; max-width: 110px; max-height: 110px;" alt="">
                                    </c:if>
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${newer.pName}</h6>
                                        <span class="money">${newer.pPrice}</span>
                                    </div>
                                </a>
                            </c:forEach>
                            <c:if test="${empty newList}">
				            	<div style="height:200px; line-height:200px; width:100%; text-align:center;">
				            		상품 준비 중입니다.
				            	</div>
				            </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>많이 판매된 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                            <c:forEach items="${indexList}" var="pop" begin="0" end="2" step="1">
                                <a href="shop/details.do?pNo=${pop.pNo}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                    <c:if test="${empty pop.aChangeName}">
                                        <img src="resources/img/latest-product/lp-1.jpg"
                                        style="width: auto; height: auto; max-width: 110px; max-height: 110px;" alt="">
                                    </c:if>
                                    <c:if test="${not empty pop.aChangeName}">
                                        <img src="resources/upload/${pop.aChangeName}"
                                        style="width: auto; height: auto; max-width: 110px; max-height: 110px;" alt="">
                                    </c:if>
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${pop.pName}</h6>
                                        <span class="money">${pop.pPrice}</span>
                                    </div>
                                </a>
                            </c:forEach>
                            <c:if test="${empty indexList}">
				            	<div style="height:200px; line-height:200px; width:100%; text-align:center;">
				            		상품 준비 중입니다.
				            	</div>
				            </c:if>
                            </div>
                            <div class="latest-prdouct__slider__item">
                            <c:forEach items="${indexList}" var="pop" begin="4" end="6" step="1">
                                <a href="shop/details.do?pNo=${pop.pNo}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                    <c:if test="${empty pop.aChangeName}">
                                        <img src="resources/img/latest-product/lp-1.jpg"
                                        style="width: auto; height: auto; max-width: 110px; max-height: 110px;" alt="">
                                    </c:if>
                                    <c:if test="${not empty pop.aChangeName}">
                                        <img src="resources/upload/${pop.aChangeName}"
                                        style="width: auto; height: auto; max-width: 110px; max-height: 110px;" alt="">
                                    </c:if>
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${pop.pName}</h6>
                                        <span class="money">${pop.pPrice}</span>
                                    </div>
                                </a>
                            </c:forEach>
                            <c:if test="${empty indexList}">
				            	<div style="height:200px; line-height:200px; width:100%; text-align:center;">
				            		상품 준비 중입니다.
				            	</div>
				            </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>추천 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                            <c:forEach items="${randomList}" var="rand" begin="0" end="2" step="1">
                                <a href="shop/details.do?pNo=${rand.pNo}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                    <c:if test="${empty rand.aChangeName}">
                                        <img src="resources/img/latest-product/lp-1.jpg"
                                        style="width: auto; height: auto; max-width: 110px; max-height: 110px;" alt="">
                                    </c:if>
                                    <c:if test="${not empty rand.aChangeName}">
                                        <img src="resources/upload/${rand.aChangeName}"
                                        style="width: auto; height: auto; max-width: 110px; max-height: 110px;" alt="">
                                    </c:if>
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${rand.pName}</h6>
                                        <span class="money">${rand.pPrice}</span>
                                    </div>
                                </a>
                            </c:forEach>
                            <c:if test="${empty randomList}">
				            	<div style="height:200px; line-height:200px; width:100%; text-align:center;">
				            		상품 준비 중입니다.
				            	</div>
				            </c:if>
                            </div>
                            <div class="latest-prdouct__slider__item">
                            <c:forEach items="${randomList}" var="rand" begin="4" end="6" step="1">
                                <a href="shop/details.do?pNo=${rand.pNo}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                    <c:if test="${empty rand.aChangeName}">
                                        <img src="resources/img/latest-product/lp-1.jpg"
                                        style="width: auto; height: auto; max-width: 110px; max-height: 110px;" alt="">
                                    </c:if>
                                    <c:if test="${not empty rand.aChangeName}">
                                        <img src="resources/upload/${rand.aChangeName}"
                                        style="width: auto; height: auto; max-width: 110px; max-height: 110px;" alt="">
                                    </c:if>
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${rand.pName}</h6>
                                        <span class="money">${rand.pPrice}</span>
                                    </div>
                                </a>
                            </c:forEach>
                            <c:if test="${empty randomList}">
				            	<div style="height:200px; line-height:200px; width:100%; text-align:center;">
				            		상품 준비 중입니다.
				            	</div>
				            </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->
<%@ include file="./include/footer.jsp" %>