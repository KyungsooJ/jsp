<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06_popup.jsp</title>
</head>
<body>

<h3>공지사항</h3>

<fieldset style="height:250px; margin: 10px auto;">
	내용입니다 ~~~~~~~~~~~~~~~~~~~~~
</fieldset>

<!-- form부터 확인 ! -->
<form method="POST">
	<div style="display: flex; justify-content: space-between;">
		<div>
			<label>
			<input type="checkbox" name="donotPopup">1분 동안 열지 않습니다
			</label>
		</div>
		<div>
			<input type="submit" value="닫기">
		</div>
	</div>
</form>

<%
/* form 태그에 action이 없는 대신 여기서 받아준다 */
	if(request.getMethod().equals("POST")) {
		String donotPopup = request.getParameter("donotPopup");
		if(donotPopup != null) {
			Cookie c = new Cookie("donotPopup", donotPopup);
			c.setMaxAge(60 * 1);
			response.addCookie(c);
		}
		/* 체크를 안하면 off가 아니라 그냥 안한다 */
		%>

		<script>
			window.close()
		</script>
		<%
	}
%>
</body>
</html>