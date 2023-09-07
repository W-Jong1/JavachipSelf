<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<div class="frame login">
		<form name="login frm" action="idFind.do" method="post">
			<h2>아이디 찾기</h2>
			<div class="main login">
				<br>
				<input type="text" placeholder="이름" id="uName" name="uName"><br>
				<input type="text" placeholder="이메일" id="uMail" name="uMail"><br>
				<input class="login btn" type="submit" value="아이디찾기" >
			</div>
			<div>
			<c:if test="${check == 1}">
			<script>
				opener.document.findform.uName.value = "";
				opener.document.findform.uMail.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
			</c:if>
			<!-- 이름과 비밀번호가 일치하지 않을 때 -->
			<c:if test="${check == 0 }">
			<label>찾으시는 아이디는 '<span style=font-weight:bold;>${uId}</span>' 입니다.</label>
			<div class="form-label-group" style="margin-bottom:20px;">
					<input class="login btn" type="button" value="로그인" 
					onclick="location.href='<%=request.getContextPath() %>/member/login.do'">
					<input class="login btn" type="button" value="비밀번호 찾기" 
					onclick="location.href='<%=request.getContextPath() %>/member/pwFind.do'">
			</div>
			</c:if>
			</div>
		</form>
		
	</div>
<%@ include file="../include/footer.jsp" %>