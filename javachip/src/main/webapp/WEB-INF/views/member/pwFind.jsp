<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<div class="frame login">
		<h2>비밀번호 찾기</h2>
		<div class="main login">
			<br>
			<input type="text" placeholder="이름" id="uName" name="uName"/><br>
			<input type="text" placeholder="아이디" id="uId" name="uId"/><br>
			<input type="text" placeholder="이메일" id="uMail" name="uMail"/><br>
			<input class="login btn"  type="button" id="findBtn" value="임시 비밀번호 전송"/>
		</div>
	</div>
	<script type="text/javascript">
	<!-- 이메일 인증  -->
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "pwFind.do",
				type : "POST",
				data : {
					uId : $("#uId").val(),
					uName : $("#uName").val(),
					uMail : $("#uMail").val()
				},
				success : function(result) {
					alert(result);
					location.replace("login.do");
				},
			})
		});
	})
</script>
<%@ include file="../include/footer.jsp" %>