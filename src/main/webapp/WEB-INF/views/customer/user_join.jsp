<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<script src="../js/validChk.js"></script>
<main>
	<div class="container mt-5 border shadow p-5" style="width:600px; height:750px;">
		<h3 class="text-center">회원가입</h3>
		<form action="${ctx}/user_joinOk.do" method="post" name="joinForm">
			<div class="mt-4 mb-4">
				<label for="email" style="font-size:12px; color:#838383;">아이디</label>
				<input type="text" class="form-control mt-2" id="email" placeholder="이메일을 입력하세요." name="email"/>
			</div>
			<div class="mb-4" style="font-size:12px; color:#838383;">
				<label for="pw">비밀번호</label>
				<input type="password" class="form-control mt-2" id="pw" placeholder="6자 이상" name="pw"/>
			</div>
			<div class="mb-4" style="font-size:12px; color:#838383;">
				<label for="tel">휴대폰</label>
				<input type="text" class="form-control mt-2" id="tel" placeholder="휴대폰 번호('-'제외)" name="tel"/>
			</div>
			<div class="mb-4" style="font-size:12px; color:#838383;">
				<label for="birth">생년월일</label>
				<input type="text" class="form-control mt-2" id="birth" placeholder="예: 930422" name="birth"/>
			</div>
			<div class="mb-4" style="font-size:12px; color:#838383;">
				<label for="name">이름</label>
				<input type="text" class="form-control mt-2" id="name" placeholder="이름을 입력하세요." name="name"/>
			</div>
			<div class="mb-4">
				<label for="gender" style="font-size:12px; color:#838383;">성별</label>
				<div class="container d-flex mt-2">
					<label class="form-check-label me-3" for="male">
						<input class="form-check-input" type="radio" name="gender" id="male" style="margin-right:7px;" checked/>남자
					</label>
					<label class="form-check-label me-3" for="female">
						<input class="form-check-input" type="radio" name="gender" id="female" style="margin-right:7px;"/>여자
					</label>	
				</div>
			</div>
			<div class="d-grid gap-2 text-center">
				<input type="button" class="btn btn-lg btn-dark mt-3" value="가입완료" style="background:#00388C; border-color:#00388C;" onclick="inputChk()"/>
			</div>
		</form>
	</div>
</main>
<%@ include file="../inc/footer.jsp" %>