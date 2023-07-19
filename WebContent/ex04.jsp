<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>

<h1>쿠키를 이용한 입력값 기억하기</h1>
<hr>

<form method="POST">
	<input type="text" name="username" placeholder="이름 입력"
			value="${URLDecoder.decode(cookie.username.value) }">
	<input type="submit">
	<input type="button" value="쿠키 확인" onclick="alert(document.cookie)">
	<a href="ex04_delete.jsp"><input type="button" value="쿠키 삭제"></a>
</form>

<%
	if(request.getMethod().equals("POST")) {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		username = URLEncoder.encode(username, "UTF-8");
		Cookie c = new Cookie("username", username);
		c.setMaxAge(600);	// 600초, 10분
		response.addCookie(c);
		response.sendRedirect("ex04.jsp");
	}
%>
</body>
</html>