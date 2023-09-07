<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>
<!-- 메인 작성 영역 -->
<script>

	function productDelete(){
		
		var pNo = $("#pNo").val();
		console.log(pNo);
		$.ajax({
			url : "productDelete.do",
			type : "POST",
			data : "pNo="+pNo,
			success : function(data)
			{
				
				if(data > 0)
				{
					alert("상품삭제가 완료되었습니다.");
				}
				else
				{
					alert("상품삭제 실패")
				}
			},
			error : function(data)
			{
				alert("그냥 실패!");
			}
		});
	}
</script>
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
		<div class="main admin">
				<div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <c:if test="${not empty pavo}">
							<img src="<%=request.getContextPath()%>/resources/upload/${pavo.aChangeName}">
							</c:if>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                <form class="product__input" 
                action="<%= request.getContextPath() %>/admin/productDetail.do" method="post" enctype="multipart/form-data">
                    <div class="product__details__text">
                    	<input type="hidden" name="pNo" id="pNo" value="${vo.pNo}">
                    	<br><br>
                    	상품구분 :<br>
                    	<select class="custom-select" id="pType" name="pType">
						    <option value="99" ${vo.pType eq '99' ? 'selected' : ''}>선택해주세요.</option>
						    <option value="A" ${vo.pType eq 'A' ? 'selected' : ''}>원두</option>
						    <option value="B" ${vo.pType eq 'B' ? 'selected' : ''}>생두</option>
						    <option value="C" ${vo.pType eq 'C' ? 'selected' : ''}>드립백</option>
						    <option value="D" ${vo.pType eq 'D' ? 'selected' : ''}>캡슐</option>
						    <option value="E" ${vo.pType eq 'E' ? 'selected' : ''}>도매</option>
						    <option value="F" ${vo.pType eq 'F' ? 'selected' : ''}>커피용품</option>
						    <option value="G" ${vo.pType eq 'G' ? 'selected' : ''}>정기배송</option>
						</select>
                            <br><br><br>
                            상품명 :<br>
                            <input class="form-control" type="text" id="pName" name="pName" value="${vo.pName}" ><br>
                            가격 :<br>
                            <input class="form-control" type="text" id="pPrice" name="pPrice" value="${vo.pPrice}" 
                            oninput="this.value=this.value.replace(/[^0-9]/g,'');"><br>
                            상품설명 :<br>
                            <textarea class="form-control" rows="4" id="pNote" name="pNote" value="${vo.pNote }">
                            ${vo.pNote}</textarea><br>
                            상품상세설명 :<br><textarea class="form-control" rows="4" id="pDetail" name="pDetail"
                            value="${vo.pDetail }" placeholder="상품설명">${vo.pDetail }</textarea><br>
                            입고수 :<br>
                            <input class="form-control" type="text" id="pInput" name="pInput" value="${vo.pInput}" 
                            oninput="this.value=this.value.replace(/[^0-9]/g,'');"><br>
                        <div class="input-group mb-3">
						  <div class="custom-file">
						    <input type="file" name="uploadFile">
						  </div>
						</div>
                        </div>
                    <button type="submit" class="btn btn-success">수정하기</button></form>
                    <br>
                    <button type="button" class="btn btn-dark" onclick="productDelete()">삭제하기</button>
                </div>
            </div>
        </div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>