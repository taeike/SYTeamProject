<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
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

.main-menu:hover, nav.main-menu.expanded {
   width: 250px;
   overflow: visible;
}

.main-menu {
   background: #fbfbfb;
   border-right: 1px solid #e5e5e5;
   position: absolute;
   top: 0;
   bottom: 0;
   height: 100%;
   left: 0;
   width: 40px;
   overflow: hidden;
   -webkit-transition: width .05s linear;
   transition: width .05s linear;
   -webkit-transform: translateZ(0) scale(1, 1);
   z-index: 1000;
}

.main-menu>ul {
   margin: 100px 0 0 0;
}

.main-menu li {
   position: relative;
   display: block;
   width: 100%;
   margin: 20px 0 0 0;
}

.main-menu li>a {
   position: relative;
   display: table;
   border-collapse: collapse;
   border-spacing: 0;
   color: #999;
   font-family: arial;
   font-size: 14px;
   text-decoration: none;
   -webkit-transform: translateZ(0) scale(1, 1);
   -webkit-transition: all .1s linear;
   transition: all .1s linear;
}

.main-menu .nav-text {
   padding-left: 10%;
   position: relative;
   display: table-cell;
   vertical-align: middle;
   width: 100%;
   font-family: 'Titillium Web', sans-serif;
   position: relative;
}

.main-menu>ul.logout {
   position: absolute;
   left: 3px;
   bottom: 0;
}

.no-touch .scrollable.hover {
   overflow-y: hidden;
}

.no-touch .scrollable.hover:hover {
   overflow-y: auto;
   overflow: visible;
}

a:hover, a:focus {
   text-decoration: none;
}

nav {
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   -o-user-select: none;
   user-select: none;
}

nav ul, nav li {
   outline: 0;
   margin: 0;
   padding: 0;
}

.main-menu li:hover>a, nav.main-menu li.active>a, .dropdown-menu>li>a:hover,
   .dropdown-menu>li>a:focus, .dropdown-menu>.active>a, .dropdown-menu>.active>a:hover,
   .dropdown-menu>.active>a:focus, .no-touch .dashboard-page nav.dashboard-menu ul li:hover a,
   .dashboard-page nav.dashboard-menu ul li.active a {
   color: #fff;
   background-color: #5fa2db;
}

.sidebar {
   float: left;
   background: #e2e2e2;
   width: 100%;
   height: 100%;
}

@font-face {
   font-family: 'Titillium Web';
   font-style: normal;
   font-weight: 300;
   src: local('Titillium WebLight'), local('TitilliumWeb-Light'),
      url(http://themes.googleusercontent.com/static/fonts/titilliumweb/v2/anMUvcNT0H1YN4FII8wpr24bNCNEoFTpS2BTjF6FB5E.woff)
      format('woff');
}
</style>
<body>
   <div class=headbar style="border-bottom: 1px solid #e5e5e5;">
      <center>
         <a href="#"><img src="logo.png" width="150px" height="105px"></a>
      </center>

   </div>
   <div class="sidebar"></div>
   <nav class="main-menu">
   <ul>
      <c:if test="${email == null}">
         <li><a href="/SYTeamProject/member/loginForm"> <i
               class="w3-xxlarge glyphicon glyphicon-user"></i> <span
               class="nav-text"><spring:message code="sidebar.login"
                     text="default text" /> </span>
         </a></li>
      </c:if>
      <li><a href="#"> <i class="w3-xxlarge material-icons">directions_car</i>
            <span class="nav-text"> <spring:message code="sidebar.place"
                  text="default text" /></span>
      </a></li>
      <li><a href="#"><i class="w3-xxlarge material-icons">restaurant</i><span
            class="nav-text"> <spring:message code="sidebar.food"
                  text="default text" />
         </span> </a></li>
      <li><a href="/SYTeamProject/board/list"><i class="w3-xxlarge fa fa-list-alt"></i><span
            class="nav-text"> <spring:message code="sidebar.board"
                  text="default text" />
         </span> </a></li>

      <li><a href="#"><i class="w3-xxlarge fa fa-calendar-check-o"></i><span
            class="nav-text"><spring:message code="sidebar.calendar"
                  text="default text" /></span> </a></li>
   </ul>
   <c:if test="${email != null}">
      <ul class="logout">
         <li><a href="/SYTeamProject/member/logout"> <i class="w3-xxlarge fa fa-power-off"></i>
               <span class="nav-text"> 로그아웃 </span>
         </a></li>
      </ul>
   </c:if> </nav>
</body>
</html>