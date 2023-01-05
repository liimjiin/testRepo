<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<main>
	<section class="container mb-5">
		<ul class="d-flex p-0 justify-content-center mt-5" style="list-style:none;">
			<!-- 상품 이미지 -->
			<li class="me-5">
				<img src="prod_img/${dto.pImage_1}" width="400px"/>
			</li>
			<!-- 상품 상세내용 -->
			<li>
				<form name="prodForm" method="post" style="width:400px; height:400px;">
					<input type="hidden" name="pSpec" value="${dto.pSpec}"/>
					<div class="mt-5" style="color:#58c3cc"><b>${dto.pCompany}</b></div><br/>
					<h2 class="mt-1" style="letter-spacing:0.03em"><b>[${dto.pName}]</b></h2><br/>
					<div style="color:#838383">${dto.pContent}</div><br/>
					<div class="mt-2">
						<h4><fmt:formatNumber value="${dto.price}"/>원</h4><br/>
						<!-- 수량 수정 -->
						<div style="position: relative; width: 90px; display: flex; border:1px; border-color: gray; border-style: solid; box-sizing: border-box;">
							<input type='button' onclick='count("plus")' value='+' style='width: 30px; background: white; border: 1px solid #bbb; border-radius: 0px; padding: 5px 7px; border: none;'/>
							<div id='prodCount' class="prodCount" style='background: white; text-align:center; display:block; width: 30px; right: 12px; margin: 0; padding: 5px 7px;'>1</div>
							<input type='button' onclick='count("minus")' value='-' style='width: 30px; background: white; border: 1px solid #bbb; border-radius: 0px; padding: 5px 7px; border: none;'/>
						</div> 
					</div>
					<div class="d-flex mt-3">
						<!-- 로그인 사용자만 장바구니 담기 허용 -->
						<%-- <c:if test="${sessionScope.userName !=null}">
							<a href="cartAdd" class="btn btn-lg btn-outline-success">장바구니 담기</a>
						</c:if> --%>
						<!-- 로그인을 안했을 경우 -->					
						<c:if test="${sessionScope.userName ==null}">
							<!-- <a href="javascript:showMsg()" class="btn btn-lg btn-outline-success">장바구니 담기</a> -->
							<%-- <a href="cartAdd?pNo=${dto.pNo}" class="btn btn-lg btn-outline-success">장바구니 담기</a> --%>
							<a href="javascript:goCart(${dto.pNo})" class="btn btn-lg btn-outline-success">장바구니 담기</a>
						</c:if>
						<a href="javascript:history.back()" class="btn btn-lg btn-outline-primary ms-3">계속 쇼핑하기</a>
					</div>
				</form>
			</li>
		</ul>
		<hr>
	</section>
	<section class="container">
		<h4 class="d-flex justify-content-start ms-4 mt-5">[배송 안내]</h4>
		<ul class="justify-content-start mt-4 ms-5">
			<li class="mt-2">배송 방법: HY 프레딧 배송, 택배 배송</li>
			<li class="mt-2">배송 지역: 전국</li>
			<li class="mt-2">배송 비용: 2,500원 (30,000원 이상 구매 시 무료배송)</li>
			<li class="mt-2">제주 및 도서산간 추가 배송비: 3,000원</li>
			<li class="mt-2">배송 예정일: 평일 기준 출고 후 1~2일 소요 (관할 지역 택배사 사정에 따라 추가 소요될 수 있음)</li>
			<li class="mt-2">천재지변, 물량 급증, 수급 변동 등 예외적인 사유 발생 시 배송이 지연될 수 있는 점 양해 부탁드립니다.</li>
			<li class="mt-2">군부대 일부와 해외의 경우 배송이 어려울 수 있습니다.</li>
			<li class="mt-2">평일 낮 12시 이전 결제 시: 당일 출고 (주말 및 공휴일 제외)</li>
			<li class="mt-2">평일 낮 12시 이후 결제 시: 다음 날 출고 (주말 및 공휴일 제외)</li>
		</ul>
		<h4 class="d-flex justify-content-start ms-4 mt-5">[교환, 반품 안내]</h4>
		<ul class="justify-content-start mt-4 ms-5">
			<li class="mt-2">단순 변심에 의한 교환/반품은 제품 수령 후 7일까지 가능하며 왕복 배송비는 고객 부담입니다.</li>
			<li class="mt-2">상세주소 미입력, 주소지 오기재 등으로 인해 상품이 반송될 경우 왕복 배송비는 고객 부담입니다.</li>
			<li class="mt-2">고객 사유로 인한 교환/반품/반송 시 왕복 배송비 5,000원이 발생하며 제주 및 도서산간지역의 경우 실제 왕복 배송비가 부과됩니다.</li>
			<li class="mt-2">상품 불량 및 오배송 등으로 인한 판매자 귀책사유가 있을 경우 교환/반품 배송비는 와이즐리 컴퍼니가 부담합니다.</li>
		</ul>
		<h4 class="d-flex justify-content-start ms-4 mt-5">[교환, 반품 제한사항]</h4>
		<ul class="justify-content-start mt-4 ms-5">
			<li class="mt-2">고객의 사용, 시간경과, 제품 일 소비에 의해 상품의 가치가 현저히 감소한 경우</li>
			<li class="mt-2">구성품의 분실, 누락 및 파손 혹은 포장이 훼손되어 상품의 가치가 현저히 감소한 경우</li>
		</ul>
		<hr class="mt-5 mb-5">
	</section>
</main>
<script>
	 function goCart(pNo){
		document.prodForm.action="cartAdd?pNo="+pNo;
		document.prodForm.submit();
		cartAlert(result);
 		
	}

	/*  function cartAlert(result){
		 if(result == '0'){
				alert("장바구니에 추가하지 못했습니다.");
			}else if(result == '1'){
				alert("장바구니에 추가되었습니다.");	
			}else if(result == '2'){
				alert("장바구니에 동일한 상품이 있습니다.");
	 		}
	} */

	/* const form = {
		    memNo : '${member.memNo}' 
			pNo : '${product.pNo}'
			prodCount : '1'
	}*/
			
/* 	$(".btn-outline-success").on("click",function(e){
			form.prodCount = $(".quantity_input").val();
			$.ajax({
				url: 'cartAdd',
				type: 'POST',
				data: form,
				success: function(result){
					cartAlert(result);
				} 
			 }) 
		});
	 */
	
	function showMsg(){
		alert("로그인이 필요합니다.")
	}
	
	// 수량
	function count(type)  {
		  // 결과를 표시할 element
		  const resultElement = document.getElementById('prodCount');
		  
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
		  
		  $(".btn-outline-success").on("click",function(e){
				form.prodCount = $(".prodCount").innerText;
				$.ajax({
					url: 'cartAdd',
					type: 'POST',
					data: form,
					success: function(result){
						cartAlert(result);
					} 
				 }) 
			});
		}
</script>
<%@ include file="../inc/footer.jsp" %>