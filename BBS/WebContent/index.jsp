<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>
<div class="container">
	<div class="d-flex justify-content-around bg-secondary mb-3">
		<div class="p-2 bg-info">여기로---></div>
		<div class="p-2 bg-black"><a href="${path}/board_servlet/list.do" style="text-decoration: none; color: white;">게시판 목록보기</a></div>
		<div class="p-2 bg-info">들어와~</div>
	</div>
</div>
</body>
</html>