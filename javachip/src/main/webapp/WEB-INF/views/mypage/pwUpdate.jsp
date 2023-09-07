<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>비밀번호 변경</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/table.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/elegant-icons.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/nice-select.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/jquery-ui.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.carousel.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/slicknav.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" type="text/css"/>
    
    <!-- Js Plugins -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
<title>JavaChip|배송지 관리</title>

<script>

</script>
</head>
<body>
<section>
    <div class="container">
    	<form action="pwUpdate.do" method="post" onsubmit="return checks()">
	    	<div class="title" style="margin-top:20px;">
	        <h4>비밀번호 변경</h4>
	        </div>
	        <div class="pwUpdate" style="margin-top:40px; margin-bottom:40px;">
	        <p>비밀번호<span>*</span>&nbsp;&nbsp;<span style="font-size:10pt; color:silver;">대/소문자, 숫자, 특수기호 최소 8자에서 최대 20자</span></p>
	        	<input type="password" class="join__input__short" id="uPw" name="uPw" onblur="checkFn(this)">
	        <p>비밀번호 확인<span>*</span></p>
	        	<input type="password" class="join__input__short" id="uPwc" name="uPwc">
                <div class="msg"></div>
	        </div>
	        <div class="join__submit" >
				<input type="submit" class="btn btn-primary" value="비밀번호 변경">
				<input type="button" class="btn btn-outline-secondary" value="취소" onClick='window.close()'>
			</div>
        </form>
	</div>
</section>
</body>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.bundle.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.nice-select.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/mixitup.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script>
    <script>
    function checks() {
    	var getPw= RegExp(/^[a-zA-Z0-9`~!@@#$%^&*|₩₩₩'₩";:₩/?]{8,20}$/);
    	
    	//비밀번호
    	if(!getPw.test($("#uPw").val())) {
    	alert("형식에 맞춰서 PW를 입력해주세요.");
    	$("#uPw").focus();
    	return false;
    	}
    	
    	//비밀번호 똑같은지
    	if($("#uPw").val() != ($("#uPwc").val())){ 
    	alert("동일한 비밀번호를 입력해주세요.");
    	$("#uPwc").val("");
    	$("#uPwc").focus();
    	return false;
       }
    	return true;
    }
    </script>
</html>