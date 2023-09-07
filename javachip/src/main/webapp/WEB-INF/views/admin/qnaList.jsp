<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import ="com.javachip.vo.*" %> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css" type="text/css"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% AdminPageMaker pm =  (AdminPageMaker)request.getAttribute("pm"); %>
<!-- 메인 작성 영역 -->
<script type="text/javascript">
$(function(){
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for(var i = 0; i < chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked = true;
		}
		else{
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});

function deleteValue(){
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");
	for(var i = 0; i < list.length; i++){
		if(list[i].checked){
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length == 0){
		alert("선택된 글이 없습니다.");
	}
	else{
		var chk = confirm("정말 삭제하시겠습니까?");
		
		$.ajax({
			url : "qnaDelete.do",
			type : "POST",
			traditional : true,
			data : {
				valueArr : valueArr
			},
			success : function(jdata){
				if(jdata = 1){
					alert("삭제성공");
					location.href="<%= request.getContextPath() %>/admin/qnaList.do";
				}
				else{
					alert("삭제실패");
				}
			}
		});
	}
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
                            	<span>QnA관리</span>
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
		<div class="main admin" style="float:left; width:75%;">
				<h4><b>QnA 목록 조회</b></h4><br>
				<div class="search admin">
					<form class="d-flex justify-content-center">
 						<div class="input-group mb-4">
							<select name="searchType_qna">
								<option value="total" <c:if test="${param.searchType_qna eq 'total'}">selected</c:if>>전체</option>
								<option value="complete" <c:if test="${param.searchType_qna eq 'complete'}">selected</c:if>>답변완료</option>
								<option value="wait" <c:if test="${param.searchType eq 'wait'}">selected</c:if>>답변대기</option>
							</select>
							&nbsp;&nbsp;<div class="input-group-append">
							<button type="submit" class="btn btn-secondary mb-4">검색</button>
							</div>
						</div>
					</form>
				</div>
				<table border="1" class="tableAdmin qna admin">
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck"></th>
						<th>번호</th><th>제목</th><th>작성일</th><th>상태</th>
					</tr>
					<c:forEach items="${list}" var="qna">
					<tr>
						
						<td><input type="checkbox" name="RowCheck" th:value="${qna.qNo}"
							class="RowCheck"
							data-nNo="${qna.qNo }" value="${qna.qNo }"></td>
						<td>${qna.qNo }</td>
						<td><a href="<%=request.getContextPath()%>/help/qnaView.do?qNo=${qna.qNo}">${qna.qTitle }</a></td>
						<td>
						${qna.qDate }
						</td>
						<td>
						<c:choose>
						<c:when test="${ !empty qna.qAnswer}">
							답변완료
						</c:when>
						<c:otherwise>
							답변대기
						</c:otherwise>
						</c:choose>
						</td>
					</tr>
					</c:forEach>
				</table>
				<div class="admin_pagination" style="text-align:center;">
<%
String param = "searchType_qna="+pm.getAdminSearchVO().getSearchType_qna();
if (pm.isPrev()){ %>
<a href="<%=request.getContextPath()%>/admin/qnaList.do?page=<%=pm.getStartPage()-1%>&<%=param%>">◀</a></td>
<%
}
%>

<% 
for(int i = pm.getStartPage() ; i<=pm.getEndPage(); i++) 
{
%>
<a href="<%=request.getContextPath()%>/admin/qnaList.do?page=<%=i%>&<%=param%>"><%=i %></a>
<%	
}
%>

<%if(pm.isNext() && pm.getEndPage() > 0 ){ %>
<a href="<%=request.getContextPath()%>/admin/qnaList.do?page=<%=pm.getEndPage()+1%>&<%=param%>">▶</a>
<%
}
%>
	</div>
	<button type="submit" class="btn btn-dark" onclick="deleteValue();">선택 삭제</button>
		</div>
	</div>
	</section>
	<!-- Section End -->
<%@ include file="../include/footer.jsp" %>