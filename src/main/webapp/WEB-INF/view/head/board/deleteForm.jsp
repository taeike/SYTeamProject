<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css"
	href=http://fonts.googleapis.com/earlyaccess/nanumgothic.css>
<style>
body {
	font-family: 'Nanum gothic', serif;
	font-size: 12px;
}

div {
	font-family: "Raleway", Arial, sans-serif
}
</style>
<title>게시판</title>
</head>

<body>
	<center>
		<div
			style="width: 450px; margin: 0 auto; padding: 70px 20px; border: 1px solid #e1e1e1; color: #8f8f8f; clear: both; overflow: hidden;">
			<form method="post" name="delForm"
				action="deletePro?pageNum=${pageNum}">
				글을 삭제하시려면 비밀번호를 입력하세요. <br> <br> <br> 비밀번호 : <input
					type="password" name="passwd" size="15" maxlength="15"> <input
					type="hidden" name="num" value="${num}"> <br> <br>
				<br> <input type="submit"
					class="w3-button w3-white w3-border w3-round-large"
					style="font-size: 11px;" value="글삭제"> <input type="button"
					class="w3-button w3-white w3-border w3-round-large"
					style="font-size: 11px;" value="글목록"
					OnClick="window.location='list'">


			</form>
		</div>
	</center>
</body>
</html>