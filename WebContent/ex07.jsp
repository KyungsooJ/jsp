<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ex07.jsp</title>
<style>
	#list {
		widgth: 800px;
		border: 2px solid black;
		margin: auto;
		overflow-x: hidden;
		overflow-y: auto;
	}
	.wrap {
		width: 700px;
		height: 600px;
		display: flex;
		flex-flow: wrap;
		margin: auto;
	}
	.item {
		box-sizing: border-box;
		width: 200px;
		height: 160px;
		border: 1px solid grey;
		margin: 10px;
		cursor: pointer;
		font-size: 40px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.item:hover {
		background-color: black;
		color: white;
	}
	.item > a {
		text-decoration: none;
		color: inherit;
		display: block;
		width: 100%;
		text-align: center;
	}
	.item:hover > a {
		text-decoration: underline;
	}
	#recent {
		width: 800px;
		margin: 20px auto;
	}
</style>
</head>
<body>

<h1>최근 선택한 항목을 쿠키에 저장하기</h1>
<hr>
<div id="recent">
	<c:set var="recent" value="${URLDecoder.decode(cookie.recent.value, 'UTF-8') }"/>
	최근 본 항목 : 
	<c:forTokens var="i" items="${recent }" delims=",">
	<a href="ex07_view.jsp?idx=${i }"><button>${i }</button></a>
	</c:forTokens>
</div>

<div id="list">
	<div class="wrap">
	<c:forEach var="i" begin="1" end="20">
		<div class="item">
			<a href="ex07_view.jsp?idx=${i }">${i }</a>
		</div>
	</c:forEach>
	</div>
</div>
</body>
</html>