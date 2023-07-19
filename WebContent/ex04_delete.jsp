<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.delete.jsp</title>
</head>
<body>
<%
	Cookie c = new Cookie("username", null);
c.setMaxAge(0);
response.addCookie(c);
response.sendRedirect("ex04.jsp");
%>
</body>
</html>