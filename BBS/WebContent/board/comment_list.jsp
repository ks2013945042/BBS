<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 리스트</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>
<div class="container">
	<table width="100%">
		<c:forEach
			var="row"
			items="${list}"
		>
			<tr>
				<td id="comment" style="border-bottom: 1px solid grey;">
					${row.writer}
					( ${row.reg_date} ) <br>
					${row.content}
					
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>