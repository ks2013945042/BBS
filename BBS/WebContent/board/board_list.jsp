<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
	$(function(){ // 페이지가 로딩된 후 자동으로 실행되는 코드
		var page = $("#${page}").value();
		list(page);
	});
	
	function list(curPage) {
		var param = {
				"curPage" : curPage
		}
		$.ajax({
			url : "${path}/board_servlet/list.do",
			data: param,
			success : function(result){ // 콜백함수, 서버의 처리가 완료된후 실행
				$("#result").html(result); 
			}
		});
	}
	
	$(function() {
		$("#btnWrite").on("click", function(){
			location.href="${path}/board/board_write.jsp";	//클릭하면 여기로 가라
		});
	});
	
	$(function() {
		$("#btnHome").on("click", function(){
			location.href="${path}/index.jsp";	//클릭하면 여기로 가라
		});
	});
</script>
</head>
<body>
<div class="container" id="result">
<form method="post" name="form1">
	<a href="${path}/board_servlet/list.do" style="text-decoration: none; color:black;"><h1>게시판</h1></a>
	<p>전체 게시물수 ${rows} 건&nbsp;&nbsp;|&nbsp;&nbsp;현재 페이지: ${curPage} / ${total_page}</p>
	<table class="table-striped" border="1" width="100%">
		<thead>
			<tr class="table-primary">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>첨부파일</th>
				<th>다운로드</th>
			</tr>
		</thead>
		
		<!-- JSTL 을 사용하지 않은경우 
		 	<-%@ page import="java.util.List" %>
			<-%@ page import="board.dao.BoardDAO" %>
			<-%@ page import="board.dto.BoardDTO" %>
			<-%
			List<BoardDTO> list = (List<BoardDTO>)request.getAttribute("list");
			for(BoardDTO dto : list) {
			%>
			<tr>
				<td><-%=dto.getNum()%></td>
			</tr>
			<-%}%>
		-->
		
		<tbody>
			<!-- JSTL 로 간단하게 forEach 문으로 출력
				var 개별값 items 집합
			 	items의 list 는 controller의 setAttribute의 list
			-->
			 <c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.num}</td>
					<td>
						<!-- 리스트에 re_level이 1 이상이면 앞에 빈공간 2칸 만들기(계단식) -->
						<c:if test="${dto.re_level > 0}">
							<c:forEach var="i" begin="1" end="${dto.re_level}">
								<span>&nbsp;&nbsp;</span>
				        	</c:forEach>
				        </c:if>
						<a href="${path}/board_servlet/view.do?num=${dto.num}">
							${dto.subject} (${dto.comment_count})
						</a>
					</td>
					<td>${dto.writer}</td>
					<td>${dto.reg_date}</td>
					<td>${dto.readcount}</td>
					<td>
						<c:if test="${dto.filesize > 0}">
							<a href="${path}/board_servlet/download.do?num=${dto.num}">${dto.filename}</a>
						</c:if>
					</td>
					<td>${dto.down}</td>
				</tr>
			 </c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 -->
	<table border="1" class="table-light">
		<tr>
			<td>
				<!-- 처음 페이지일경우 이전(블록단위) 표시 안함, 처음 링크 클릭못하도록 -->
				<c:if test="${curPage == 1}">
					<a style="color: gray; decoration: none;">[처음]</a>
				</c:if>
				<c:if test="${curPage > 1}">
					<a href="#" onclick="list('1')">[처음]</a>
				</c:if>
				
				<c:if test="${current_block > 1}">
					<a href="#" onclick="list('${prev_page}')">[이전]</a>
				</c:if>
				
				<c:forEach var="page" begin="${block_start}" end="${block_end}">
					<c:if test="${page == curPage}">
						[${page}]
					</c:if>
					<c:if test="${page != curPage}">
						<a href="#" onclick="list('${page}')" id="${page}">[${page}]</a>
					</c:if>
				</c:forEach>
				
				<!-- 마지막 페이지일경우 다음(블록단위) 표시 안함, 마지막 링크 클릭못하도록 -->
				<c:if test="${curPage == total_page}">
					<a style="color: gray; decoration: none;">[끝]</a>
				</c:if>
				<c:if test="${curPage < total_page}">
					<a href="#" onclick="list('${total_page}')">[끝]</a>
				</c:if>
				
				<c:if test="${current_block < total_block}">
					<a href="#" onclick="list('${next_page}')">[다음]</a>
				</c:if>
			</td>
		</tr>
	</table>
	<button type="button" id="btnWrite">글쓰기</button>
	<button type="button" id="btnHome">메인화면</button>
</form>
</div>
</body>
</html>