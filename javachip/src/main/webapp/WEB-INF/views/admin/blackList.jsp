<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import ="com.javachip.vo.*" %> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                            	<span>블랙리스트관리</span>
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
				<h4><b>블랙 리스트 회원</b></h4><br>
				<!-- 검색기능 추가 -->
				<form action="memberList.do" method="post">
				<div class="search admin">
				<span>
					<select name="AdminSearchId">
						<option value="uId"
						<c:if test="${param.AdminSearchId eq 'uId'}">selected</c:if>>아이디</option>
						<option value="uName"
						<c:if test="${param.AdminSearchId eq 'uName'}">selected</c:if>>이름</option>
					</select>
					<input type="text" name="AdminSearchIdValue" value="${param.AdminSearchIdValue}">
					<button>검색</button>
				</span>
				</div>
				</form>
				<table border="1" class="tableAdmin admin">
					<tr>
						<th>번호</th><th>아이디</th><th>이름</th><th>가입일</th><th>누적 경고</th><th>상세</th>
					</tr>
					<!-- 유저 목록 반복문 -->
					<c:forEach items="${list }" var="blacklist">
					<tr>
						<td>${blacklist.uNo }</td>
						<td>${blacklist.uId }</td>
						<td>${blacklist.uName }</td>
						<td>${blacklist.uJoin }</td>
						<td>${blacklist.uAlertNum }</td>
						<td class="ctd"><a href="<%=request.getContextPath() %>/admin/blacklistDetail.do?uNo=${blacklist.uNo}">
						<input type="button" value="상세" onclick="openMemberDetail()"></a>
						</td>
					</tr>
					</c:forEach>
				</table>
 				<div class="admin_pagination" style="text-align:center;">
 <%
String param = "AdminSearchId="+pm.getAdminSearchVO().getAdminSearchId()+"&AdminSearchIdValue="+pm.encoding(pm.getAdminSearchVO().getAdminSearchIdValue());
if (pm.isPrev()){ %>
<a href="<%=request.getContextPath()%>/admin/blackList.do?page=<%=pm.getStartPage()-1%>&<%=param%>">◀</a></td>
<%
}
%>

<% 
for(int i = pm.getStartPage() ; i<=pm.getEndPage(); i++) 
{
%>
<a href="<%=request.getContextPath()%>/admin/blackList.do?page=<%=i%>&<%=param%>"><%=i %></a>
<%	
}
%>

<%if(pm.isNext() && pm.getEndPage() > 0 ){ %>
<a href="<%=request.getContextPath()%>/admin/blackList.do?page=<%=pm.getEndPage()+1%>&<%=param%>">▶</a>
<%
} 
%>
</div>
</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>