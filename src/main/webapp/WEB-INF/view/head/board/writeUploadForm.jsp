<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css"
	href=http://fonts.googleapis.com/earlyaccess/nanumgothic.css>
</head>
<title>Insert title here</title>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="/editor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "/editor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {

				}
			},
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["ir1"].exec("PASTE_HTML",
						[ "기존 DB에 저장된 내용을 에디터에 적용할 문구" ]);
			},
			fCreator : "createSEditor2"
		});

		//저장버튼 클릭시 form 전송
		$("#save").click(function() {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
	});
</script>
<style>
textarea {
	font-family: 'Nanum gothic', serif;
	font-size: 12px;
}
</style>
<body>
	<div class="w3-contaiber">
		<div style="width: 900px; margin: 0 auto;">
			<center>

				<form method="post" name="writeform" enctype="multipart/form-data"
					action="writeUploadPro">
					<input type="hidden" name="num" value="${num }"> <input
						type="hidden" name="pageNum" value="${pageNum }"> <input
						type="hidden" name="ref" value="${ref }"> <input
						type="hidden" name="re_step" value="${re_step}"> <input
						type="hidden" name="re_level" value="${re_level}">

					<table class="w3-table w3-bordered"
						style="width: 100%; font-size: 13px;">

						<tr>
							<td width="70" align="center">이름</td>
							<td width="330"><input type="text" size="10" maxlength="10"
								name="writer" value="${name}"></td>
						</tr>
						<tr>
							<td width="70" align="center">제목</td>
							<td width="330"><c:if test="${num == 0 }">
									<input type="text" size="40" maxlength="50" name="subject">
								</c:if> <c:if test="${num != 0 }">
									<input type="text" size="40" maxlength="50" name="subject"
										value="[답변]">
								</c:if></td>
						</tr>

						<tr>
							<td width="70" align="center">내용</td>
							<td width="330"><textarea id="ir1" name="content" rows="13"
									cols="40" style="width: 650px; height: 350px;"></textarea></td>
						</tr>

						<tr>
							<td width="70" align="center">비밀번호</td>
							<td width="330"><input type="password" size="8"
								maxlength="12" name="passwd" value="${password}"></td>
						</tr>
						<tr>
							<td colspan=2 align="center"><input type="submit"
								class="w3-button w3-white w3-border w3-round-large"
								style="font-size: 11px;" id="save" value="글쓰기"> <input
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