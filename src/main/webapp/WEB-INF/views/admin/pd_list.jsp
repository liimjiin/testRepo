<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<main>
<c:if test="${requestScope.msg != null}">
	<script>
		alert("${msg}");
	</script>
</c:if>
	<div class="container w-75 border shadow-sm p-5 mt-5">
		<div class="container d-flex justify-content-between mb-3">
			<h3>상품관리</h3>
			<a href="<c:url value='pd_input'/>" class="btn btn-outline-secondary">상품 추가</a>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>제조사</th>
					<th>상품명</th>
					<th>이미지</th>
					<th>가격</th>
					<th>수량</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.pCompany}</td>
					<td>${dto.pName}</td>
					<td>
						<img src="prod_img/${dto.pImage_1}" style="width:50px; height:50px;"/>
					</td>
					<td><fmt:formatNumber value="${dto.price}"/></td>
					<td>${dto.pQty}</td>
					<td>
						<input type="button" value="수정" class="btn btn-warning btn-sm"
						onclick="infoProduct(${dto.pNo})"/>
						<input type="button" value="삭제" class="btn btn-danger btn-sm"
						onclick="delProduct(${dto.pNo})"/>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</main>
<script type="text/javascript">
	function infoProduct(pNo){
		location.href="<c:url value='pd_info?pNo='/>" + pNo;
	}
	
	function delProduct(pNo){
		location.href="<c:url value='pd_delete?pNo='/>"+pNo;
	}
</script>
<%@ include file="../inc/footer.jsp" %>