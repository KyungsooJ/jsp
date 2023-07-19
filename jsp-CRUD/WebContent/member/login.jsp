<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<main>
	<h3>로그인</h3>
	
	<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST">
			<p><input type="text" name="userid" placeholder="ID" value="${cookie.userid.value }"
				      required autofocus></p>
			<p><input type="password" name="userpw" placeholder="Password" required></p>
			<p><label><input type="checkbox" name="storeId"
						${not empty cookie.userid ? 'checked' : '' }>ID 저장</label></p>
			<p><input type="submit" value="로그인"></p>
		</form>
		<div>
			<a href="${cpath }/member/join.jsp">아직 회원이 아니십니까</a>
		</div>
	</c:if>
	
	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="user" class="member.MemberDTO" />
		<jsp:setProperty property="*" name="user" />
		<c:set var="login" value="${memberDAO.login(user) }" scope="session" />
		<%
			boolean flag1 = session.getAttribute("login") != null;
			boolean flag2 = request.getParameter("storeId") != null;
			
			Cookie c = new Cookie("userid", user.getUserid());
			c.setMaxAge(flag1 && flag2 ? 60 * 60 * 24 * 7 : 0);
			response.addCookie(c);
		%>
		<c:redirect url="/" />
	</c:if>
</main>

</body>
</html>