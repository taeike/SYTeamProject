<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<style>
div {
	width: 400px;
	height: 400px;
	border: 3px solid lightgrey;
	border-radius: 15px;
}
</style>
<body>
	<center>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="form">

			<form accept-charset="UTF-8" method="post" action="loginPro">
				<table>
					
					<tr height="30"></tr>

					<tr>
						<h3><spring:message code="login.login" text="default text" /></h3>
					</tr>

					<tr>
						<td width="300"><input type="text" name="email" id="email"
							placeholder=<spring:message code="login.email" text="default text" /> class="form-control" /></td>
					</tr>

					<tr height="15"></tr>
					<tr>
						<td width="300"><input type="password" name="password"
							id="password" placeholder=<spring:message code="login.password" text="default text" /> class="form-control"></td>
					</tr>

					<tr height="10"></tr>
					<tr>
						<td width="300"><input type="checkbox" name="id_store"
							id="id_store" />&nbsp;<spring:message code="login.emailsave" text="default text" /></td>
					</tr>

					<tr height="30"></tr>
					<tr>
						<td colspan=2 class="w3-center"><input  style="width:100%; text-align: center;" type="submit" 
							class="btn btn-lg"
							value=<spring:message code="login.login" text="default text" /> />

						</td>

					</tr>

					<tr height="30"></tr>
					<tr>
						<td colspan=2 class="w3-center">
							<center>
								<a href="<c:url value="/member/joinForm"/>"><spring:message code="login.join" text="default text" />&nbsp;</a>|<a href="<c:url value="/member/emailFindForm"/>">&nbsp;<spring:message code="login.findemail" text="default text" />&nbsp;</a>|<a href="<c:url value="/member/passwordFindForm"/>">&nbsp;<spring:message code="login.findpasswd" text="default text" /></a>
							</center>
						</td>

					</tr>

				</table>
			</form>
		</div>

	</center>
	
</body>
</html>