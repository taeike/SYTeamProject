<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- <link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
@import
	url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);

}
@import url(https://fonts.googleapis.com/css?family=Titillium+Web:300);

.headbar {
	height: 100px;
	width: 100%;
}

.menu1 {
	font-family: 'Titillium Web', sans-serif;
	position: relative;
	color: #000000;
	font-size: 11px;
	text-decoration: none;
}

.menu2 {
	font-family: 'Titillium Web', sans-serif;
	position: relative;
	color: #000000;
	font-size: 13px;
	text-decoration: none;
}

@font-face {
	font-family: 'Titillium Web';
	font-style: normal;
	font-weight: 300;
	src: local('Titillium WebLight'), local('TitilliumWeb-Light'),
		url(http://themes.googleusercontent.com/static/fonts/titilliumweb/v2/anMUvcNT0H1YN4FII8wpr24bNCNEoFTpS2BTjF6FB5E.woff)
		format('woff');
}

.btn1 {
	position: fixed;
	right: 0px;
	top: 50%;
	margin-top: -30px;
	width: 30px;
	height: 30px;
	cursor: pointer;
}

.side_panel {
	position: fixed;
	right: 0px;
	top: 0;
	width: 250px;
	height: 100%;
	background: #FFFFFF;
	border-left: 1px #D8D8D8 solid;
	z-index: 99;
	font-size: 11px;
}

.idsave {
	float: left;
	text-align: left;
	padding-left: 40px;
}

.button {
	width: 170px;
}

.button2 {
	width: 90px;
}

a {
	text-decoration: none;
}

.keyword {
	width: 150px;
	height: 22px;
	line-height: 22px;
	padding: 0 0 0 3px;
	border: 0;
	border-bottom: 1px #333 solid;
	font-size: 11px;
	color: #7c8389;
	background: #fff;
}
</style>

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



<body>
	<%-- <div class="side_panel" style="display: block" id="mySidebar">
      <center>
         <br> <br> <br> <br>
         <spring:message code="login.login" text="default text" />
         <br>


         <p class="id" style="padding-top: 10px">
            <input name="email" class="inputTypeText w3-padding-small"
               id="email" type="text"
               placeholder=<spring:message code="login.email" text="default text" />>
         </p>

         <p class="passwd">
            <input name="password" class="inputTypeText w3-padding-small"
               id="password" type="text"
               placeholder=<spring:message code="login.password" text="default text" />>
         </p>

         <span class="idsave"> <input type="checkbox" name="id_store"
            id="id_store" />&nbsp; <spring:message code="login.emailsave"
               text="default text" />
         </span> <br> <br>
         <p style="padding-top: 10px">
            <button class="w3-button w3-border w3-hover-grey button"
               onclick="location.href='<c:url value="/member/loginPro"/>'">
               <spring:message code="login.login" text="default text" />
            </button>
         </p>
         <p>
            <button class="w3-button w3-border w3-hover-grey button"
               onclick="location.href='<c:url value="/member/joinForm"/>'">
               <spring:message code="login.join" text="default text" />
            </button>
         </p>


         <a href="<c:url value="/member/emailFindForm"/>"><font
            color="#585858"><spring:message code="login.findemail"
                  text="default text" /></font></a> &nbsp; <a
            href="<c:url value="/member/passwordFindForm"/>"><font
            color="#585858"><spring:message code="login.findpasswd"
                  text="default text" /></font></a>

      </center>
   </div> --%>

	<div class="side_panel" style="display: block" id="mySidebar">
		<center>
			<br> <br> <br> <br> ${name } <br> <br>
			<c:if test="${email == null}">
				<button class="w3-button w3-border w3-hover-grey button2"
					onclick="#">로그인</button>
			</c:if>
			<c:if test="${email != null}">
				<button class="w3-button w3-border w3-hover-grey button2"
					onclick="#">로그아웃</button>
				<button class="w3-button w3-border w3-hover-grey button2"
					onclick="#">마이페이지</button>
			</c:if>

			<div>달력</div>

		</center>
	</div>

	<c:if
		test="${document.getElementById('mySidebar').style.display eq block}">
		<div class="w3-teal">
			<button id="openNav" class="btn1" onclick="w3_close()"
				style="right: 250px;">
				<i class="fa fa-arrow-right"></i>
			</button>
		</div>
	</c:if>

	<c:if
		test="${document.getElementById('mySidebar').style.display eq none}">
		<div class="w3-teal">
			<button id="openNav" class="btn1" onclick="w3_open()"
				style="right: 0px;">
				<i class="fa fa-arrow-left"></i>
			</button>
		</div>
	</c:if>

	<script>
      function w3_open() {
         document.getElementById("mySidebar").style.display = "block";
         document.getElementById("openNav").style.right = "250px";
      }
      function w3_close() {
         document.getElementById("mySidebar").style.display = "none";
         document.getElementById("openNav").style.right = "0px";
      }
   </script>

	<center>
		<div style="width: 65%;">
			<div
				style="border-bottom: 1px solid #D8D8D8; padding-bottom: 10px; text-align: right;">
				<br> <a class="menu1" href="/SYTeamProject/member/loginForm">
					<spring:message code="sidebar.login" text="default text" />
				</a> &nbsp;&nbsp;&nbsp;<a class="menu1"
					href="<c:url value="/member/joinForm"/>"><spring:message
						code="login.join" text="default text" /></a> &nbsp;&nbsp;&nbsp;<a
					class="menu1" href="#"> 마이페이지 </a><br>
			</div>

			<div class="headbar">
				<br> <a href="#"><img src="/SYTeamProject/images/logo2.png"
					width="190px" height="160px"><br></a> <br>
			</div>

			<div class="headbar">
				<center>
					<br> <a class="menu2" href="#"> <spring:message
							code="sidebar.place" text="default text" />
					</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="menu2" href="#">
						<spring:message code="sidebar.food" text="default text" />
					</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="menu2"
						href="/SYTeamProject/board/list"> <spring:message
							code="sidebar.board" text="default text" />
					</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="menu2" href="#"><spring:message
							code="sidebar.calendar" text="default text" /></a> <input
						name="search" class="inputTypeText keyword" id="search"
						type="text"> <a href="#"><img
						src="/SYTeamProject/images/search.PNG" width="24px" height="24px"></a>


					<br> <br> <br> <br>
				</center>
			</div>

		</div>
	</center>

</body>
</html>