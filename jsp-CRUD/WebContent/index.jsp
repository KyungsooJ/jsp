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
		<legend>CRUD</legend>
		<details>
			<ul>
				<li>select 시 join을 활용하여 불러오기</li>
				<li>파일 업로드 시 외부 경로 참조하여 처리하기</li>
				<li>삭제 시 자바스크립트를 활용하여 처리하기 (작성자 일치 여부 체크)</li>
				<li>검색 기능 구현</li>
				<li>게시글 수정 구현</li>
				<li>수정 및 삭제에서 첨부파일까지 삭제하기</li>
				<li>댓글 목록 불러오기 (미구현)</li>
			</ul>
		</details>
	</fieldset>
	<br>
	
</main>

데이터 베이스
drop sequence board_seq;
drop sequence member_seq;
drop sequence reply_seq;
drop table board;
drop table member;
drop sequence reply;

board

idx		숫자		시퀀스 기본값 기본키
title		문자열(100)	not null,
writer		숫자		not null,
content		문자열(2000)	not null,
fileName	문자열(255),
writeDate	날짜		기본값 현재 날짜,
ipaddr		문자열(50),
userAgent	문자열(500),

제약조건 board_member_fk
외래키 writer
참조대상 member(idx)
삭제 시 cascade
<<
create table board (
    idx         number          default board_seq.nextval primary key,
    title       varchar2(100)   not null,
    writer      number          not null,
    content     varchar2(2000)  not null,
    fileName    varchar2(255),
    writeDate   date            default sysdate,
    ipaddr      varchar2(50)    not null,
    userAgent   varchar2(500)   not null,
    
    constraint board_member_fk
    foreign key(writer)
    references member(idx)
    on delete cascade
);
>>
member
idx	숫자	시퀀스 기본키
userid	문자열(100)	고유키
userpw	문자열(255)	not null
username	문자열(100)
email	문자열(100)

<<
create table member (
    idx         number          default member_seq.nextval primary key,
    userid      varchar2(100)   unique,
    userpw      varchar2(255)   not null,
    username    varchar2(100)   not null,
    email       varchar2(100)   not null  
);

>>

reply

create table reply (
    idx         number          default reply_seq.nextval primary key,
    board       number          not null,
    writer      number          not null,
    content     varchar2(1500)  not null,
    writeDate   date            default sysdate,
    ipaddr      varchar2(50)    not null,
    userAgent   varchar2(500)   not null,
    
    constraint reply_member_fk
    foreign key(writer)
    references member(idx)
    on delete cascade,
    
    constraint reply_board_fk
    foreign key(board)
    references board(idx)
    on delete cascade

);

</body>
</html>
