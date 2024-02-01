<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!-- updateForm.jsp -->
<link rel="stylesheet" type="text/css" href="resources/style.css">

<div align="center">
	<form name="f" action="updatePro_board.bo" method="post"
										onsubmit="return check()"> 
		<input type="hidden" name="num" value="${getBoard.num}"/>
		<h3>글수정</h3>												
		<table border="1" width="50%">
			<tr>
				<td align="center" width="20%" bgcolor="yellow">이 름</td>
				<td><input type="text" name="writer" class="box" 
								value="${getBoard.writer}" readOnly></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">제 목</td>
				<td><input type="text" name="subject" class="box" size="40"
								value="${getBoard.subject}"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">Email</td>
				<td><input type="text" name="email" class="box" size="40"
								value="${getBoard.email}"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">내 용</td>
				<td><textarea name="content" rows="11" cols="40" class="box">${getBoard.content}</textarea></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">비밀번호</td>
				<td><input type="password" name="passwd" class="box"></td>
			</tr>
			<tr>
				<td align="center" bgcolor="yellow" colspan="2">
					<input type="submit" value="글수정">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='board.bo'">
				</td>
			</tr>
		</table>
	</form>
</div>



