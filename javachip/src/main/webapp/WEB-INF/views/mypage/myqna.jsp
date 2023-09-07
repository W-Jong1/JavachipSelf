<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>내 작성글</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">Home</a>
                            <a href="main.do">마이페이지</a>
                            <span>내 작성글</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- QnA -->
	<section class="board-box spad">
	    <div class="container">
	    <h4>나의 QnA</h4><br>
		    <table class ="table table-hover">
		        <tr>
		            <td scope="col" style="width:10%">번호</td>
		            <td scope="col" style="width:60%">제목</td>
		            <td scope="col" style="width:15%">이름</td>
		            <td scope="col" style="width:15%">날짜</td>
		        </tr>
			    <c:forEach items="${qnaList}" var="qna">
			        <tr>
			            <td scope="row">${qna.qNo}</td>
			            <td><a href="<%= request.getContextPath() %>/help/qnaView.do?qNo=${qna.qNo}">${qna.qTitle}</td>
			            <td>${qna.uName}</td>
			            <td>${qna.qDate.substring(0,10)}</td>
			        </tr>
			    </c:forEach>
		    </table>
		    <div class="product__pagination" style="text-align:center;">
	           	<c:if test="${pm.prev == true}">
	                <a href="myqna.do?page=${pm.startPage-1}&searchType=${pm.searchVO.searchType}&searchValue=${pm.searchVO.searchValue}"><i class="fa fa-long-arrow-left"></i></a>
	           	</c:if>
	           	<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
	                <a href="myqna.do?page=${i}&searchType=${pm.searchVO.searchType}&searchValue=${pm.searchVO.searchValue}">${i}</a>
	               </c:forEach>
	           	<c:if test="${pm.next == true}">
	                <a href="myqna.do?page=${pm.endPage+1}&searchType=${pm.searchVO.searchType}&searchValue=${pm.searchVO.searchValue}"><i class="fa fa-long-arrow-right"></i></a>
	           	</c:if>
            </div>
	    </div>
	</section>
<%@ include file="../include/footer.jsp" %>