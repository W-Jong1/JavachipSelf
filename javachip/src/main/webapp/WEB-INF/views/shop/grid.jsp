<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javachip.vo.ProductVO" %>
<%@ page import="com.javachip.vo.PageMaker" %>
<%
	List<ProductVO> productList = (List<ProductVO>)request.getAttribute("productList");
	PageMaker pm = (PageMaker)request.getAttribute("pm");
%>
<script>
	var url = window.location.search;
	var urlParams = new URLSearchParams(url);
	
	var searchType = urlParams.get("searchType");
	var searchValue = urlParams.get("searchValue");
	
	$(document).ready(function(){
		if(searchType == "pType") {
			switch(searchValue) {
			case "A" : $("#ctg").text("원두"); break;
			case "B" : $("#ctg").text("생두"); break;
			case "C" : $("#ctg").text("드립백"); break;
			case "D" : $("#ctg").text("캡슐"); break;
			case "E" : $("#ctg").text("도매"); break;
			case "F" : $("#ctg").text("커피용품"); break;
			case "G" : $("#ctg").text("정기배송"); break;
			default :  $("#ctg").text("전체"); break;
			}
		}
	});

	function sortFn() {
		if(searchType == null) {
			location.href="grid.do?sort="+$("#sort").val();
		}else {
			location.href="grid.do?searchType="+searchType+"&searchValue="+searchValue+"&sort="+$("#sort").val();
		}
	}
</script>
<!-- 메인 작성 영역 -->
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>쇼핑몰</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>">홈</a>
                            <span>쇼핑몰</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>목록</h4>
                            <ul>
                                <li><a href="grid.do">전체</a></li>
                                <li><a href="grid.do?searchType=pType&searchValue=A">원두</a></li>
                                <li><a href="grid.do?searchType=pType&searchValue=B">생두</a></li>
                                <li><a href="grid.do?searchType=pType&searchValue=C">드립백</a></li>
                                <li><a href="grid.do?searchType=pType&searchValue=D">캡슐</a></li>
                                <li><a href="grid.do?searchType=pType&searchValue=E">도매</a></li>
                                <li><a href="grid.do?searchType=pType&searchValue=F">커피용품</a></li>
                                <li><a href="grid.do?searchType=pType&searchValue=G">정기배송</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                <h4><b id="ctg">전체</b></h4><br>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>정렬</span>
                                    <select name="sort" id="sort" onchange="sortFn()">
                                        <option value="new" <c:if test="${param.sort eq 'new'}">selected</c:if>>신상품순</option>
                                        <option value="pop" <c:if test="${param.sort eq 'pop'}">selected</c:if>>인기순</option>
                                        <option value="price" <c:if test="${param.sort eq 'price'}">selected</c:if>>가격순</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>${pm.totalCount}</span>개의 상품이 조회되었습니다</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <c:forEach items="${productList}" var="list">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                            <c:if test="${empty list.aChangeName}">
                                <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/product/product-1.jpg"
                                	 onclick="location.href ='details.do?pNo=${list.pNo}'" style="cursor:pointer;">
                                </div>
                            </c:if>
                            <c:if test="${not empty list.aChangeName}">
                                <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/upload/${list.aChangeName}"
                                	 onclick="location.href ='details.do?pNo=${list.pNo}'" style="cursor:pointer;">
                                </div>
                            </c:if>
                                <div class="product__item__text">
                                    <h6><a href="details.do?pNo=${list.pNo}">${list.pName}</a></h6>
                                    <h5>${list.pPrice}원</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                    <div class="product__pagination" style="text-align:center;">
                    	<c:if test="${pm.prev == true}">
	                        <a href="grid.do?page=${pm.startPage-1}&searchType=${pm.searchVO.searchType}&searchValue=${pm.searchVO.searchValue}"><i class="fa fa-long-arrow-left"></i></a>
                    	</c:if>
                    	<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
	                        <a href="grid.do?page=${i}&searchType=${pm.searchVO.searchType}&searchValue=${pm.searchVO.searchValue}">${i}</a>
                        </c:forEach>
                    	<c:if test="${pm.next == true}">
	                        <a href="grid.do?page=${pm.endPage+1}&searchType=${pm.searchVO.searchType}&searchValue=${pm.searchVO.searchValue}"><i class="fa fa-long-arrow-right"></i></a>
                    	</c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>