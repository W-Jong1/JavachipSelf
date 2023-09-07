<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import ="com.javachip.vo.*" %> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>
<% AdminPageMaker pm =  (AdminPageMaker)request.getAttribute("pm"); %>
<!-- 메인 작성 영역 -->

</head>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>관리자 페이지</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">Home</a>
                            	<span>상품관리</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!-- Breadcrumb Section End -->
	<!-- section -->
	<section class="spad admin">
	<div class="frame admin">
		<div class="side admin">
			<div class="blog__sidebar__item">
				<h4>상품관리</h4>
				<ul>
				<li><a href="<%=request.getContextPath() %>/admin/productList.do">상품 목록 조회</a></li>
				</ul>
			</div>
			<div class="blog__sidebar__item">
				<h4>회원관리</h4>
				<ul>
				<li>
					<a href="<%=request.getContextPath() %>/admin/memberList.do">일반회원조회</a><br>
					<a href="<%=request.getContextPath() %>/admin/bizmemberList.do">사업자회원조회</a><br>
					<a href="<%=request.getContextPath() %>/admin/blackList.do">블랙리스트조회</a>
				</li>
				</ul>
			</div>	
			<div class="blog__sidebar__item">	
				<h4>주문관리</h4>
				<ul>
				<li><a href="<%=request.getContextPath() %>/admin/deliveryList.do">주문 목록 조회</a></li>
				</ul>
			</div>	
			<div class="blog__sidebar__item">	
				<h4>게시글관리</h4>
				<ul>
				<li><a href="<%=request.getContextPath() %>/admin/boardList.do">공지사항 관리</a></li>
				<li><a href="<%=request.getContextPath() %>/admin/qnaList.do">QnA 목록 조회</a></li>
				</ul>
			</div>	
		</div>
		<div class="main admin">
				<h4><b>상품 목록 조회</b></h4><br>
				<div class="search admin">
				<form action="productList.do" method="get">
					<select name="searchType">
						<option value="pNo"
						<c:if test="${param.searchType eq 'pNo'}">selected</c:if>>상품번호</option>
						<option value="pName"
						<c:if test="${param.searchType eq 'pName'}">selected</c:if>>상품명</option>
					</select>
					<input type="text" name="SearchValue" value="${param.SearchValue}">
					<button type="submit" class="btn btn-secondary mb-4">검색</button>
				</form>
				</div>
				<table border="1" class="tableAdmin qna admin">
					<tr>
						<!-- <th><input type="checkbox"></th> -->
						<th>번호</th><th>상품구분</th><th>상품명</th><th>가격</th><th>재고수</th><th>상품상태</th><th>삭제여부</th>
					</tr>
					<c:forEach items="${list }" var="product">
					<tr>
						<%-- <td>
							<input type="checkbox" name="RowCheck" th:value="${product.pNo}"
							class="RowCheck"
							data-nNo="${product.pNo }" value="${product.pNo }">
						</td> --%>
						<td>${product.pNo}</td>
						<td>${product.pType}</td>
						<td><a href="<%=request.getContextPath() %>/admin/productDetail.do?pNo=${product.pNo}">
							${product.pName}</a></td>
						<td>${product.pPrice}</td>
						<td>${product.pStock}</td>
						<td>
							<c:if test="${product.pStock > 0}">
								판매중
							</c:if>
							<c:if test="${product.pStock eq 0 }">
								재고없음
							</c:if>
						</td>
						<td>
							<c:if test="${product.delYN eq 'Y'}">
								삭제된상태
							</c:if>
							<c:if test="${product.delYN eq 'N' }">
								삭제안됌
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</table>
				<div class="admin_pagination" style="text-align:center;">
<%
String param = "searchType="+pm.getAdminSearchVO().getSearchType()+"&SearchValue="+pm.encoding2(pm.getAdminSearchVO().getSearchValue());
if (pm.isPrev()){ %>
<a href="<%=request.getContextPath()%>/admin/productList.do?page=<%=pm.getStartPage()-1%>&<%=param%>">◀</a></td>
<%
}
%>

<% 
for(int i = pm.getStartPage() ; i<=pm.getEndPage(); i++) 
{
%>
<a href="<%=request.getContextPath()%>/admin/productList.do?page=<%=i%>&<%=param%>"><%=i %></a>
<%	
}
%>

<%if(pm.isNext() && pm.getEndPage() > 0 ){ %>
<a href="<%=request.getContextPath()%>/admin/productList.do?page=<%=pm.getEndPage()+1%>&<%=param%>">▶</a>
<%
}
%>
</div>
<br>
<%--  <button type="button" onclick="location.href='<%=request.getContextPath() %>/admin/productOrder.do'">
상품등록 
</button> --%>
<a class="btn btn-dark" href="<%=request.getContextPath() %>/admin/productOrder.do">상품등록</a>
<!-- <input type="button" value="선택 삭제"> -->
<!-- <div class="delBtn">
	<button type="submit" class="selectDelete_btn" onclick="deleteValue();">선택 삭제</button>
</div> -->
	</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>