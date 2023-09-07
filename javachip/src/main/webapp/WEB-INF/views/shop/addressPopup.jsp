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

<script>
	//주문자 주소
	var isChecked = false;
	
	function same(){
		var checkbox = document.getElementById("sameInfo");
		var uNo = $("#uNo").val();
		
		if(!isChecked){
			$.ajax({
				url : "same.do",
				type : "POST",
				data : {uNo : uNo},
				success: function(data) {
				    console.log(data);

				    $("#aName").val(data.aName);
				    $("#aAdd1").val(data.addr1);
				    $("#aAdd2").val(data.addr2);
				    $("#aAdd3").val(data.addr3);
				    $("#aPhone").val(data.aPhone);
				    $("#aMail").val(data.aMail);

				    alert("변경이 완료되었습니다!");
				}
			});
			isChecked = true;
		}else{
			
			isChecked = false;
		}
	}

	//선택된 주소
	function handleSortChange() {
        var selectedValue = $("#sort").val();
        var uNo = $("#uNo").val(); 
        
        if(selectedValue==main) {
        	$("#aStatus").val("A");
        }else {
        	$("#aStatus").val("B");
        }
        // 선택된 값 서버로 전달
        $.ajax({
            url: "selectAddress.do",
            type: "POST",
            data: { selectedSort: selectedValue, uNo: uNo },
            success: function(response) {
                
            	console.log(response);

            	$("#aName").val(response.aName);
                $("#aAdd1").val(response.addr1);
                $("#aAdd2").val(response.addr2);
                $("#aAdd3").val(response.addr3);
                $("#aPhone").val(response.aPhone);
                $("#aMail").val(response.aMail);
                
                alert("변경이 완료되었습니다!");
            },
            error: function(error) {
                console.log("에러 발생:", error);
            }
        });
    }
	
	$(document).ready(function() {
       	$("#aStatus").val("A");
	    // 주소 수정/저장
	    $("#saveAddressButton").click(function() {
	        var addNo = $("#addNo").val();
	        var uNo = $("#uNo").val();
	        var aStatus = $("#aStatus").val();
	        var aName = $("#aName").val();
	        var aAdd1 = $("#aAdd1").val();
	        var aAdd2 = $("#aAdd2").val();
	        var aAdd3 = $("#aAdd3").val();
	        var aPhone = $("#aPhone").val();
	        var aMail = $("#aMail").val();
	        var aComment = $("#aComment").val();
	        
	        $.ajax({
	            url: "addressPopup.do",
	            type: "POST",
	            data: {
	            	addNo: addNo,
	            	uNo: uNo,
	            	aStatus: aStatus,
	                aName: aName,
	                Addr1: aAdd1,
	                Addr2: aAdd2,
	                Addr3: aAdd3,
	                aPhone: aPhone,
	                aMail: aMail,
	                aComment: aComment
	            },
	            success: function(data) {
	                console.log(data);
	                if(data > 0) {
	                    alert("저장 성공");
	                    window.close();
	                } else {
	                	alert("저장 실패");
	                }
	            },
	            error: function() {
	            	alert("에러발생");
	            }
	        });
	    });
	    $("#addAddressButton").click(function() {
	        var uNo = $("#uNo").val();
	        var aStatus = $("#aStatus").val();
	        var aName = $("#aName").val();
	        var aAdd1 = $("#aAdd1").val();
	        var aAdd2 = $("#aAdd2").val();
	        var aAdd3 = $("#aAdd3").val();
	        var aPhone = $("#aPhone").val();
	        var aMail = $("#aMail").val();
	        var aComment = $("#aComment").val();
	        
	        $.ajax({
	            url: "addressAddPopup.do",
	            type: "POST",
	            data: {
	            	uNo: uNo,
	            	aStatus: aStatus,
	                aName: aName,
	                Addr1: aAdd1,
	                Addr2: aAdd2,
	                Addr3: aAdd3,
	                aPhone: aPhone,
	                aMail: aMail,
	                aComment: aComment
	            },
	            success: function(data) {
	                console.log(data);
	                if(data > 0) {
	                    alert("등록 성공");
	                    window.close();
	                } else {
	                	alert("배송지는 두개까지 추가가 가능합니다.");
	                }
	            },
	            error: function() {
	            	alert("에러발생");
	            }
	        });
	    });
	});
</script>
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
                 <input type="text" id="uAdd1" placeholder="우편번호" class="checkout__input__add" style="width:150px;" value="${login.uAdd1 }" >
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
        	<form name="addressPopup" id="addressPopup" method="post" action="addressPopup.do">
        	<input type="hidden" id="addNo" name="addNo" value="${addvo.addNo }" />
        	<input type="hidden" id="aStatus" name="aStatus" >
        	
				<h4>배송지 관리</h4>
				<div class="col-lg-10 col-md-6" id="address_list" style=margin-bottom:20px;>
			    	<p>배송지 목록</p>
		    		<select id="sort" name="sort" onchange="handleSortChange()">
						<option value="main" id="main" ${param.sort eq 'main' ? 'selected' : ''}>기본 배송지</option>
						<option value="sub1" id="sub1" ${param.sort eq 'sub1' ? 'selected' : ''}>추가 배송지1</option>
					</select>
					<input type="hidden" id="uNo" value="${login.uNo }">
					<button type="button" class="btn btn-outline-primary" id="saveAddressButton" style="margin-left: 20px;">저장</button>
					<button type="button" class="btn btn-outline-primary" id="addAddressButton" style="margin-left: 20px;">추가</button>
				</div>
		    	<div class="col-lg-10 col-md-6">
		    		<p>&nbsp;&nbsp;&nbsp;&nbsp;주문자 정보와 동일 &nbsp;&nbsp;
		    		<input type="checkbox" id="sameInfo" class="sameInfoCheck" onclick="same()" />
		    		</p>
		            <div class="row">
		                <div class="col-lg-6">
		                    <div class="checkout__input">
		                        <p>성명<span>*</span></p>
		                        <input type="text" name="aName" id="aName" value="${addvo.aName }" >
		                    </div>
		                </div>
		            </div>
		            <div class="checkout__input">
		                <p>주소<span>*</span></p>
		                <input type="text" id="aAdd1" name="addr1" placeholder="우편번호" class="checkout__input__add" style="width:150px;"
		                 value="${addvo.addr1}">
		                <button type="button" class="btn btn-outline-primary" onclick="sample7_execDaumPostcode()">우편번호</button>
		                <input type="text" id="aAdd2" name="addr2" 
		                value="${addvo.addr2 }" class="checkout__input__add" required>
		                <input type="text" id="aAdd3" name="addr3" 
		                value="${addvo.addr3 }" class="checkout__input__add" required>
		            </div>
		            <div class="row">
		                <div class="col-lg-6">
		                    <div class="checkout__input">
		                        <p>전화번호<span>*</span></p>
		                        <input type="text" name="aPhone" id="aPhone" value="${addvo.aPhone }">
		                    </div>
		                </div>
		                <div class="col-lg-6">
		                    <div class="checkout__input">
		                        <p>이메일<span>*</span></p>
		                        <input type="text" name="aMail" id="aMail" value="${addvo.aMail }">
		                    </div>
		                </div>
		            </div>
		            <div class="checkout__input">
		                <p>배송 시 전달사항</p>
		                <input id="aComment" type="text"
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
/* 
$("#addSaving").click( function() {
     $('#addressSaved').submit();
     setTimeout(function() {   
         window.close();
      }, 100);
  });
	 */
	</script>
</html>