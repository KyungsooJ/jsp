<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<c:set var="dto" value="${boardDAO.selectOne(param.idx) }" />

<fieldset class="frame">

	<h3>글 읽기</h3>
	
	<h4>${dto.title }</h4>
	<h5>
		${dto.userid } 
		| <fmt:formatDate value="${dto.writeDate }" pattern="yyyy-MM-dd a hh:mm"/> 
		| ${dto.ipaddr }
	</h5>
	<c:if test="${not empty dto.fileName }">
		<img src="${cpath }/upload/${dto.fileName}" width="500">
		<video src="${cpath }/upload/${dto.fileName}" controls></video>
	</c:if>
	<pre>${dto.content }</pre>

</fieldset>

<div class="flex">
	<div>
		<a href="${cpath }/board/list.jsp"><button>목록</button></a>
	</div>
	<div>
		<a class="modify confirm" href="${cpath }/board/modify.jsp?idx=${dto.idx}">
			<button>수정</button></a>
		
		<a class="delete confirm" href="${cpath }/board/delete.jsp?idx=${dto.idx}">
			<button>삭제</button></a>
	</div>
</div>

<fieldset class="frame">
	<form>
		<textarea name="content" placeholder="바르고 고운말을 이용합시다"></textarea>
		<button>댓글 작성</button>
	</form>
	<c:set var="replyDAO" value="${ReplyDAO.getInstance() }" />
	<c:set var="replyList" value="${replyDAO.select(param.idx) }" />
	<%--	select * from reply where board=24 order by idx; 	--%>
	
	<c:forEach var="reply" items="${replyList }">
	<div>
		
	</div>
	</c:forEach>
</fieldset>

<script>
// 	const link = document.querySelector('a.delete')
	const btnList = document.querySelectorAll('a.confirm')
	
	function confirmHandler(event) {
		event.preventDefault()			// 이벤트 대상 요소의 기본 작동을 막는다
		let target = event.target		// <a href="...">
		while(target.tagName != 'A') {	//		<button>수정</button>
			target = target.parentNode	// </a>
		}
		
		const login = '${login.userid}'	// 현재 로그인 사용자의 userid
		const writer = '${dto.userid}'	// 게시글 작성자의 userid
		const task = target.querySelector('button').innerText	// 버튼의 내부 글자 ('수정' / '삭제')
		
		if(login != writer) {							// 일치하지 않으면	
			alert('본인의 게시글만 ' + task +'할 수 있습니다 !!')	// 경고를 출력한다
			return				// 이벤트 함수 종료 (더이상 진행하지 않는다)
		}
		
		if(confirm('정말 ' + task + '하시겠습니까')) {		// 일치하면 삭제여부를 다시 확인하고
			location.href = target.href		// 링크의 주소대로 이동시킨다
		}
	}	// end of confirmHandler
	
	btnList.forEach(btn => btn.onclick = confirmHandler)
</script>


</body>
</html>












