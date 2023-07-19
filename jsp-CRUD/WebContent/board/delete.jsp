<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<%-- 삭제하기 전 DB의 내용을 자바 객체로 불러온다 --%>
<c:set var="dto" value="${boardDAO.selectOne(param.idx) }" />

<%-- 글번호와 현재 사용자를 전달하여 게시글을 삭제한다--%>
<c:set var="row" value="${boardDAO.delete(param.idx, login.idx) }" />

<%-- 만약 게시글이 삭제되었고, 첨부파일이 있었다면 --%>
<c:if test="${row != 0 and not empty dto.fileName }">
	<%-- fileUtil 객체를 불러와서 --%>
	<c:set var="fileUtil" value="${FileUtil.getInstance() }" />
	
	<%-- 파일이름을 전달하여 저장된 파일을 삭제한다 --%>
	<c:set var="deleteFile" value="${fileUtil.deleteFile(dto.fileName) }" />
</c:if>

<script>
	const row = '${row}'
// 	const row = 
	if(row != 0) {
		alert('삭제 성공 !!')
		location.href = '${cpath}/board/list.jsp'
	}
	else {
		alert('삭제 실패 !!')
		history.go(-1)
	}
</script>

</body>
</html>