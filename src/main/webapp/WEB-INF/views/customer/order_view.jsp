<%@ page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
/* The checkboxs */
.checkboxs {
  display: block;
  position: relative;
  padding-left: 30px;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
.checkboxs input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 20px;
  width: 20px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.checkboxs:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.checkboxs input:checked ~ .checkmark {
  background-color: #00388c;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.checkboxs input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.checkboxs .checkmark:after {
  left: 8px;
  top: 4px;
  width: 5px;
  height: 9px;
  border: solid white;
  border-width: 0 1px 1px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}

.order-input {
  border-radius: 5px;
  border:1px solid #dddddd;
  height: 46px;
  padding-left: 18px;
  padding-top: 10px;
  padding-bottom: 10px;
  padding-left: 10px;
  outline: none;
}

.payment-btn>span>label {
	width:238px; 
	height:45px; 
	text-align:center; 
	margin-bottom:12px;
	padding-top:10px;
	border-radius: 5px; 
	border:1px solid #dddddd;
  	height: 46px;
	cursor: pointer;
}

.payment-btn>span>input:checked ~ label {
	background-color: #00388c;
	color: white;
	border: none;
}

.payguide {
	text-indent: -20px;
	font-size: 14px;
	color:#999999;
}

</style>
<main>
<c:if test="${requestScope.msg != null}">
<script>
	alert("${requestScope.msg}");
</script>
</c:if>
	<h2 class="text-center mb-5 mt-5">주문서</h2>
	<div class="container" style="width:1050px; padding: 0">
			<div style="width:1050px; height:200px;">
				<div style="width:1050px; padding-top: 20px; padding-bottom:10px;
							border-bottom: 1px; border-bottom-style: solid; border-bottom-color: black;">
					<h5>주문상품</h5>
				</div>
				<div style="border-bottom: 1px; border-bottom-style: solid; border-bottom-color: #dddddd;
							width:1050px; padding-top: 34px; padding-bottom: 34px; text-align: center;">
							자연유래 성분 치약 상품을 주문합니다.
				</div>
			</div>
			
			<!-- 주문자 정보 -->
				<div style="width:1050px; padding-top: 20px; padding-bottom:10px; margin-bottom: 30px;
							border-bottom: 1px; border-bottom-style: solid; border-bottom-color: black;">
					<h5>주문자 정보</h5>
				</div>
				<div style="margin-bottom:100px">
					<table style="width:100%">
						<tbody>
							<tr style="width:1050px; height:60px;">
								<th style="width:200px;">주문자 이름</th>
								<td>
									<input class="order-input" type="text" style="width:489px">
								</td>
							</tr>
							<tr style="width:1050px; height:60px;">
								<th style="width:200px;">휴대폰 번호</th>
								<td>
									<input class="order-input" type="text" style="width:489px" placeholder="휴대폰 번호 ('-' 없이 입력)">
								</td>
							</tr>
							<tr style="width:1050px; height:60px;">
								<th style="width:200px;">이메일</th>
								<td>
									<div style="justify-content: space-between; width:489px; height:46px; display: flex; align-items: center">
										<input class="order-input" type="text" style="width:229px">
										@
										<select class="order-input" style="width:229px">
											<option value="" selected="selected">-이메일 선택-</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="nate.com">nate.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="yahoo.com">yahoo.com</option>
											<option value="empas.com">empas.com</option>
											<option value="korea.com">korea.com</option>
											<option value="dreamwiz.com">dreamwiz.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="etc">직접입력</option>
										</select>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
							<div style="margin-left:200px; font-size: 14px; color:#999999; margin-top:10px">
								배송이 시작되면 주문 처리 과정을 이메일과 휴대폰 번호로 알려드리니,<br>
								꼭 정확한 정보를 입력해 주세요.
							</div>
				</div>
				
				<!---------- 배송 정보 ---------->
				<div style="width:1050px; padding-top: 20px; padding-bottom:10px; margin-bottom: 30px;
							border-bottom: 1px; border-bottom-style: solid; border-bottom-color: black;">
					<h5>배송 정보</h5>
				</div>
				<div style="margin-bottom:100px">
					<div style="width:1050px; height:30px; display: flex;">
						<span style="width:200px">배송지 선택</span>
							<div style="display:flex;">
								<label class="checkboxs" style="margin-right:20px;">주문자 정보와 동일
								<input type="radio" name="addr" checked="checked">
								<span class="checkmark"></span></label> 
								
								<label class="checkboxs">새로운 배송지
								<input type="radio" name="addr">
								<span class="checkmark"></span></label>
							</div> 
					</div>
					<table style="width:100%">
						<tbody>
							<tr style="width:1050px; height:60px;">
								<th style="width:200px;">받는사람</th>
								<td>
									<input class="order-input" type="text" style="width:489px">
								</td>
							</tr>
							<tr style="width:1050px; height:162px;">
								<th style="width:200px;">주소</th>
								<td>
									<div style="width:489px; margin-bottom:12px; display: flex">
										<input class="order-input" style="width:370px" type="text" id="sample2_postcode" placeholder="우편번호">
										<input class="order-input" style="width:107px; border-radius: 5px; background-color: #00388c; color:white; margin-left:12px; 
										padding-left:10px; padding-right:10px; border:none;" type="button" onclick="sample2_execDaumPostcode()" value="주소검색"><br>
									</div>
									<input class="order-input" style="width:489px; margin-bottom:12px" type="text" id="sample2_address" placeholder="기본주소"><br>
									<input class="order-input" style="width:489px;" type="text" id="sample2_detailAddress" placeholder="나머지 주소(선택 입력 가능)">
									<!-- <input type="text" id="sample2_extraAddress" placeholder="참고항목"> -->
									<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
										<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
									</div>
								</td>
							</tr>
							<tr style="width:1050px; height:60px;">
								<th style="width:200px;">휴대폰 번호</th>
								<td>
									<input class="order-input" type="text" style="width:489px" placeholder="휴대폰 번호 ('-' 없이 입력)">
									<!-- <div style="justify-content: space-between; width:489px; height:46px; display: flex; align-items: center">
										<select class="order-input" id="phone" style="width:155px" onchange="message()">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>-
										<input class="order-input" type="text" size="15" style="width:151px">-
										<input class="order-input" type="text" size="15" style="width:151px">
									</div> -->
								</td>
							</tr>
							<tr style="width:1050px; height:60px;">
								<th style="width:200px;">요청사항</th>
								<td>
									<textarea class="order-input" maxlength="10" cols="0" id="message" 
											style="overflow:hidden; margin-bottom:12px; display:none; width:489px; resize:none;"></textarea>
									<select class="order-input" style="width:489px" id="message-select" onchange="message()">
										<option value="message-0" selected="selected">-- 메시지 선택 (선택사항) --</option>
										<option value="message-1">배송 전에 미리 연락바랍니다.</option>
										<option value="message-2">부재 시 경비실에 맡겨주세요.</option>
										<option value="message-3">부재 시 문 앞에 놓아주세요.</option>
										<option value="message-4">빠른 배송 부탁드립니다.</option>
										<option value="message-5">택배함에 보관해 주세요.</option>
										<option value="6">직접 입력(10자 이내)</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
							<div style="margin-left:200px; font-size: 14px; color:#999999; margin-top:10px">
								공동 현관문 비밀번호가 있다면 '직접 입력' 선택 후 꼭 입력해주세요.
							</div>
				</div>
				
				
				
				<!-- 결제수단 -->
		<div style="display: flex; width:1050px; justify-content: space-between;">
			<div>
				<div style="width:689px; padding-top: 20px; padding-bottom:10px; margin-bottom:30px; display:flex; 
							justify-content:space-between; border-bottom: 1px; border-bottom-style: solid; border-bottom-color: black;">
					<h5>결제수단</h5>
					<label class="checkboxs">결제수단과 입력정보를 다음에도 사용
					<input type="checkbox" name="addr"><span class="checkmark"></span></label>
				</div>
				<div style="width:689px; height:240px; padding-bottom:20px; margin-bottom:20px; display:flex;
							border-bottom: 1px; border-bottom-style: solid; border-bottom-color: #dddddd;">
					<div class="inner">
						<ul style="margin:0; padding: 0">
						<li class="paymethod-newArea" style="height: 240px; list-style: none; padding-bottom:20px; margin-bottom:20px; display: flex">
							<input type="radio" id="payment" style="display:none;">
							<label for="payment" style="width:200px; height:228px">결제수단 선택</label>
							
							<!-- 결제 수단 버튼 -->
							<div class="payment-btn" style="width:489px; height:228px;">
								<span>
									<input id="paymethod0" value="naver" onclick="selPayment()"checked="checked" name="paymethod" type="radio" style="display: none">
									<label for="paymethod0">
									네이버페이</label>
								</span>
								<span>
									<input id="paymethod1" value="kakao" onclick="selPayment()"name="paymethod" type="radio" style="display: none">
									<label for="paymethod1">
									카카오페이</label>
								</span>
								<span>
									<input id="paymethod2" value="card" onclick="selPayment()"name="paymethod" type="radio" style="display: none">
									<label for="paymethod2">
									신용/체크카드</label>
								</span>
								<span>
									<input id="paymethod3" value="payco" onclick="selPayment()"name="paymethod" type="radio" style="display: none">
									<label for="paymethod3">
									페이코</label>
								</span>
								<span>
									<input id="paymethod4" value="toss" onclick="selPayment()"name="paymethod" type="radio" style="display: none">
									<label for="paymethod4">
									토스페이</label>
								</span>
								<span>
									<input id="paymethod5" value="excrow" onclick="selPayment()"name="paymethod" type="radio" style="display: none">
									<label for="paymethod5">
									에스크로(가상계좌)</label>
								</span>
								<span>
									<input id="paymethod6" value="phone" onclick="selPayment()" name="paymethod" type="radio" style="display: none">
									<label for="paymethod6">
									휴대폰</label>
								</span>
							</div>
						</li>
						</ul>
					</div>
				</div>
				
				<!-- 선택한 결제수단 안내 -->
				<!-- 네이버페이 -->
				<div id="naver" style="width:689px; height:140px; padding-left: 200px;">
					<li style="list-style: none; font-size: 14px; margin-bottom:12px">주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</li>
					<li class="payguide">네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행 계좌 정보를 
					등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.</li>
					<li class="payguide">네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사별 무이자, 청구 할인 혜택을 받을 수 있습니다.</li>
				</div>
				
				<!-- 카카오페이 -->
				<div id="kakao" style="width:689px; height:82px; padding-left: 200px; display: none;">
					<li style="list-style: none; font-size: 14px; margin-bottom:12px">
					카카오톡 앱을 설치한 후, 최초 1회 카드정보를 등록하셔야 사용 가능합니다.</li>
					<li class="payguide">인터넷 익스플로러는 8 이상에서만 결제 가능합니다.</li>
					<li class="payguide">카카오머니로 결제 시, 현금영수증 발급은 ㈜카카오페이에서 발급가능합니다.</li>
				</div>

				<!-- 신용/체크카드 -->
				<div id="card" style="width:689px; height:33px; padding-left: 200px; display: none;">
					<li class="payguide">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</li>
				</div>
				
				<!-- 페이코 -->
				<div id="payco" style="width:689px; height:60px; padding-left: 200px; display: none;">
					<li style="list-style: none; font-size: 14px; margin-bottom:12px">
					페이코(www.payco.com)에 회원가입 후, 최초 1회 카드 및 계좌 정보를 등록하셔야 사용 가능합니다.</li>
				</div>
				
				<!-- 토스페이 -->
				<div id="toss" style="width:689px; height:120px; padding-left: 200px; display: none;">
					<li style="list-style: none; font-size: 14px; margin-bottom:12px">
					토스는 간편하게 지문 또는 비밀번호만으로 결제할 수 있는 빠르고 편리한 간편 결제 서비스입니다.</li>
					<li class="payguide">토스 결제 후 취소/반품 등이 발생할 경우 토스를 통한 신용카드 취소/토스머니 환불이 이루어집니다.</li>
					<li class="payguide">토스 이용가능 결제수단 : 국내 발행 신용/체크카드, 토스머니</li>
				</div>
				
				<!-- 휴대폰 -->
				<div id="phone" style="width:689px; height:33px; padding-left: 200px; display: none;">
					<li class="payguide" style="margin-top:20px">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</li>
				</div>
				
				<!-- 에스크로(가상계좌) -->
				<div id="excrow" style="width:689px; height:140px; padding-left: 200px; display: none;">
					<div class="" style="display: flex; justify-content: space-between;">
					<li style="list-style: none; font-size: 14px;">에스크로</li>
					<li style="list-style: none; font-size: 14px; color:#999999">
						<label class="checkboxs">에스크로(구매안전)서비스를 적용합니다.
						<input type="checkbox" name="addr"><span class="checkmark"></span></label>
					</li>
					</div>
					<li class="payguide" style="margin-top:20px">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</li>
					
					<div>
						<div style="width:457px; height:121px">
							<div style="width:450px; height:62px; padding-top: 20px">
								현금영수증
							</div>
							
							<!-- 현금영수증 신청 여부 -->
							<div id="select-receipt" style="display:flex; ">
									<label class="checkboxs" style="margin-right:30px;">현금영수증 신청
									<input type="radio" onclick="receipt()" name="receipt" id="cashReceipt1">
									<span class="checkmark"></span></label> 
									
									<label class="checkboxs">신청안함
									<input type="radio" onclick="receipt()" name="receipt" checked="checked" id="cashReceipt2">
									<span class="checkmark"></span></label>
							</div>
						</div>
						
						<!-- 현금영수증 개인/사업자 -->
						<div>
							<div id="receipt-user" style="display:flex; display: none; padding-top: 20px">
								<label class="checkboxs" style="margin-right:30px;">개인
								<input type="radio"  onclick="receiptuser()" name="receipt-user" id="user1" value="2" checked="checked">
								<span class="checkmark"></span></label> 
								
								<label class="checkboxs">사업자
								<input type="radio" onclick="receiptuser()" name="receipt-user" id="user2" value="3">
								<span class="checkmark"></span></label>
							</div>
							<!-- 현금영수증 휴대폰번호 -->
							<div id="receipt-phone" style="display: none; padding-top: 20px"">
								<input class="order-input" style="width:489px;" type="text" 
							 			placeholder="휴대폰 번호 ('-' 없이 입력)">
							</div>
							
							<!-- 현금영수증 사업자번호 -->
							<div id="receipt-company" style="display: none; padding-top: 10px"">
								<input class="order-input" style="width:489px;" type="text" 
								 			placeholder="사업자번호">
							</div>
						</div>
					</div>
				</div>
				<div style="width:689px; height:140px; padding-left: 200px; margin-top:40px; margin-bottom:20px">
					<label class="checkboxs" style="margin-bottom:20px">[필수]구매조건 확인 및 결제진행 동의
						<input type="checkbox" name="agree"><span class="checkmark"></span></label>
					<li style="list-style: none; font-size: 14px; margin-bottom:12px">
					주문 전 확인해주세요!</li>
					<li class="payguide">무이자 할부가 적용되지 않은 상품과 무이자 할부가 가능한 상품을 구매 할 경우 무이자 할부가 적용되지 않습니다.</li>
				</div>
			</div>
				
				
				
				<!-- 장바구니 금액 표시 -->	
				<div>
					<div style="width:316px; padding-top: 20px; padding-bottom:10px;">
						<h5>결제정보</h5>
					</div>
					<div>
					<div style="width:300px; height:220px; background: #FBFAFA; padding: 20px; box-sizing: border-box;">
						<div style="width:260px; margin-bottom: 15px; display: flex; justify-content: space-between;">
							<div>합계</div><div><fmt:formatNumber type="Number" value="${cartTotPrice}"/>원</div>
						</div>
						<div style="width:260px; margin-bottom: 15px; display: flex; justify-content: space-between;">
							<div>할인금액</div><div><fmt:formatNumber type="Number" value="${cartTotPrice}"/>원</div>
						</div>
						<div style="width:260px; margin-bottom: 20px; display: flex; justify-content: space-between;
									border-bottom: 1px; border-bottom-style: solid; border-bottom-color: black; padding-bottom: 20px">
							<div>배송비</div><div><fmt:formatNumber type="Number" value="${cartTotPrice}"/>원</div>
						</div>
						<div style="width:260px; margin-bottom: 15px; display: flex; justify-content: space-between;">
							<div><b>결제예정금액</b></div><div><b><fmt:formatNumber type="Number" value="${cartTotPrice}"/>원</b></div>
						</div>
					</div>
					
					</div>
			</div>
		</div><!-- 결제수단 -->
		
		<!-- 구매하기 버튼 -->
		<div style="width:1050px; height:60px; text-align: center;">
			<button style="width:300px; padding:15px; border-radius: 5px; background-color: #00388c; border:none;
									color:white;">결제하기</button>
		</div>
	</div>
</main>
<script>

	/* 현금영수증 */
	function receipt(){
		var receipt1 = document.getElementById("cashReceipt1")
		var receipt2 = document.getElementById("cashReceipt2")

		if(receipt1.checked){
			document.getElementById("receipt-user").style.display="flex";
			document.getElementById("receipt-phone").style.display="block";
		}else if(!receipt1.checked || receipt2.checked){
			document.getElementById("receipt-user").style.display="none";
			document.getElementById("receipt-phone").style.display="none";
			document.getElementById("receipt-company").style.display="none";
		}
	
	}
	
	/* 현금영수증 발급자 */
	function receiptuser(){
		var user1 = document.getElementById("user1")
		var user2 = document.getElementById("user2")
		
		if(user1.checked){
			document.getElementById("receipt-phone").style.display="block";
			document.getElementById("receipt-company").style.display="none";
		}else if(user2.checked){
			document.getElementById("receipt-phone").style.display="block";
			document.getElementById("receipt-company").style.display="block";
		}
	}
	

	/* 결제수단 선택 */
	function selPayment(){
		  var pm = document.getElementsByName("paymethod");
		  
		  for(var i = 0; i <= pm.length; i++){
			  if(pm[i].checked){
			  console.log(i)
				  if(i == 5){
					  document.getElementById("cashReceipt2").checked = "checked";
					  document.getElementById("user1").checked = "checked";
					  document.getElementById("receipt-user").style.display="none";
					  document.getElementById("receipt-phone").style.display="none";
					  document.getElementById("receipt-company").style.display="none";
				  }
			  	  
			  	 /*  if(i == 6){
			  		document.getElementById("phone").style.display="block";
			  	  } */
			  	  
				  document.getElementById(pm[i].value).style.display="block";
			  }else{
				  document.getElementById(pm[i].value).style.display="none";
			  } 
		  }
	 }

		/* var ms = document.getElementById('message');
		var selectedphone = document.getElementById("phone");
	    
	    // 선택한 option의 value, 텍스트
	    var optionVal = selectedElement.options[selectedElement.selectedIndex].value;
	    var optionTxt = selectedElement.options[selectedElement.selectedIndex].text;
	    
	    var optionVal2 = selectedphone.options[selectedphone.selectedIndex].value;
	    var optionTxt2 = selectedphone.options[selectedphone.selectedIndex].text; */
	    
	/* 배송 요청사항 직접입력 */
	function message(){
		var selectedElement = document.getElementById("message-select");
		var selectedValue = selectedElement.options[selectedElement.selectedIndex].value;
		if(selectedValue == '6'){
			document.getElementById("message").style.display="block";
		}else if(selectedValue != '6'){
			document.getElementById("message").style.display="none";
		}
	}
	
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    /* if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr; */
                
                } /* else {
                    document.getElementById("sample2_extraAddress").value = '';
                } */

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                /* document.getElementById("sample2_detailAddress").focus(); */

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 400; //우편번호서비스가 들어갈 element의 width
        var height = 500; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 2; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<%@ include file="../inc/footer.jsp" %>