<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="resources/style.css">
<div align="center">
	<b>�� �� ��</b>
	<table border="0" width="50%">
		<tr bgcolor="yellow">
			<td align="right"><a href="writeForm_board.bo">�۾���</a></td>
		</tr>
	</table>
	<table border="1" width="50%">
		<tr bgcolor="green">
			<th>��ȣ</th>
			<th width="30%">�� ��</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ</th>
			<th>IP</th>
		</tr>
	<c:if test="${empty listBoard}">
		<tr>
			<td colspan="6">��ϵ� �Խù��� �����ϴ�.</td>
		</tr>
	</c:if> 
	<c:set var="num" value="${number}"/>
	<c:forEach var="dto" items="${listBoard}">
		<tr>
			<td>
				<c:out value="${num}"/>
				<c:set var="num" value="${num-1}"/>			
			</td>
			<td>
				<c:if test="${dto.re_level > 0}">
					<img src="resources/img/level.gif" width="${dto.re_level*10}"/>
					<img src="resources/img/re.gif">
				</c:if>
					<a href="content_board.bo?num=${dto.num}">
						${dto.subject}
					</a>
				<c:if test="${dto.readcount > 10}">	
					<img src="resources/img/hot.gif">
				</c:if>	
			</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.readcount}</td>
			<td>${dto.ip}</td>
		</tr>
	</c:forEach>
	</table>
	<br>
	<form name="f" action="find_board.do" method="post">
		<select name="search">
			<option value="writer">�ۼ���</option>
			<option value="subject">������</option>
			<option value="content">�۳���</option>
		</select>
		<input type="text" name="searchString" class="box">
		<input type="submit" value="�˻�">
	</form>	
	<c:if test="${count > 0}">
		<c:if test="${startPage > pageBlock}">
			<a href="board.bo?pageNum=${startPage-3}">[����]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="board.bo?pageNum=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage > pageCount}">
			<a href="board.bo?pageNum=${startPage+3}">[����]</a>
		</c:if>
	</c:if>
</div>






