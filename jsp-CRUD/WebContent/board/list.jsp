<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h3>게시판</h3>


<table id="boardList">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>IP</th>
		</tr>
	</thead>
	
	<tbody>
	<c:set var="list" value="${boardDAO.select(param.column, param.search) }" />
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td>
				<a href="${cpath }/board/view.jsp?idx=${dto.idx}">${dto.title }</a>
				<c:if test="${not empty dto.fileName }">
					<span class="fileIcon">💾</span>
				</c:if>			
			</td>
			<td>${dto.userid }</td>
			<td>${dto.writeDate }</td>
			<td>${dto.ipaddr }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<div class="flex">
	<div>
		<form>
			<select name="column">
				<option ${param.column == 'title' ? 'selected' : '' } value="title">===제목으로 검색===</option>
				<option ${param.column == 'writer' ? 'selected' : '' } value="writer">===작성자로 검색===</option>
				<option ${param.column == 'content' ? 'selected' : '' } value="content">===내용으로 검색===</option>
			</select>
			<input type="search" name="search" 
				   placeholder="검색어를 입력하세요" autocomplete="off"
				   value="${param.search }">
			<button>검색</button>
		</form>
	</div>
	<div>
		<a href="${cpath }/board/write.jsp"><button>새 글 쓰기</button></a>
	</div>
</div>










</body>
</html>