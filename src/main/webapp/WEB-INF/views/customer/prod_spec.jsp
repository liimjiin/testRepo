<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<main style="width:1000px; margin:auto;">
	<section class="mt-4">
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach var="dto" items="${list}">
			<div class="col">
		    	<div class="card h-100 text-center border-light">
		    		<a href="<c:url value='pd_view?pNo=${dto.pNo}'/>">
			      		<img src="prod_img/${dto.pImage_1}" class="card-img-top">		    		
		    		</a>
		      		<div class="card-body">
			        	<h4 class="card-title">${dto.pName}</h4>
			        	<h5 class="card-text"><fmt:formatNumber value="${dto.price}"/>원</h5>
		      		</div>
   					<a href="#" class="btn btn-outline-success">장바구니 담기</a>
		    	</div>
		  	</div>
		  	</c:forEach>
		</div>
	</section>
</main>
<script>
	function showMsg(){
		alert("로그인이 필요합니다.")
	}
</script>
<%@ include file="../inc/footer.jsp" %>