<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JavaChip | Template</title>

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
</head>
<body>
<section class="checkout spad" style="padding-top: 20px;">
    <div class="container">
    	<div class="userInfo" style="display:none;">
        	<div class="row">
	             <div class="col-lg-6">
	                 <div class="checkout__input">
	                     <p>성명<span>*</span></p>
	                     <input type="text" name="uName" id="uName" value="${login.uName }">
	                 </div>
	             </div>
             </div>
             <div class="checkout__input">
                 <p>주소<span>*</span></p>
                 <input type="text" id="uAdd1" placeholder="우편번호" class="checkout__input__add" style="width:150px;" value="${login.uAdd1 }">
                 <input type="text" id="uAdd2" placeholder="주소" class="checkout__input__add" value="${login.uAdd2 }">
                 <input type="text" id="uAdd3" placeholder="나머지 주소" class="checkout__input__add" value="${login.uAdd3 }">
             </div>
             <div class="row">
                 <div class="col-lg-6">
                     <div class="checkout__input">
                         <p>전화번호<span>*</span></p>
                         <input type="text" name="uPhone" id="uPhone" value="${login.uPhone }">
                     </div>
                 </div>
                 <div class="col-lg-6">
                     <div class="checkout__input">
                         <p>이메일<span>*</span></p>
                         <input type="text" name="uMail" id="uMail" value="${login.uMail }">
                     </div>
                 </div>
             </div>
        </div>
        <div class="checkout__form">
        	<form name="addressSaved" id="addressSaved" method="post" action="addressSaved.do">
				<h4>배송지 관리</h4>
				<div class="col-lg-10 col-md-6" id="address_list" style=margin-bottom:20px;>
			    	<p>배송지 목록</p>
		    		<select name="sort" id="sort">
		    			<option value="add_main" id="add_main">기본 배송지</option>
		    			<option value="add_sub1" id="add_sub1">추가 배송지1</option>
		    			<option value="add_sub2" id="add_sub2">추가 배송지2</option>
		    		</select>
					<button type="submit" class="btn btn-outline-primary" id="addSaving" style=margin-left:20px;>저장/수정</button>
				</div>
		    	<div class="col-lg-10 col-md-6">
		    		<p>&nbsp;&nbsp;&nbsp;&nbsp;주문자 정보와 동일 &nbsp;&nbsp;<input type="checkbox" id="sameInfo" class="sameInfoCheck"/></p>
		            <div class="row">
		                <div class="col-lg-6">
		                    <div class="checkout__input">
		                        <p>성명<span>*</span></p>
		                        <input type="text" name="aName" id="aName" required>
		                    </div>
		                </div>
		            </div>
		            <div class="checkout__input">
		                <p>주소<span>*</span></p>
		                <input type="text" id="aAdd1" name="aAdd1" placeholder="우편번호" class="checkout__input__add" style="width:150px;" value="${add.aName}" required>
		                <button type="button" class="btn btn-outline-primary" onclick="sample7_execDaumPostcode()">우편번호</button>
		                <input type="text" id="aAdd2" name="aAdd2" placeholder="주소" class="checkout__input__add" required>
		                <input type="text" id="aAdd3" name="aAdd3" placeholder="나머지 주소" class="checkout__input__add" required>
		            </div>
		            <div class="row">
		                <div class="col-lg-6">
		                    <div class="checkout__input">
		                        <p>전화번호<span>*</span></p>
		                        <input type="text" name="aPhone" id="aPhone" required>
		                    </div>
		                </div>
		                <div class="col-lg-6">
		                    <div class="checkout__input">
		                        <p>이메일<span>*</span></p>
		                        <input type="text" name="aMail" id="aMail" required>
		                    </div>
		                </div>
		            </div>
		            <div class="checkout__input">
		                <p>배송 시 전달사항</p>
		                <input type="text"
		                    placeholder="전달사항을 입력해주세요. (선택사항)">
		            </div>
		        </div>
	        </form>
        </div>
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
    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/addressapi.js"></script>
	<script>
	$(document).ready(function() {
	    $("#sameInfo").change(function() {
	        if ($(this).is(":checked")) {
	            $("#aName").val($("#uName").val());
	            $("#aAdd1").val($("#uAdd1").val());
	            $("#aAdd2").val($("#uAdd2").val());
	            $("#aAdd3").val($("#uAdd3").val());
	            $("#aPhone").val($("#uPhone").val());
	            $("#aMail").val($("#uMail").val());
	        } else {
	            $("#aName").val("");
	            $("#aAdd1").val("");
	            $("#aAdd2").val("");
	            $("#aAdd3").val("");
	            $("#aPhone").val("");
	            $("#aMail").val("");
	        }
		});
	});
	

$("#addSaving").click( function() {
     $('#addressSaved').submit();
     setTimeout(function() {   
         window.close();
      }, 100);
  });
});
	</script>
</html>