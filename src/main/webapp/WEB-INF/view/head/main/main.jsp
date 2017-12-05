<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {
	display:none;
}
.w3-left, .w3-right, .w3-badge {
	cursor:pointer;
}
.w3-badge {
	height:13px;
	width:13px;
	padding:0;
}

a{
 text-decoration:none;
}
.num{
	display: inline-block;
	width: 19px;
	height: 19px;
	border: 1px sold #e5e6e8;
	background: #f2f4f8;
	font-family: Tahoma;
	color: #8c8e92;
	text-align: center;
}
div{
	display: block;
}

</style>
<body>


<div class="w3-content w3-display-container" style="max-width:60%;">
  <img class="mySlides" src="https://www.w3schools.com/w3css/img_nature_wide.jpg" style="width:100%; height:500px;">
  <img class="mySlides" src="https://www.w3schools.com/w3css/img_fjords_wide.jpg" style="width:100%; height:500px;">
  <img class="mySlides" src="https://www.w3schools.com/w3css/img_mountains_wide.jpg" style="width:100%; height:500px;">
  <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
  </div>
</div>

<div class="w3-content" style="max-width:57%; margin-top:50px;">
	<div class="w3-third" style="width:45%">
		<h5>관광지 TOP5  <span style="padding-left:65%;"><a href="#">more+</a></span></h5>
	</div>
	
	<div class="w3-third" style="width:10%">&nbsp;</div>
	
	<div class="w3-third" style="width:45%">
		<h5>리뷰 TOP5 <span style="padding-left:70%;"><a href="#">more+</a></span></h5>
	</div>
</div>

<div class="w3-content w3-row-padding" style="max-width:58%; ;margin-top:5px;">
	<div class="w3-third" style="border: 2px solid grey; padding-left:25px;  border-radius: 5px; width:45%">
		<table style="margin-top:10px; margin-bottom:10px;">
			<tr>
				<td class="num">1</td>  
				<td width="30">&nbsp;</td>
				<td><a href="#">최진영</a></td>
			</tr>
			
			<tr>
				<td class="num">2</td> 
				<td width="30">&nbsp;</td>
				<td><a href="#">허진</a></td>
			</tr>
			
			<tr>
				<td class="num">3</td>  
				<td width="30">&nbsp;</td>
				<td><a href="#">진유영</a></td>
			</tr>
			
			<tr>
				<td class="num">4</td>  
				<td width="30">&nbsp;</td>
				<td><a href="#">최누리</a></td>
			</tr>
			<tr>
				<td class="num">5</td>  
				<td width="30">&nbsp;</td>
				<td><a href="#">김태익</a></td>
			</tr>
		</table>
	</div>
	
	<div class="w3-third" style="width:10%">&nbsp;</div>
	
	<div class="w3-third" style="border: 2px solid grey; border-radius:5px; padding-left:25px;  width:45%">
		<table style="margin-top:10px; margin-bottom:10px;">
			<tr>
				<td class="num">1</td>  
				<td width="30">&nbsp;</td>
				<td><a href="#">최진영</a></td>
			</tr>
			
			<tr>
				<td class="num">2</td>  
				<td width="30">&nbsp;</td>
				<td><a href="#">허진</a></td>
			</tr>
			
			<tr>
				<td class ="num">3</td>  
				<td width="30">&nbsp;</td>
				<td><a href="#">진유영</a></td>
			</tr>
			
			<tr>
				<td class ="num">4</td>  
				<td width="30">&nbsp;</td>
				<td><a href="#">최누리</a></td>
			</tr>
			<tr>
				<td class ="num">5</td>  
				<td width="30">&nbsp;</td>
				<td><a href="#">김태익</a></td>
			</tr>
		</table>
	</div>	
</div>

<div class="w3-content" style="max-width:57%; ;margin-top:60px; border: 2px solid grey; padding-left:25px;  border-radius: 5px;">

<br><br>
${line1}
${line2}
${line3}
<br><br>

</div>

<br><br><br><br>




<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}

</script>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    var dots = document.getElementsByClassName("demo");
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" w3-white", "");
     }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    dots[myIndex-1].className += " w3-white";
    
   
    
    setTimeout(carousel, 3000); 
}
</script>

</body>
</html>