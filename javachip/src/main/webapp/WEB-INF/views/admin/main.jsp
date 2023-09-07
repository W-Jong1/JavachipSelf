<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import ="com.javachip.vo.*" %> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>
<% AdminPageMaker qpm =  (AdminPageMaker)request.getAttribute("qpm"); %>
<% AdminPageMaker ppm =  (AdminPageMaker)request.getAttribute("ppm"); %>
<% AdminPageMaker npm =  (AdminPageMaker)request.getAttribute("npm"); %>
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
                            	<span>관리자 메인</span>
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
			<div class="profile admin">
				<div class="uName admin">
					[관리자] 홍길동 님
				</div>
			</div>
				<h4><b>상품관리</b></h4><br>
				<table border="1" class="tableAdmin admin">
					<tr>
						<th>번호</th><th>상품명</th><th>재고수</th><th>상품상태</th>
					</tr>
				<c:forEach items="${plist }" var="product">
					<tr>
						<td>${product.pNo }</td>
						<td><a href="<%=request.getContextPath()%>/admin/productDetail.do?pNo=${product.pNo}">${product.pName}</a></td>
						<td>${product.pStock }</td>
						<td>매진</td>
					</tr>
				</c:forEach>	
					<tr>
						<td colspan="4">
<c:if test="${ppm.isPrev()}">
					<a href="main.do?pPage=${ppm.startPage-1}">◀</a>
</c:if>
				<c:if test="${ppm.startPage != 0}">
					<c:forEach var="cnt" begin="${ppm.startPage}" end="${ppm.endPage}">
						<a href="main.do?pPage=${cnt}">${cnt}</a>&nbsp;
					</c:forEach>
				</c:if>
				<c:if test="${pm.startPage == 0}">
					1
				</c:if>
				<c:if test="${ppm.isNext() && ppm.endPage>0}">	
					<a href="main.do?pPage=${ppm.endPage()+1}">▶</a>
				</c:if>
						</td>
					</tr>
				</table>
				<h4><b>QnA 답변대기</b></h4><br>
				<table border="1" class="tableAdmin admin">
					<tr>
						<th>번호</th><th>제목</th><th>작성일</th>
					</tr>
				<c:forEach items="${qlist }" var="qna">
					<tr>
						<td>${qna.qNo }</td>
						<td><a href="<%=request.getContextPath()%>/help/qna.do?qNo=${qna.qNo}">${qna.qTitle}</a></td>
						<td>${qna.qDate }</td>
					</tr>
				</c:forEach>
					<tr>
						<td colspan="4">
<c:if test="${qpm.isPrev()}">
					<a href="main.do?qPage=${qpm.startPage-1}">◀</a>
</c:if>
				<c:if test="${qpm.startPage != 0}">
					<c:forEach var="cnt" begin="${qpm.startPage}" end="${qpm.endPage}">
						<a href="main.do?qPage=${cnt}">${cnt}</a>&nbsp;
					</c:forEach>
				</c:if>
				<c:if test="${qpm.startPage == 0}">
					1
				</c:if>
				<c:if test="${qpm.isNext() && qpm.endPage>0}">	
					<a href="main.do?qPage=${qpm.endPage+1}">▶</a>
				</c:if>
						</td>
					</tr>
				</table>
				<h4><b>공지사항</b></h4><br>
				<table border="1" class="tableAdmin admin">
					<tr>
						<th>번호</th><th>제목</th><th>작성일</th>
					</tr>
				<c:forEach items="${nlist }" var="notice">
					<tr>
						<td>${notice.nNo }</td>
						<td><a href="<%=request.getContextPath()%>/help/noticeView.do?nNo=${notice.nNo}">${notice.nTitle }</a></td>
						<td>${notice.nDate }</td>
					</tr>
				</c:forEach>
					<tr>
						<td colspan="3">
<c:if test="${npm.isPrev()}">
					<a href="main.do?nPage=${npm.startPage-1}">◀</a>
</c:if>
				<c:if test="${npm.startPage != 0}">
					<c:forEach var="cnt" begin="${npm.startPage}" end="${npm.endPage}">
						<a href="main.do?nPage=${cnt}">${cnt}</a>&nbsp;
					</c:forEach>
				</c:if>
				<c:if test="${npm.startPage == 0}">
					1
				</c:if>
				<c:if test="${npm.isNext() && npm.endPage>0}">	
					<a href="main.do?nPage=${npm.endPage()+1}">▶</a>
				</c:if>
						</td>
					</tr>
				</table>
		</div>
	</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>