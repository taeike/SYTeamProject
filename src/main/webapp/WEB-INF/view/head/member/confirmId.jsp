<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata">

<!-- <style>
body, h1 {
	font-family: "Raleway", Arial, sans-serif
}

h1 {
	letter-spacing: 5px
}

.w3-row-padding img {
	margin-bottom: 12px
}
</style> -->
<title>아이디 중복 확인</title>


<body>
	<c:if test="${check == 1}">

		<table width="470" border="0" cellspacing="0" cellpadding="5">
			<tr><br><br>
				<td height=" 39" align="center">
					<p>${email}는(은)이미 사용중인 이메일입니다.</p>
				</td>
			</tr>
		</table>
		<center>
		<form action="confirmId" name=" checkForm" class="form-inline" method="post">
			<table width=" 270" border=" 0" cellspacing="0" cellpadding="5">
				<tr>
					<td align="center">
						<p>
							<input type="text" size="10"  class="form-control" id="email"
							  size="10" maxlength="12" name="email"> <input
								type="submit"
								class="w3-button"  class="btn" value="중복확인">
					</td>
				</tr>
			</table>
		</form>
		</center>
	</c:if>
	<c:if test="${check != 1}">
		<c:if test ="${email eq ''}">
		<center>
   <form action="confirmId"  name="checkForm"  class="form-inline" method="post">
      <table width=" 270" border=" 0" cellspacing="0" cellpadding="5">
      
         <tr>
         <br><br>
            <td align="center">다른 이메일을 입력해주세요. 
               <p>
               <br>
                  <input type="text" class="form-control" id="email"
						 size="10" maxlength="12" name="email"> <input
                     type="submit"  class="btn" value="중복확인">
            </td> 
         </tr>
      </table>
   </form>
   </center>
   </c:if>
   <c:if test ="${email ne ''}">
	<center>
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center">
					<P><br><br>
						입력하신 <strong>${email}</strong>는(은)사용 가능합니다.
					</P> <input type="button"
					 class="btn"  value="닫기" onclick="setId()">
				</td>
			</tr>
		</table>
		</center>
	</c:if>
	</c:if>
</body>
</html>

<script>   
function  setId ()
{
   opener.document.userinput.email.value="${email}";
		opener.document.userinput.idchk.value = "Y";
		self.close();
	}
</script>