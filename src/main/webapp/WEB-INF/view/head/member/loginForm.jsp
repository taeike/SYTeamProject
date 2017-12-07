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

<script type="text/javascript">
   $(document).ready(function() {
      // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
      var userInputEmail = getCookie("userInputEmail");
      $("input[name='email']").val(userInputEmail);

      if ($("input[name='email']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
         $("#emailStore").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
      }

      $("#emailStore").change(function() { // 체크박스에 변화가 있다면,
         if ($("#emailStore").is(":checked")) { // ID 저장하기 체크했을 때,
            var userInputEmail = $("input[name='email']").val();
            setCookie("userInputEmail", userInputEmail, 7); // 7일 동안 쿠키 보관
         } else { // ID 저장하기 체크 해제 시,
            deleteCookie("userInputEmail");
         }
      });

      // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
      $("input[name='email']").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
         if ($("#emailStore").is(":checked")) { // ID 저장하기를 체크한 상태라면,
            var userInputEmail = $("input[name='email']").val();
            setCookie("userInputEmail", userInputEmail, 7); // 7일 동안 쿠키 보관
         }
      });
   });

   function setCookie(cookieName, value, exdays) {
      var exdate = new Date();
      exdate.setDate(exdate.getDate() + exdays);
      var cookieValue = escape(value)
            + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
      document.cookie = cookieName + "=" + cookieValue;
   }

   function deleteCookie(cookieName) {
      var expireDate = new Date();
      expireDate.setDate(expireDate.getDate() - 1);
      document.cookie = cookieName + "= " + "; expires="
            + expireDate.toGMTString();
   }

   function getCookie(cookieName) {
      cookieName = cookieName + '=';
      var cookieData = document.cookie;
      var start = cookieData.indexOf(cookieName);
      var cookieValue = '';
      if (start != -1) {
         start += cookieName.length;
         var end = cookieData.indexOf(';', start);
         if (end == -1)
            end = cookieData.length;
         cookieValue = cookieData.substring(start, end);
      }
      return unescape(cookieValue);
   }
</script>

<title>Insert title here</title>
</head>
<style>
#formdiv {
   width: 630px;
   height: 310px;
   margin: 0 auto;
   padding: 30px 30px;
   border: 1px solid #e1e1e1;
   border-radius: 1px;
   font-size: 11px;
   margin: 0 auto /* margin-top: 250px; */
}

.font {
   font-size: 11px;
   color: #FAFAFA;
}

</style>
<body>

   <div id="formdiv" class="form" style="margin-top: 100px">
      <center>
         <div class="w3-half" style="width: 230px">
            <form accept-charset="UTF-8" method="post" action="loginPro">
               <h5>
                  <spring:message code="login.login" text="default text" />
               </h5>
               <br>
               <p>
                  <input name="email" class="inputTypeText w3-padding-small"
                     style="width: 220px; height: 30px;" id="email" type="text"
                     placeholder=<spring:message code="login.email" text="default text" />>
               </p>
               <p>
                  <input name="password" class="inputTypeText w3-padding-small"
                     style="width: 220px; height: 30px;" id="password" type="text"
                     placeholder=<spring:message code="login.password" text="default text" />>
               </p>
               <p style="text-align: left; width: 220px;">
                  <input type="checkbox" name="id_store" id="id_store" />&nbsp;
                  <spring:message code="login.emailsave" text="default text" />
               </p>
               <br>
               <p class="w3-center">
                  <input
                     style="width: 220px; text-align: center; background-color: #424242;"
                     type="submit" class="btn btn-lg font"
                     value=<spring:message code="login.login" text="default text" /> />
               </p>
               <div class="w3-center">
                  <center>
                     <a href="<c:url value="/member/emailFindForm"/>">&nbsp;<font
                        color="#333"><spring:message code="login.findemail"
                              text="default text" /></font>&nbsp;
                     </a>|<a href="<c:url value="/member/passwordFindForm"/>">&nbsp;<font
                        color="#333"><spring:message code="login.findpasswd"
                              text="default text" /></font></a>
                  </center>
               </div>
            </form>
         </div>
         <div class="w3-half" style="width: 300px; margin-left: 30px;">
            <form accept-charset="UTF-8" method="post" action="/member/joinForm">
               <h5>
                  <spring:message code="login.join" text="default text" />
               </h5>
               <br>
               <div
                  style="border-bottom: 1px solid #e1e1e1; border-top: 1px solid #e1e1e1; padding-top: 20px; padding-bottom: 20px;">
                  아직 회원이 아니십니까?<br>회원을 위한 다양한 기능이 준비되어 있습니다.
               </div>

               <p class="w3-center" style="margin-top: 54px">
                  <input
                     style="width: 300px; text-align: center; background-color: #D8D8D8;"
                     type="submit" class="btn btn-lg font"
                     value=<spring:message code="login.join" text="default text" /> />
               </p>

            </form>
         </div>
      </center>
   </div>

</body>
</html>