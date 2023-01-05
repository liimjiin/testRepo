<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<main>
<div class="container w-50 border shadow-sm p-5 mt-5">
	<h3>카테고리 등록</h3>
	<form action="<c:url value='cat_insert'/>" method="post" name="cat_inputFrm">
		<div class="mt-3">
			<label for="catMajor">대분류</label>
			<input type="text" class="form-control" id="catMajor" placeholder="카테고리 대분류를 입력하세요" name="catMajor"/>
		</div>
		<div class="mt-3">
			<label for="catMinor">소분류</label>
			<input type="text" class="form-control" id="catMinor" placeholder="카테고리 소분류를 입력하세요" name="catMinor"/>
		</div>
		<div class="text-center mt-3">
			<input type="button" class="btn btn-primary btn-sm" value="등록" onclick="inputCheck()"/>
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
</script>
<%@ include file="../inc/footer.jsp" %>