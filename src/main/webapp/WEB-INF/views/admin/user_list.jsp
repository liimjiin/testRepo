<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<main>
<div class="container w-75 border shadow-sm p-5 mt-5">
	<h3>회원관리</h3>
	<table class="table">
		<thead>
			<tr>
				<th>이름</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody>
		<%-- <%
			MemberDAO dao = MemberDAO.getInstance();
			ArrayList<MemberDTO> dtos = dao.memberList();
			
			for(int i=0; i<dtos.size(); i++){
				MemberDTO dto = dtos.get(i);
		%>
			<tr>
				<td><%= dto.getEmail() %></td>
				<td><%= dto.getPw() %></td>
				<td><%= dto.getTel() %></td>
				<td><%= dto.getBirth() %></td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getGender() %></td>
			</tr>
		<%  } // for %> --%>
		</tbody>
	</table>
</div>
</main>
<%@ include file="../inc/footer.jsp" %>