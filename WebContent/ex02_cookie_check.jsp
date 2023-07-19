<%@page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02_cookie_check.jsp</title>
</head>
<body>

<h1>쿠키 체크</h1>
<hr>
<fieldset>
<legend>스크립틀릿 쿠키 확인</legend>
<ul>

<%
	// 1) 스크립틀릿, 자바 코드에서 확인하기
	Cookie[] cs = request.getCookies();	// 쿠키가 없다면 cs의 값은 null
	for(int i = 0; cs != null && i < cs.length; i++) {	// cs가 null이면, length 접근 불가
		Cookie c = cs[i];
		String name = c.getName();
		String value = c.getValue();
		
		// 인코딩된 값이 저장되어 있다면 출력하기 전 decode를 수행해야 한다
		value = URLDecoder.decode(value, "UTF-8");
		out.println("<li>" + name + " : " + value + "</li>");
	}
%>
</ul>
</fieldset>
<br>
<fieldset>
	<legend>EL 태그 쿠키 확인</legend>
	
	<ul>
		<li>ipaddr : ${URLDecoder.decode(cookie.ipaddr.value) } </li>
		<li>lmt : ${URLDecoder.decode(cookie.lmt.value) } </li>
	</ul>
</fieldset>
<br>


<%=URLEncoder.encode("아이유", "UTF-8") %><br>
<%=URLEncoder.encode("가", "UTF-8") %><br>


<fieldset>
	<legend>자바스크립트 확인</legend>
	<ul id = "js"></ul>
	<script>
		const cookie = document.cookie
		const arr = cookie.split('; ')
		const js = document.getElementById('js')
		
		for(let i = 0; i < arr.length; i++) {
			console.log(arr[i])
			const li = document.createElement('li')
			li.innerText = decodeURIComponent(arr[i])
			js.appendChild(li)
		}
		alert(document.cookie)
	</script>
</fieldset>

<p>
	<a href="ex01_cookie_making.jsp"><button>쿠키 만들기</button></a>
	<a href="ex03_cookie_delete.jsp"><button>쿠키 삭제</button></a>
</p>
</body>
</html>