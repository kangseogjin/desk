<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- content.jsp -->
<link rel="stylesheet" type="text/css" href="resources/style.css">

<div align="center">
	<b>�۳��� ����</b><br><br>
	<table border="1" width="30%">
		<tr>
			<th width="20%" bgcolor="yellow">�۹�ȣ</th>
			<td width="30%" align="center">${getBoard.num}</td>
			<th width="20%" bgcolor="yellow">��ȸ��</th>
			<td width="30%" align="center">${getBoard.readcount}</td>
		</tr>
		<tr>
			<th width="20%" bgcolor="yellow">�ۼ���</th>
			<td width="30%" align="center">${getBoard.writer}</td>
			<th width="20%" bgcolor="yellow">�ۼ���</th>
			<td width="30%" align="center">${getBoard.reg_date}</td>
		</tr>
		<tr>
			<th width="20%" bgcolor="yellow">������</th>
			<td width="80%" colspan="3">${getBoard.subject}</td>
		</tr>
		<tr>
			<th width="20%" bgcolor="yellow">�۳���</th>
			<td width="80%" colspan="3">${getBoard.content}</td>
		</tr>
		<tr>
			<td colspan="4" align="right" bgcolor="yellow">
				<input type="button" value="��۾���"  
						onclick="window.location='writeForm_board.bo?num=${getBoard.num}&re_step=${getBoard.re_step}&re_level=${getBoard.re_level}'">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="�ۼ���" 
						onclick="window.location='updateForm_board.bo?num=${getBoard.num}'">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="�ۻ���" 
						onclick="window.location='deleteForm_board.bo?num=${getBoard.num}'">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="�۸��" 
						onclick="window.location='board.bo'">
			</td>
		</tr>
	</table>
	
</div>

