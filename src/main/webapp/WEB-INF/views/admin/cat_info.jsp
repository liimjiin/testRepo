<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<main>
<div class="container w-50 border shadow-sm p-5 mt-5">
	<h3>카테고리 수정</h3>
	<form action="<c:url value='cat_update'/>" method="post" name="cat_inputFrm">
		<input type='hidden' name='catNo' value='${dto.catNo}'/>
		<div class="mt-3">
			<label for="catMajor">대분류</label>
			<input type="text" class="form-control" id="catMajor" value='${dto.catMajor}' name="catMajor"/>
		</div>
		<div class="mt-3">
			<label for="catMinor">소분류</label>
			<input type="text" class="form-control" id="catMinor" value='${dto.catMinor}' name="catMinor"/>
		</div>
		<div class="text-center mt-3">
			<input type="button" class="btn btn-warning btn-sm" value="수정" onclick="inputCheck()"/>
			<a href="cat_list" class="btn btn-secondary btn-sm">취소</a>
		</div>
	</form>
</div>
</main>
<script>
	function inputCheck(){
		if(!cat_inputFrm.catMajor.value) { // code의 값이 null이면 참
			alert("카테고리 대분류를 입력하세요!!!")
			cat_inputFrm.catMajor.focus();
			return;
		}
		
		document.cat_inputFrm.submit();
	}
	function 
</script>
<%@ include file="../inc/footer.jsp" %>