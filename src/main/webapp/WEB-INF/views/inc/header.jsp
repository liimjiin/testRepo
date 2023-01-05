<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="css/header.css">
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js'></script>
</head>
<body>
<header>
    <section class="navbar navbar-expand">
    	<ul class="navbar-nav w-100">
	        <c:if test="${sessionScope.userName == null && sessionScope.adminName == null}">
	        	<li class="nav-item ms-auto" style="margin-right:20px;">
	        		<a href="<c:url value='user_join'/>" class="nav-link" style="color:#00388C">회원가입</a>
	        	</li>
	        	<li class="nav-item" style="margin-right:20px;">
	        		<a href="<c:url value='user_login'/>" class="nav-link">로그인</a>
	        	</li>
	        	<li class="nav-item" style="margin-right:40px;">
	        		<a href="<c:url value='/'/>" class="nav-link">고객센터</a>
	        	</li>
        	</c:if>
    		<c:if test="${sessionScope.adminName != null}">
	        	<li class="nav-item ms-auto" style="margin-right:20px;">
	          		<a href="<c:url value='user_list'/>" class="nav-link">회원관리</a>
	        	</li>
	        	<li class="nav-item" style="margin-right:20px;">
	          		<a href="<c:url value='cat_list'/>" class="nav-link">카테고리관리</a>
	        	</li>
	        	<li class="nav-item" style="margin-right:20px;">
	          		<a href="<c:url value='pd_list'/>" class="nav-link">상품관리</a>
	        	</li>
	        	<li class="nav-item" style="margin-right:40px;">
	        		<a href="<c:url value='ad_logoutOK'/>" class="nav-link">로그아웃</a>
	        	</li>
        	</c:if>
        	<c:if test="${sessionScope.userName != null}">
        		<li class="nav-item" style="margin-right:20px;">
	        		<a href="<c:url value='/'/>" class="nav-link" style="color:#00388C">마이페이지</a>
	        	</li>
	        	<li class="nav-item" style="margin-right:20px;">
	        		<a href="<c:url value='/'/>" class="nav-link">로그아웃</a>
	        	</li>
	        	<li class="nav-item" style="margin-right:40px;">
	        		<a href="<c:url value='/'/>" class="nav-link">고객센터</a>
	        	</li>
        	</c:if>
    	</ul>
    </section>
	<section class="navbar navbar-expand ms-5 mb-3">
		<div class="container d-flex justify-content-between">
			<div>
		    	<a href="<c:url value='/'/>" class="navbar-brand" style="font-weight:600; font-size:30px; color:#00388C">W I S E L Y</a>
			</div>
	    	<form id="searchForm" method="post" action="list.do">
				<div class="d-flex">
					<input class="form-control form-control-lg rounded-0 rounded-start" type="text" id="keyWord" name="keyWord" 
						style="width:350px; border-color:#00388C;" value="${pDto.keyWord}"/>
					<button class="btn rounded-0 rounded-end" style="width:60px; background:#00388C; color:white;">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</form>
			<div>
				<a href="<c:url value='cart_list'/>" class="me-5" style="margin-left:80px;">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#555" class="bi bi-cart3" viewBox="0 0 16 16">
						<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
					</svg>
				</a>
			</div>
		</div>
	</section>
	<section class="navbar navbar-expand ms-5 mb-2">
		<div class="container d-flex justify-content-between">
			<div class="dropdown-center" style="margin-left:50px;">
				<a class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
					style="font-weight:600; font-size:18px; color:black;">카테고리</a>
			  	<ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="#">전체보기</a></li>
				    <li><a class="dropdown-item" href="#">영양제</a></li>
				    <li><a class="dropdown-item" href="#">면도/제모용품</a></li>
				    <li><a class="dropdown-item" href="#">스킨케어</a></li>
				    <li><a class="dropdown-item" href="#">헤어케어</a></li>
				    <li><a class="dropdown-item" href="#">덴탈케어</a></li>
				    <li><a class="dropdown-item" href="#">바디케어</a></li>
				    <li><a class="dropdown-item" href="#">휴지/물티슈</a></li>
				    <li><a class="dropdown-item" href="#">생리대/여성용품</a></li>
				    <li><a class="dropdown-item" href="#">주방/청소용품</a></li>
				    <li><a class="dropdown-item" href="#">식품보관</a></li>
				    <li><a class="dropdown-item" href="#">욕실용품</a></li>
			  	</ul>
			</div>
			<div>
		    	<a href="<c:url value='/'/>" class="navbar-brand me-5" style="font-weight:600; font-size:20px; color:black;">추천</a>
		    	<a href="<c:url value='pd_spec?pSpec=new'/>" class="navbar-brand me-5" style="font-weight:600; font-size:20px; color:black;">신제품</a>
		    	<a href="<c:url value='pd_spec?pSpec=best'/>" class="navbar-brand" style="font-weight:600; font-size:20px; color:black;">베스트</a>
			</div>
			<div style="margin-left:120px;">
			
			</div>
		</div>
	</section>
</header>