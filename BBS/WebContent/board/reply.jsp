<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 달기</title>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
$(function(){
	$("#btnSave").on("click", function(){
		var form1 = document.form1; 
		if( !form1.writer.value ) // form 에 있는 name 값이 없을 때 
		{ 
			alert( "이름을 적어주세요" ); // 경고창 띄움
			form1.writer.focus(); // form 에 있는 name 위치로 이동 
			return;
		} 
		if( !form1.content.value )
		{
			alert( "내용을 적어주세요" );
			form1.content.focus();
			return;
		}
		if( !form1.password.value )
		{
			alert( "비밀번호를 적어주세요" );
			form1.password.focus();
			return;
		}
		form1.submit();
	});
});	
</script>
</head>
<body>
<div class="container">
	<h1>답글 달기</h1>
	<form 
		name="form1" 
		method="post" 
		action="${path}/board_servlet/insertReply.do"
	>
	<table border = "1" width="100%">
		<tr>
			<td width="30%" align="center">제목</td>
			<td width="70%" align="center">
				<input type="text" name="subject" id="subject" value="${dto.subject} "size="60"/>
			</td>
		</tr>
		<tr>
			<td width="30%" align="center">이름</td>
			<td width="70%" align="center">
				<input type="text" name="writer" id="writer"/>
			</td>
		</tr>
		<tr>
			<td width="30%" align="center">본문</td>
			<td width="70%" align="center">
				<textarea id="content" name="content" rows="5" cols="60">${dto.content }</textarea>
			</td>
		</tr>
		<tr>
			<td width="30%" align="center">첨부파일</td>
			<td width="70%" align="center">
				<input type="file" name="file1"/>
			</td>
		</tr>
		<tr>
			<td align="center">비밀번호</td>
			<td colspan="3">
				<input type="password" name="password" id="password"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="hidden" name="num" value="${dto.num}">
				<input type="hidden" name="ref" value="${dto.ref}">
				<input type="hidden" name="re_step" value="${dto.re_step}">
				<input type="hidden" name="re_level" value="${dto.re_level}">
				<input type="button" value="취소" onClick="javascript:history.back(-1)">
				<input type="button" value="확인" id="btnSave">
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>