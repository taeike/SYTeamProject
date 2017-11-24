<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<body>
<body>
	<div class="w3-contaiber">
		<div style="width: 700px; margin: 0 auto;">
			<center>
				
				<form method="post" name="writerform" action="updatePro">
					<input type="hidden" name="num" value="${article.num}"> <input
						type="hidden" name="pageNum" value="${pageNum}"> <input
						type="hidden" name="ref" value="0"> <input type="hidden"
						name="re_step" value="0"> <input type="hidden"
						name="re_level" value="0">
					<table class="w3-table w3-bordered"
						style="width: 100%; font-size: 13px;">

						<tr>
							<td width="70" align="center">이름</td>
							<td width="330"><input type="text" size="10" maxlength="10"
								name="writer" value="${article.writer}"></td>
						</tr>
						<tr>
							<td width="70" align="center">제목</td>
							<td width="330"><input type="text" size="40" maxlength="50"
								name="subject" value="${article.subject}"></td>
						</tr>
						<tr>
							<td width="70" align="center">내용</td>
							<td width="330"><textarea name="content" rows="13" cols="40"> ${article.content}</textarea></td>
						</tr>

						<tr>
							<td width="70" align="center">비밀번호</td>
							<td width="330"><input type="password" size="8"
								maxlength="12" name="passwd"></td>
						</tr>
						<tr>
							<td colspan=2 align="center"><input type="submit"
								class="w3-button w3-white w3-border w3-round-large"
								style="font-size: 11px;" value="글쓰기"> <input
								type="reset" class="w3-button w3-white w3-border w3-round-large"
								style="font-size: 11px;" value="다시작성"> <input
								type="button"
								class="w3-button w3-white w3-border w3-round-large"
								style="font-size: 11px;" value="글목록"
								OnClick="window.location='list'"></td>
						</tr>
					</table>
				</form>
			</center>
		</div>
	</div>
</body>
</html>