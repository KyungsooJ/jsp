<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05_theme.jsp</title>
<c:set var="theme" value="${URLDecoder.decode(cookie.theme.value) }"/>
<c:choose>
	<c:when test="${theme == 'Dark Theme' }">
		<c:set var="bgcolor" value="#111" />
		<c:set var="color" value="#ccc" />
	</c:when>
	<c:when test="${theme == 'Light Theme' }">
		<c:set var="bgcolor" value="white"/>
		<c:set var="color" value="black"/>
	</c:when>
	<c:when test="${theme == 'Pink Theme' }">
		<c:set var="bgcolor" value="#111"/>
		<c:set var="color" value="hotpink"/>
	</c:when>
</c:choose>
<style>
	html {
		color: ${color};
		background-color: ${bgcolor};
	}
</style>
</head>
<body>

<h1>컬러 테마</h1>
<hr>

<!-- 여기 form 부터 시작해서 아래로 갔다가 맨위로 올라간다  -->
<form method="POST">
	<p>
		<select name="theme">
			<option ${theme =='Light Theme' ? 'selected' : '' }>Light Theme</option>
			<option ${theme =='Dark Theme' ? 'selected' : '' }>Dark Theme</option>
			<option ${theme =='Pink Theme' ? 'selected' : '' }>Pink Theme</option>
		</select>
		<input type="submit">
	<p>
</form>

<%
	if(request.getMethod().equals("POST")) {
		String theme = request.getParameter("theme");
		theme = URLEncoder.encode(theme, "UTF-8");
		Cookie c = new Cookie("theme", theme);
		c.setMaxAge(60 * 5);
		response.addCookie(c);
		response.sendRedirect("ex05_theme.jsp"); 
	}
%>

<fieldset style="width: 500px; height: 300px; overflow-y: scroll">
	<pre>
Hey you
뭘 보니? 내가 좀 Sexy Sexy 반했니
Ye you
뭐 하니? 너도 내 Kiss Kiss 원하니
월 화 수 목 금 토 일 미모가 쉬지를 않네
머리부터 발끝까지 눈부셔 빛이 나네
Oh 저기 언니야들 내 Fashion을 따라 하네
아름다운 여자의 하루는 다 아름답네
이 Party에 준비된 Birthday cake
태어나서 감사해 Every day
I don’t need them
그래 내가 봐도 난
퀸카 I’m hot
My boob and booty is hot
Spotlight 날 봐
I’m a star star star
퀸카 I’m the top
I’m twerking on the runway
I am a 퀸카
You wanna be the 퀸카
I’m a 퀸카
I’m a 퀸카
I’m a I’m a I’m a 퀸카
I’m a 퀸카 (Take a photo)
I’m a 퀸카
I’m a 퀸카
I’m a I’m a I’m a 퀸카
I’m a 퀸카
Look so cool look so sexy
like Kim Kardashian
Look so cute look so pretty like Ariana
I wanna with you 뽀뽀
I wanna with you 포옹
자꾸 예뻐져 거울 속 너어~
이 Party에 준비된 (Blue) Champagne
태어난 걸 축하해 Every day
I don’t need them
그래 내가 봐도 난
퀸카 I’m hot
My boob and booty is hot
Spotlight 날 봐
I’m a star star star
퀸카 I’m the top
I’m twerking on the runway
I am a 퀸카
You wanna be the 퀸카
I’m a 퀸카
I’m a 퀸카
I’m a I’m a I’m a 퀸카
I’m a 퀸카 (Take a photo)
I’m a 퀸카
I’m a 퀸카
I’m a I’m a I’m a 퀸카
I’m a 퀸카
아무거나 걸친 Girl 퀸카카카
마르거나 살찐 Girl 퀸카카카
자신감 넘치는 Girl 퀸카카카
I am a 퀸카
You wanna be the 퀸카	
	</pre>
</fieldset>

</body>
</html>