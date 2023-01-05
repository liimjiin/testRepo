<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<main>
	<div class="container d-flex justify-content-between mt-5">
		<a href="prod_all.do" class="btn btn-outline-secondary" 
			style="width:150px; height:50px; line-height:35px">전체</a>
		<a href="prod_cat.do?catCode=W100&catName=면도용품" class="btn btn-outline-secondary" 
			style="width:150px; height:50px; line-height:35px">면도용품</a>
		<a href="prod_cat.do?catCode=O200" class="btn btn-outline-secondary" 
			style="width:150px; height:50px; line-height:35px">스킨케어</a>
		<a href="prod_cat.do?catCode=H300&catName=두피케어" class="btn btn-outline-secondary" 
			style="width:150px; height:50px; line-height:35px">두피케어</a>
		<a href="prod_cat.do?catCode=H400&catName=영양제" class="btn btn-outline-secondary" 
			style="width:150px; height:50px; line-height:35px">영양제</a>
		<a href="prod_cat.do?catCode=P500&catName=덴탈케어" class="btn btn-outline-secondary" 
			style="width:150px; height:50px; line-height:35px">덴탈케어</a>
	</div>
	<div class="container d-flex justify-content-between mt-3">
		<a href="prod_cat.do?catCode=F600&catName=바디케어" class="btn btn-outline-secondary" 
			style="width:150px; height:50px; line-height:35px">바디케어</a>
		<a href="prod_cat.do?catCode=R700&catName=여성용품" class="btn btn-outline-secondary" 
			style="width:150px; height:50px; line-height:35px">여성용품</a>
		<a href="prod_cat.do?catCode=B800&catName=주방/청소용품" class="btn btn-outline-secondary" 
			style="width:150px; height:50px; line-height:35px">주방/청소용품</a>
		<a href="prod_cat.do?catCode=K900&catName=물티슈/휴지류" class="btn btn-outline-secondary" 
			style="width:150px; height:50px; line-height:35px">물티슈/휴지류</a>
		<a href="prod_cat.do?catCode=O110&catName=욕실용품" class="btn btn-outline-secondary" 
			style="width:150px; height:50px; line-height:35px">욕실용품</a>
		<a href="prod_cat.do?catCode=E120&catName=식품보관" class="btn btn-outline-secondary" 
			style="width:150px; height:50px; line-height:35px">식품보관</a>
	</div>
		
	<section class="container mt-5 mb-5">
		<hr>
		<div class="d-flex mt-5">
		<c:set var="cnt" value="0"/>
		<c:forEach var="pDto" items="${pDtos}">
			<c:set var="cnt" value="${cnt+1}"/>
			<c:if test="${cnt%6 != 0}">
				<div class="card" style="width:238px; <c:if test="${cnt%6 != 0}">margin-right:20px;</c:if>">
					<a href="${ctx}/customer/prod_view.jsp?pNum=${pDto.pNum}&pSpec=${pDto.pSpec}" style="overflow:hidden; height:250px;">
				    	<img class="card-img-top" src="${ctx}/uploadedFile/${pDto.pImage}" alt="Card image" style="width:100%;">
				    </a>
				    <div class="card-body">
				    	<h4 class="card-title" style="font-size:14px; text-align:center; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${pDto.pName}</h4>
				    	<p class="card-text" style="text-align:center;"><b><fmt:formatNumber value="${pDto.price}"/>원</b></p>
				    </div>
				 </div>
			 </c:if>
			 <c:if test="${cnt%6 == 0}">
			 	</div><div class='d-flex mt-4'>
			 </c:if>
		</c:forEach>
		</div>
	</section>
</main>
<%@ include file="../inc/footer.jsp" %>