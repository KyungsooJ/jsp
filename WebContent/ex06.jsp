<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06.jsp</title>
</head>
<body>
<h1>쿠키를 활용한 팝업 처리</h1>
<hr>

<p>쿠키 : ${cookie.donotPopup.value }</p>

<script>
	const donotPopup = '${cookie.donotPopup.value}'
	
	function openPopup() {
		let options = 'top=50, left=50, width=500, height=400,'
		options += 'status=no, menubar=no, toolbar=no, resizable=no'
		const url = 'ex06_popup.jsp'
		window.open(url, '공지사항', options)
	}
	
	if(donotPopup != 'on') {
		openPopup()
	}
	
</script>


</body>
</html>