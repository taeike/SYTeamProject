<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
</head>

<script>
	function checkIt() {

		var userinput = eval("document.userinput");

		if (!userinput.name.value) {
			alert("이름을 입력하세요");
			userinput.name.focus();
			return false;
		}

		if (!userinput.number.value) {
			alert("전화번호를 입력하세요");
			userinput.number.focus();
			return false;
		}
	}
</script>


<body>
<c:if test="${dbEmail ne null}">
	
	<br>
	<br>
	<br>
	<br>
	<br>

	<center>
		<form >
			<table style="width =: 50%">
				<tr>
					<td><legend><center>
							<h3>이메일 찾기</h3></center>
						</legend></td>
					<td><legend>
							<h3>&nbsp;</h3>
						</legend></td>
				
				</tr>
				<tr>
					<td>&nbsp;</td>

				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>검색하신 이메일은 <strong>${dbEmail}</strong>입니다.</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>

				
				
						<tr><td>&nbsp;</td></tr> <tr><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
					<td colspan="2" class="w3-center"><center>
						<input type="button" class="btn" value="&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 찾기&nbsp;&nbsp;&nbsp;&nbsp;"
						onclick="">
						<input type="button" class="btn" value="&nbsp;&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;&nbsp;"
						onclick=""></center></td>
				</tr>


			</table>

		</form>
		
		
	</center>
	</c:if>
	
	<c:if test="${dbEmail eq null}">
		<br>
	<br>
	<br>
	<center><strong>해당되는 이메일을 찾을 수 없습니다. 다시 입력해 주세요.</strong></center>
	<br>

	<center>
		<form action="emailFindPro" method="post" onSubmit="return checkIt()"
			class="form-inline" name="userinput">
			<table style="width =: 50%">
				<tr>
					<td><legend><center>
							<h3>이메일 찾기</h3></center>
						</legend></td>
					<td><legend>
							<h3>&nbsp;</h3>
						</legend></td>
				</tr>
				<tr>
					<td>&nbsp;</td>

				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td width="200"><center>이름</center></td>
					<td width="400"><input type="text" name="name" id="name"
						class="form-control" size="15" maxlength="10"></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td width="200"><center>전화번호</center></td>
					<td width="400"><input type="text" name="pnumber" id="pnumber"
						class="form-control" size="20" maxlength="15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(-없이
						입력해주세요.)</td>
				</tr>
				
				</tr>
						<tr><td>&nbsp;</td></tr> <tr><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
					<td colspan="2" class="w3-center"><center><input type="submit"
						name="emailfind" class="btn" value="&nbsp;&nbsp;&nbsp;&nbsp;찾기&nbsp;&nbsp;&nbsp;&nbsp;"> 
						<input type="button" class="btn" value="&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 찾기&nbsp;&nbsp;&nbsp;&nbsp;"
						onclick="">
						<input type="button" class="btn" value="&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;"
						onclick=""></center></td>
				</tr>


			</table>

		</form>
	</center>
	</c:if>
	
	
</body>
</html>