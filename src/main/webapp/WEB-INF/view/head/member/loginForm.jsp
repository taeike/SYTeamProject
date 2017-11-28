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
	
<script type="text/javascript" >
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputEmail = getCookie("userInputEmail");
    $("input[name='email']").val(userInputEmail); 
     
    if($("input[name='email']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#emailStore").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#emailStore").change(function(){ // 체크박스에 변화가 있다면,
        if($("#emailStore").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputEmail = $("input[name='email']").val();
            setCookie("userInputEmail", userInputEmail, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputEmail");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='email']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#emailStore").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputEmail = $("input[name='email']").val();
            setCookie("userInputEmail", userInputEmail, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

</script> 

<title>Insert title here</title>
</head>
<style>
#formdiv {
	width: 400px;
	height: 400px;
	border: 3px solid lightgrey;
	border-radius: 15px;
	margin-top: 250px;
}
</style>
<body>
	<center>

		<div id="formdiv" class="form">

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