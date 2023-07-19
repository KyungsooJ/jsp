<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03_cookie_delete.jsp</title>
</head>
<body>

<%
	Cookie c1 = new Cookie("ipaddr", null);	// 삭제할 예정이므로 값은 아무거나 상관없다
	Cookie c2 = new Cookie("lmt", "");		// 이전 쿠키와 일치하는 이름을 지정해야 한다
	
	c1.setMaxAge(0);	// 쿠키의 유효시간을 0으로 만들어준다
	c2.setMaxAge(0);	// 남은 시간이 0이면 브라우저가 쿠키를 받은 이후 제거한다
	
	response.addCookie(c1);
	response.addCookie(c2);
	
	response.sendRedirect("ex02_cookie_check.jsp");
%>

</body>
</html>