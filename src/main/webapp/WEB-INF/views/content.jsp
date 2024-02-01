<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- content.jsp -->
<link rel="stylesheet" type="text/css" href="resources/style.css">

<div align="center">
	<b>글내용 보기</b><br><br>
	<table border="1" width="30%">
		<tr>
			<th width="20%" bgcolor="yellow">글번호</th>
			<td width="30%" align="center">${getBoard.num}</td>
			<th width="20%" bgcolor="yellow">조회수</th>
			<td width="30%" align="center">${getBoard.readcount}</td>
		</tr>
		<tr>
			<th width="20%" bgcolor="yellow">작성자</th>
			<td width="30%" align="center">${getBoard.writer}</td>
			<th width="20%" bgcolor="yellow">작성일</th>
			<td width="30%" align="center">${getBoard.reg_date}</td>
		</tr>
		<tr>
			<th width="20%" bgcolor="yellow">글제목</th>
			<td width="80%" colspan="3">${getBoard.subject}</td>
		</tr>
		<tr>
			<th width="20%" bgcolor="yellow">글내용</th>
			<td width="80%" colspan="3">${getBoard.content}</td>
		</tr>
		<tr>
			<td colspan="4" align="right" bgcolor="yellow">
				<input type="button" value="답글쓰기"  
						onclick="window.location='writeForm_board.bo?num=${getBoard.num}&re_step=${getBoard.re_step}&re_level=${getBoard.re_level}'">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글수정" 
						onclick="window.location='updateForm_board.bo?num=${getBoard.num}'">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제" 
						onclick="window.location='deleteForm_board.bo?num=${getBoard.num}'">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록" 
						onclick="window.location='board.bo'">
			</td>
		</tr>
	</table>
	
</div>

