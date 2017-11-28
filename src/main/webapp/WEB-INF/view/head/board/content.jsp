<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css"
	href=http://fonts.googleapis.com/earlyaccess/nanumgothic.css>
<title>게시판</title>

</head>
<style>
abbr {
	font-family: 'Nanum gothic', serif;
	font-size: 12px;
}

a {
	text-decoration: none;
}

td {
	text-decoration: none;
}
</style>
<body>
	<div style="width: 900px; margin: 0 auto;">
		<center>	
			<div class="container">
				<table class="w3-table w3-bordered"
					style="width: 100%; font-size: 13px;">
					<tr height="30">
						<td width="125" align="center">글번호</td>
						<td width="125" align="center"><abbr>${article.num}</abbr></td>
						<td width="125">조회수</td>
						<td width="125" align="center"><abbr>${article.readcount}</abbr></td>
					</tr>

					<tr height="30">
						<td width="125">작성자</td>
						<td width="125" align="center">${article.writer}</td>
						<td width="125" align="center">작성일</td>
						<td width="125" align="center"><abbr>${article.reg_date}</abbr></td>
					</tr>

					<tr height="30">
						<td width="125" align="center">글제목</td>
						<td width="125" align="center" colspan="3">${article.subject}</td>
					</tr>

					<tr height="30">
						<td width="125" align="center">글내용</td>
						<td width="125" align="center" colspan="3"><pre>${article.content}</pre></td>
					</tr>


					<tr height="30">
						<td colspan="4" class="w3-center"><input type="button"
							class="w3-button w3-white w3-border w3-round-large"
							style="font-size: 11px;" value="글수정"
							onclick="document.location.href='updateForm?num=${article.num}&pageNum=${pageNum}'">
							&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
							class="w3-button w3-white w3-border w3-round-large"
							style="font-size: 11px;" value="글삭제"
							onclick="document.location.href='deleteForm?num=${article.num}&pageNum=${pageNum}'">
							&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
							class="w3-button w3-white w3-border w3-round-large"
							style="font-size: 11px;" value="답글쓰기"
							onclick="document.location.href='writeForm?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}&pageNum=${pageNum}'">
							&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
							class="w3-button w3-white w3-border w3-round-large"
							style="font-size: 11px;" value="글목록"
							OnClick="window.location='list?boardid=${article.boardid}'">
						</td>
					</tr>
				</table>
			</div>
		</center>
	</div>
</body>
</html>