<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- deleteForm.jsp -->
<link rel="stylesheet" type="text/css" href="resources/style.css">

<div align="center">
	<b>�ۻ���</b><br><br>
	<form name="f" action="deletePro_board.bo" method="post">
		<input type="hidden" name="num" value="${param.num}"/>		
		<table border="1" width="30%">
			<tr bgcolor="yellow">
				<th>��й�ȣ�� �Է��� �ּ���.</th>
			</tr>
			<tr>
				<td align="center">
					��й�ȣ : <input type="password" name="passwd">
				</td>
			</tr>
			<tr bgcolor="yellow">
				<td align="center">
					<input type="submit" value="�ۻ���">
					<input type="button" value="�۸��" 
						onclick="window.location='board.bo'">
				</td>
			</tr>
		</table>
	</form>
</div>
