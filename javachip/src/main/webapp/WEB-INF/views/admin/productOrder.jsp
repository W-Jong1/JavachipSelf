<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>
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
                            	<span>상품상세관리</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!-- Breadcrumb Section End -->
	<!-- section -->
	<section class="spad frame admin">
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
		<form class="product__input" method="post" 
		action="<%= request.getContextPath() %>/admin/productOrder.do" enctype="multipart/form-data">
		<div class="main admin">
				<div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="<%=request.getContextPath() %>/resources/attach" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                    	상품구분 :<br>
                    	<select class="custom-select" id="pType" name="pType">
						  <option value=99
						  <c:if test="${param.pType eq 99}">selected</c:if>>선택해주세요.</option>
						  <option value="A" 
						  <c:if test="${param.pType eq 'A'}">selected</c:if>>원두</option>
						  <option value="B"
						  <c:if test="${param.pType eq 'B'}">selected</c:if>>생두</option>
						  <option value="C"
						  <c:if test="${param.pType eq 'C'}">selected</c:if>>드립백</option>
						  <option value="D"
						  <c:if test="${param.pType eq 'D'}">selected</c:if>>캡슐</option>
						  <option value="E"
						  <c:if test="${param.pType eq 'E'}">selected</c:if>>도매</option>
						  <option value="F"
						  <c:if test="${param.pType eq 'F'}">selected</c:if>>커피용품</option>
						  <option value="G"
						  <c:if test="${param.pType eq 'G'}">selected</c:if>>정기배송</option>
						</select><br><br><br>
                        상품명 :<br><input class="form-control"  type="text" id="pName" name="pName" placeholder="상품명" ><br>
                        가격 :<br><input class="form-control"  type="text" id="pPrice" name="pPrice" placeholder="개당 가격"
                        oninput="this.value=this.value.replace(/[^0-9]/g,'');"><br>
                        상품설명 :<br><textarea class="form-control" rows="4" id="pNote" name="pNote" placeholder="상품설명"></textarea><br>
                        상품상세설명 :<br><textarea class="form-control" rows="4" id="pDtail" name="pDtail" placeholder="상품설명"></textarea><br>
                        입고수 :<br><input class="form-control"  type="text" id="pInput" name="pInput" placeholder="입고 수량"
                        oninput="this.value=this.value.replace(/[^0-9]/g,'');"><br>
                        사진 첨부 :<br>
                        <div class="input-group mb-3">
						  <div class="custom-file">
						    <input type="file" name="uploadFile">
						  </div>
						</div>
						<br>
						<button type="submit" class="btn btn-dark">등록하기</button>
                    	</div>
                </div>
            </div>
        </div>
    </form>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>