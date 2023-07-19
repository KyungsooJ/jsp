<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<main>
	<fieldset>
		<legend>구현해야할 기능</legend>
		<details>
		
		<ul>
			<li>member
				<ol>
					<li>로그인</li>
					<li>로그아웃</li>
					<li>회원가입</li>
				</ol>
			</li>
			<li>
				board
				<ol>
					<li>목록</li>
					<li>작성</li>
					<li>조회</li>
					<li>검색</li>
					<li>수정</li>
					<li>삭제</li>
				</ol>
			</li>
			<li>reply
				<ol>
					<li>목록</li>
					<li>작성</li>
					<li>삭제</li>
				</ol>
			</li>
		</ul>
		</details>
	</fieldset>
	<br>
	
	
	<fieldset>
		<legend>tomcat 포트 충돌 시 강제 종료 하기</legend>
		<details>
	<pre class="cmd">
C:\> netstat -ano | findstr 8080
  TCP    0.0.0.0:8080           0.0.0.0:0              LISTENING       10392
  TCP    [::]:8080              [::]:0                 LISTENING       10392
  
C:\> taskkill /f /pid 10392 	
성공: 프로세스(PID 10392)가 종료되었습니다.
	</pre>
		</details>
	</fieldset>
	<br>
	
	
	<fieldset>
		<legend>JSP 프로젝트 외부 경로의 업로드 파일 참조하기</legend>
		<details>
			<p><%=application.getRealPath("/upload") %></p>
			<p><img src="${cpath }/upload/spicyBullet.jpg" width="300"></p>
			<p><img src="${cpath }/upload/광안리무단횡단.gif" width="300"></p>
		</details>
	</fieldset>
	<br>
	
	
	<fieldset>
		<legend>day19 수정 내용</legend>
		<details>
			<ul>
				<li>select 시 join을 활용하여 불러오기</li>
				<li>파일 업로드 시 외부 경로 참조하여 처리하기</li>
				<li>삭제 시 자바스크립트를 활용하여 처리하기 (작성자 일치 여부 체크)</li>
				<li>검색 기능 구현</li>
			</ul>
		</details>
	</fieldset>
	<br>
	
	<fieldset>
		<legend>day20 수정 내용</legend>
		<details>
			<ul>
				<li>게시글 수정 구현</li>
				<li>수정 및 삭제에서 첨부파일까지 삭제하기</li>
				<li>댓글 목록 불러오기 (미구현)</li>
			</ul>
		</details>
	</fieldset>
	<br>
	
</main>



</body>
</html>