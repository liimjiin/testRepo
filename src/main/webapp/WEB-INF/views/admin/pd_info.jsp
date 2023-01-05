<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<main>
<div class="container w-50 border shadow-sm p-5 mt-5">
	<h3>상품 수정</h3>
	<form action="<c:url value='pd_update'/>" method="post" enctype="multipart/form-data">
		<table class="table table-borderless">
			<tbody>
				<tr>
					<td>카테고리</td>
					<td>
						<input type="text" class="form-control form-control-sm" value="${pd_dto.pCategory_fk}" name="pCategory_fk" readonly/>
					</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input type="text" class="form-control form-control-sm" value="${pd_dto.pName}" name="pName"/></td>
				</tr>
				<tr>
					<td>제조회사</td>
					<td><input type="text" class="form-control form-control-sm" value="${pd_dto.pCompany}" name="pCompany"/></td>
				</tr>
				<tr>
					<td>상품이미지</td>
					<td>
						<img src="prod_img/${pd_dto.pImage_1}" style="margin-bottom:10px; width:200px;"/>
						<input type="file" class="form-control form-control-sm" name="pImage_1"/>
						<!-- 이미지를 수정하지 않고 그대로 사용할 경우 -->
						<input type="hidden" class="form-control form-control-sm" 
						name="pImage_1Old" value="${pd_dto.pImage_1}"/>
					</td>
				</tr>
				<tr>
					<td>상세정보</td>
					<td>
						<input type="file" class="form-control form-control-sm" name="pImage_2"/>
						<!-- 이미지를 수정하지 않고 그대로 사용할 경우 -->
						<input type="hidden" class="form-control form-control-sm" 
						name="pImage_2Old" value="${pd_dto.pImage_2}"/>
					</td>
				</tr>
				<tr>
					<td>상품수량</td>
					<td><input type="text" class="form-control form-control-sm" value="${pd_dto.pQty}" name="pQty"/></td>
				</tr>
				<tr>
					<td>상품가격</td>
					<td><input type="text" class="form-control form-control-sm" value="${pd_dto.price}" name="price"/></td>
				</tr>
				<tr>
					<td>상품사양</td>
					<td>
						<c:if test="${pd_dto.pSpec == 'none'}">
						<select class="form-select form-select-sm" name="pSpec">
							<option value="none" selected>일반</option>
							<option value="new">신제품</option>
							<option value="best">베스트</option>
							<option value="recommend_1">새해를 건강하게 시작하세요!</option>
							<option value="recommend_2">이런 가격은 처음이시죠?</option>
							<option value="recommend_3">후기가 칭찬하는 새 제품</option>
							<option value="recommend_4">꾸준히 찾아주시는 장바구니 단골 제품</option>
						</select>
						</c:if>
						<c:if test="${pd_dto.pSpec == 'new'}">
						<select class="form-select form-select-sm" name="pSpec">
							<option value="none">일반</option>
							<option value="new" selected>신제품</option>
							<option value="best">베스트</option>
							<option value="recommend_1">새해를 건강하게 시작하세요!</option>
							<option value="recommend_2">이런 가격은 처음이시죠?</option>
							<option value="recommend_3">후기가 칭찬하는 새 제품</option>
							<option value="recommend_4">꾸준히 찾아주시는 장바구니 단골 제품</option>
						</select>
						</c:if>
						<c:if test="${pd_dto.pSpec == 'best'}">
						<select class="form-select form-select-sm" name="pSpec">
							<option value="none">일반</option>
							<option value="new">신제품</option>
							<option value="best" selected>베스트</option>
							<option value="recommend_1">새해를 건강하게 시작하세요!</option>
							<option value="recommend_2">이런 가격은 처음이시죠?</option>
							<option value="recommend_3">후기가 칭찬하는 새 제품</option>
							<option value="recommend_4">꾸준히 찾아주시는 장바구니 단골 제품</option>
						</select>
						</c:if>
						<c:if test="${pd_dto.pSpec == 'recommend_1'}">
						<select class="form-select form-select-sm" name="pSpec">
							<option value="none">일반</option>
							<option value="new">신제품</option>
							<option value="best">베스트</option>
							<option value="recommend_1" selected>새해를 건강하게 시작하세요!</option>
							<option value="recommend_2">이런 가격은 처음이시죠?</option>
							<option value="recommend_3">후기가 칭찬하는 새 제품</option>
							<option value="recommend_4">꾸준히 찾아주시는 장바구니 단골 제품</option>
						</select>
						</c:if>
						<c:if test="${pd_dto.pSpec == 'recommend_2'}">
						<select class="form-select form-select-sm" name="pSpec">
							<option value="none">일반</option>
							<option value="new">신제품</option>
							<option value="best">베스트</option>
							<option value="recommend_1">새해를 건강하게 시작하세요!</option>
							<option value="recommend_2" selected>이런 가격은 처음이시죠?</option>
							<option value="recommend_3">후기가 칭찬하는 새 제품</option>
							<option value="recommend_4">꾸준히 찾아주시는 장바구니 단골 제품</option>
						</select>
						</c:if>
						<c:if test="${pd_dto.pSpec == 'recommend_3'}">
						<select class="form-select form-select-sm" name="pSpec">
							<option value="none">일반</option>
							<option value="new">신제품</option>
							<option value="best">베스트</option>
							<option value="recommend_1">새해를 건강하게 시작하세요!</option>
							<option value="recommend_2">이런 가격은 처음이시죠?</option>
							<option value="recommend_3" selected>후기가 칭찬하는 새 제품</option>
							<option value="recommend_4">꾸준히 찾아주시는 장바구니 단골 제품</option>
						</select>
						</c:if>
						<c:if test="${pd_dto.pSpec == 'recommend_4'}">
						<select class="form-select form-select-sm" name="pSpec">
							<option value="none">일반</option>
							<option value="new">신제품</option>
							<option value="best">베스트</option>
							<option value="recommend_1">새해를 건강하게 시작하세요!</option>
							<option value="recommend_2">이런 가격은 처음이시죠?</option>
							<option value="recommend_3">후기가 칭찬하는 새 제품</option>
							<option value="recommend_4" selected>꾸준히 찾아주시는 장바구니 단골 제품</option>
						</select>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>상품소개</td>
					<td>
						<textarea class="form-control" name="pContent" rows="3">${pd_dto.pContent}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<input type="submit" class="btn btn-sm btn-warning" value="수정"/>	
						<a href="pd_list" class="btn btn-secondary btn-sm">취소</a>
					</td>
				</tr>
			</tbody>			
		</table>	
	</form>
</div>
</main>
<%@ include file="../inc/footer.jsp" %>