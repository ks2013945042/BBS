<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
	function writeCheck() 
	{ 
		var form1 = document.form1; 
		if( !form1.writer.value ) // form 에 있는 name 값이 없을 때 
		{ 
			alert( "이름을 적어주세요" ); // 경고창 띄움
			form1.writer.focus(); // form 에 있는 name 위치로 이동 
			return;
		} 
		if( !form1.subject.value )
		{
			alert( "제목을 적어주세요" );
			form1.subject.focus();
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
	}
	
	$(function(){
		$("#btnSave").on("click", function(){
			document.form1.submit();		//저장버튼을 누르면 form1을 submit해라
		});
		
		$("#btnList").on("click", function(){
			location.href="${path}/board_servlet/list.do";
		});
	});
</script>
</head>
<body>
<div class="container">
	<h1>글쓰기</h1>
	<form name="form1" method="post" action="${path}/board_servlet/insert.do" enctype="multipart/form-data">	<!-- .do는 가상의 주소 , 첨부파일을 cos형식에 맞춰서 post하려면 enctype까지 설정-->
		<table border="1" width="100%">
			<tr>
				<td align="center">이름</td>
				<td><input name="writer" id="writer" class="form-control" required/></td>
			</tr>
			<tr>
				<td align="center">제목</td>
				<td><input name="subject" id="subject" size="60" class="form-control" required/></td>
			</tr>
			<tr>
				<td align="center">본문</td>
				<td>
					<textarea rows="5" cols="60" name="content" id="content" class="form-control" required></textarea>
				</td>
			</tr>
			<tr>
				<td align="center">첨부파일</td>
				<td><input type="file" name="file1"/><!-- <input type="file" name="file2"/> --></td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td><input type="password" id="password" name="password" class="form-control" required/></td>
			</tr>
			<tr>
				<td>
					<input type="button" value="확인" OnClick="javascript:writeCheck();"/>
					<input type="button" value="목록" OnClick="javascript:history.back(-1)"/>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>