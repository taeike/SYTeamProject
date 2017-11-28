<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css"
	href=http://fonts.googleapis.com/earlyaccess/nanumgothic.css>
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


<div style="width: 700px; margin: 0 auto;">
	<center>
		<div class="s3-container">
			<p class="w3-right w3-padding-right-large">
				<%-- <c:if test="${id != null}">
					<input type="button"
						class="w3-button w3-white w3-border w3-round-large" name="write"
						value="글쓰기" style="font-size: 11px;"
						OnClick="javascript:window.location='../board/writeForm'">
				</c:if>
				<c:if test="${id == null}">
					<input type="button"
						class="w3-button w3-white w3-border w3-round-large" name="write"
						value="로그인" style="font-size: 11px;"
						OnClick="javascript:window.location='../member/login'">
				</c:if> --%>
				
				<input type="button"
						class="w3-button w3-white w3-border w3-round-large" name="write"
						value="글쓰기" style="font-size: 11px;"
						OnClick="javascript:window.location='../board/writeForm'">
			</p>

			<c:if test="${count == 0}">
				<table class="table-bordered" style="width: 100%; font-size: 13px;">
					<tr class="w3-grey">
						<td align="center">게시판에 저장된 글이 없습니다.</td>
				</table>
			</c:if>
			<c:if test="${count != 0}">
				<table class="w3-table w3-bordered"
					style="width: 100%; font-size: 13px;">
					<tr class="w3-grey">
						<td align="center" width="50">번호</td>
						<td align="center" width="250">제 목</td>
						<td align="center" width="100">작성자</td>
						<td align="center" width="150">작성일</td>
						<td align="center" width="50">조 회</td>

					</tr>

					<c:forEach var="article" items="${articleList}">

						<tr height="30">
							<td align="center" width="50"><abbr>${number}</abbr><c:set var="number"
									value="${number-1}" />
							</td>
							<td width="250"><c:if test="${article.re_level > 0}">
									<img src="<%=request.getContextPath()%>/images/level.gif"
										width="${article.re_level*5}" height="16">
									<img src="<%=request.getContextPath()%>/images/re.gif">
								</c:if> <c:if test="${article.re_level == 0}">
									<img src="<%=request.getContextPath()%>/images/level.gif"
										height="16">
								</c:if> <a href="content?num=${article.num}&pageNum=${currentPage}">
									${article.subject}</a> 
									<%-- <c:if test="${article.readcount >= 3 }">
									<img src="<%=request.getContextPath()%>/images/flame.png"
										boarder="0" height="16">
								</c:if> --%>
								&nbsp;
								
								</td>
							<td align="center" width="100">${article.writer}</td>
							<td align="center" width="150"><abbr>${article.reg_date}</abbr></td>
							<td align="center" width="50"><abbr>${article.readcount}</abbr></td>

							

						</tr>
					</c:forEach>
				</table>
			</c:if>

			<div class="w3-center">

				<c:if test="${count > 0}">
					<c:if test="${startPage > bottomLine}">
						<a href="list?pageNum=${startPage - bottomLine}">＜</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">

						<a href="list?pageNum=${i}"> <c:if test="${i != currentPage}">
					[${i}] </c:if> <c:if test="${i == currentPage}">
								<font color='red'>[${i}]</font>
							</c:if></a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a href="list?pageNum=${startPage + bottomLine}">＞</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</center>
</div>
