<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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

<style>
div{
margin-top: 100px;
}
</style>

<script>
	function checkIt() {

		var userinput = eval("document.userinput");

		if (!userinput.name.value) {
			var value= '<spring:message code="login.message_entername" javaScriptEscape="true" />'
			alert(value);
			userinput.name.focus();
			return false;
		}

		if (!userinput.number.value) {
			var value= '<spring:message code="login.message_enterphone" javaScriptEscape="true" />'
			alert(value);
			userinput.number.focus();
			return false;
		}
	}
</script>
<body>

	
	

	<center>
	<div>
		<form action="emailFindPro" method="post" onSubmit="return checkIt()"
			class="form-inline" name="userinput">
			<table style="width =: 50%">
				<tr>
					<td><legend><center>
							<h3><spring:message code="login.findemail" text="default text" /></h3></center>
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
					<td width="200"><center><spring:message code="login.name" text="default text" /></center></td>
					<td width="400"><input type="text" name="name" id="name"
						class="form-control" size="15" maxlength="10"></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td width="200"><center><spring:message code="login.phone" text="default text" /></center></td>
					<td width="400"><input type="text" name="pnumber" id="pnumber"
						class="form-control" size="20" maxlength="15">&nbsp;&nbsp;&nbsp;<spring:message code="login.guide1" text="default text" />&nbsp;&nbsp;</td>
				</tr>
				
				</tr>
						<tr><td>&nbsp;</td></tr> <tr><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
					<td colspan="2" class="w3-center"><center><input type="submit"
						name="emailfind" class="btn" value=<spring:message code="login.findemail" text="default text" />> 
						<input type="button" class="btn" value=<spring:message code="login.findpasswd" text="default text" />
						onclick="location.href='<c:url value="/member/passwordFindForm"/>'">
						<input type="button" class="btn" value=<spring:message code="login.cancel" text="default text" />
						onclick="location.href='<c:url value="/member/main"/>'"></center></td>
				</tr>


			</table>

		</form>
		</div>
	</center>
</body>
</html>

