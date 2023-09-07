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
                            <a href="#">마이페이지</a>
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
		            <td scope="col" style="width:8%">번호</td>
		            <td scope="col" style="width:54%">제목</td>
		            <td scope="col" style="width:15%">이름</td>
		            <td scope="col" style="width:15%">날짜</td>
		        </tr>
		        <c:forEach items="${qnaList}" var="qna">
			        <tr>
			            <td scope="row">${qna.qNo}</td>
			            <td><a href="<%= request.getContextPath() %>/help/qnaView.do?qNo=${qna.qNo}">${qna.qTitle}</td>
			            <td>${qna.uName}</td>
			            <td>${qna.qDate}</td>
			        </tr>
		        </c:forEach>
		    </table>
		    <div style="text-align:center;">
		        <button onClick="location.href='myqna.do'">작성한 QnA 더보기</button>
		    </div><br>
	    </div>
	</section>
	<!-- 후기 -->
	<section class="board-box spad">
	    <div class="container">
	    	<h4>나의 후기</h4><br>
		    <table class ="table table-hover">
		        <tr>
		            <td scope="col" style="width:8%">번호</td>
		            <td scope="col" style="width:54%">제목</td>
		            <td scope="col" style="width:15%">이름</td>
		            <td scope="col" style="width:15%">날짜</td>
		        </tr>
		        <c:forEach items="${reviewList}" var="review">
			        <tr>
			            <td scope="row">${review.rNo}</td>
			            <td><a href="<%= request.getContextPath() %>/shop/details.do?pNo=${review.pNo}">${review.rContents}</td>
			            <td>${review.uName}</td>
			            <td>${review.rDate}</td>
			        </tr>
		        </c:forEach>
		    </table>
		    <div style="text-align:center;">
		        <button onClick="location.href='myreview.do'">작성한 후기 더보기</button>
		    </div><br>
	    </div>
	</section>
<%@ include file="../include/footer.jsp" %>