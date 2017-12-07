<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/SYTeamProject/css/startButtonStyle.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   var input="<div class='set-intro'><span class='round kr'> <a href='/SYTeamProject/start/main?lang=ko'"+
   "class='icon'>한국어</a></span><span class='round en'> <a href='/SYTeamProject/start/main?lang=en' class='icon'>English</a></span><span class='round jp'> <a href='/SYTeamProject/start/main?lang=jp'"+
   "class='icon'>日本</a> </span><span class='round ch'> <a href='/SYTeamProject/start/main?lang=ch'"+
   "class='icon'>中国</a> </span></div>";
   
   var interval = 3000;
   var n = 0;
   var imgs = new Array("/SYTeamProject/images/startformimage/7.png","/SYTeamProject/images/startformimage/1.jpg","/SYTeamProject/images/startformimage/1.jpg");
   var count = 0;
   function rotate() {
      if(count == 0) setTimeout("rotate()", 2500);
      if(count == 1) setTimeout("rotate()", 1000);
      if(count == 2){
           var div_test = document.getElementById('dv');
            div_test.innerHTML  += input;
      }
      if (navigator.appName == "Netscape" && document.getElementById) {
         document.getElementById("backgourndPhoto").src = imgs[n];
      } else
         document.images.slide.src = imgs[n];
      (n == (imgs.length - 1)) ? n = 0 : n++;
      count ++;
   }
</script>
<script>
   $(document).ready(function() {
      $("p").fadeOut(2500);
      $("p").fadeIn(1000);
   });
</script>
<style type="text/css">
html, body {
   height: 100%;
   margin: -30px;
   padding: 0;
}

#page-background {
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
}

#content {
   position: relative;
   z-index: 1;
   padding: 0px;
}
</style>

<style>
webkit-scrollbar {
   display: none;
}
</style>
<%System.out.println("intit startForm.jsp.."); %>
</head>
<body style="-ms-overflow-style: none;" onload="rotate()">
   
   <p id="dv">
      <img id="backgourndPhoto" style="width: 100%; height: 100%" alt="" />
   </p>


</body>
</html>