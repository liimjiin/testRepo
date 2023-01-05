<%@ page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<style>
/* The checkboxs */
.checkboxs {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
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
</style>
<main>
<c:if test="${requestScope.msg != null}">
<script>
	alert("${requestScope.msg}");
</script>
</c:if>
	<h2 class="text-center mb-5 mt-5">장바구니</h2>
	<div class="container" style="width:980px; padding: 0">
			<label class="checkboxs">전체선택(0/0)
			<input type="checkbox" checked="checked" style="margin-bottom: 20px; margin-right:10px;">
			<span class="checkmark"></span><span><a>| 선택삭제</a></span></label> 
			
			<div style="display: flex;">
			<!-- 장바구니 목록 -->
				<div style="width:660px; margin-right: 20px; border-top: 1px; border-top-style: solid; border-top-color: black">
					<div style="margin-top:10px; display: flex; justify-content: space-between; align-items:center; height:130px;
								border-bottom: 1px; border-bottom-style: solid; border-bottom-color: #FBFAFA; margin-bottom: 10px">
						<div>
							<label class="checkboxs">
							<input type="checkbox" checked="checked">
							<span class="checkmark"></span></label> 
						</div>
						<div>
							<img src="prod_img/${dto.pImage_1}" style="width:100px;"/>
						</div>
						<div>
							<span>도톰한 물티슈 100매 X 10팩</span>
						</div>
						<!-- 수량 수정 -->
						<div style="position: relative; width: 90px; display: flex; border:1px; border-color: gray; border-style: solid; box-sizing: border-box;">
							<input type='button' onclick='count("plus")' value='+' style='width: 30px; background: white; border: 1px solid #bbb; border-radius: 0px; padding: 5px 7px; border: none;'/>
							<div id='result' style='background: white; text-align:center; display:block; width: 30px; right: 12px; margin: 0; padding: 5px 7px; '>1</div>
							<input type='button' onclick='count("minus")' value='-' style='width: 30px; background: white; border: 1px solid #bbb; border-radius: 0px; padding: 5px 7px; border: none;'/>
						</div>   
						   
						<div>
							<span><fmt:formatNumber type="Number" value="${cartTotPrice}"/>원</span>
						</div>
						<div>
							<span><i class="xi-close-thin"></i></span>
						</div>
					</div>
					
				<!-- 장바구니 목록 하단 합계금액 -->
				<div style="width:660px; height:65px; background: #FBFAFA">
					<div style="margin-left:250px; padding-top:20px">
						<span>상품가격 </span>
						<span><fmt:formatNumber type="Number" value="20000"/>원</span>
						<span>+ 배송비 </span>
						<span><fmt:formatNumber type="Number" value="3000"/>원</span>
						<span> = </span>
						<span><fmt:formatNumber type="Number" value="23000"/>원</span>
					</div>
					
					
				</div>
				</div>
					
				<!-- 장바구니 금액 표시 -->	
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
				<!-- 구매하기 버튼 -->
				<button style="width:300px; padding:15px; border-radius: 5px; background-color: #00388c; border:none;
								color:white; margin-top: 20px;">구매하기</button>
				</div>
			</div><!-- 목록, 금액, 구매하기버튼 -->
			<div style="width:980px; height:180px; background-color: #FBFAFA;">
				<div style="padding: 40px;">
					<h5><i class="fa-solid fa-circle-exclamation" style="color:#00388c"></i> 무료배송 대신, 더 낮은 가격</h5>
						<span>· 12월 12일부터 모든 제품 가격을 평균 17% 내립니다.</span><br>
						<span>· 3만원 이상 조건부 무료배송은 사라지지만 구매 시 누리는 혜택은 더 커졌습니다.</span><br>
						<span>· 와이즐리의 모든 제품, 더욱 놀라운 가격으로 만나보세요.</span>
				</div>
			</div>
			
			
			<%-- <c:if test="${requestScope.pDtos == null || requestScope.pDtos.size() == 0}">
				<div class="text-center mt-5">
					<img src="../views/img/cart_list/emptyBox.png" style="width:200px;"/>
					<div class="text-center mt-3 mb-5" style="font-size:22px; color:#838383;">담은 상품이 없습니다 :(</div>
				</div>
			</c:if>
			<c:if test="${requestScope.pDtos != null || requestScope.pDtos.size() != 0}">
				<table class="table">
					<tbody>
					<c:set var="cartTotPrice" value="0"/>
					<c:set var="cartTotPoint" value="0"/>
					<c:forEach var="pDto" items="${pDtos}">
						<tr>
							<td>
								<a href="prodView.do?pNum=${pDto.pNum}&pSpec=${pDto.pSpec}">
								<img src="${ctx}/uploadedFile/${pDto.pImage}" width="80px"/>
								</a>
							</td>
							<td>${pDto.pName}</td> 
							<td>
								<form action="cartModify.do" method="post">
									<input type="text" size="3" name="pQty" value="${pDto.pQty}"/>개<br/>
									<input type="hidden" name="pNum" value="${pDto.pNum}"/>
									<input type="submit" class="btn btn-sm btn-secondary mt-3" value="수정"/>
								</form>
							</td>
							<td>
								<fmt:formatNumber type="Number" value="${pDto.price}"/>원<br/>
							</td>
							<td>
								<fmt:formatNumber type="Number" value="${pDto.totPrice}"/>원<br/>
							</td>
							<td>
								<a href="cartDelete.do?pNum=${pDto.pNum}" class="btn btn-sm btn-danger">삭제</a>
							</td>
						</tr>
						<c:set var="cartTotPrice" value="${cartTotPrice + pDto.totPrice}"/>
						<c:set var="cartTotPoint" value="${cartTotPoint + pDto.totPoint}"/>
					</c:forEach>
					</tbody>
				</table>
				<!-- 장바구니 총액 표시 -->
				<div class="text-center mt-5">
					<a href="${ctx}/prod_all.do" class="btn btn-lg btn-outline-dark me-2" style="width:200px; height:50px;">더 담으러 가기</a>
					<a href="checkOut.do?cartTotPrice=${cartTotPrice}&cartTotPoint=${cartTotPoint}" class="btn btn-lg btn-dark" style="width:200px; height:50px;">구매하기</a>
				</div>
			</c:if>	 --%>
	</div>
</main>
<script>
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('result');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus' && number > 1)  {
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	}
</script>
<%@ include file="../inc/footer.jsp" %>