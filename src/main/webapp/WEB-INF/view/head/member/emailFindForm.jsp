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
.emailbtn {
   font-size: 11px;
   color: #FAFAFA;
   background-color: #424242;
   width: 80px;
   text-align: center;
}

.td_left {
   padding-left: 15px;
}

.font {
   font-size: 11px;
}
</style>

<script>
   function checkIt() {

      var userinput = eval("document.userinput");

      if (!userinput.name.value) {
         var value = '<spring:message code="login.message_entername" javaScriptEscape="true" />'
         alert(value);
         userinput.name.focus();
         return false;
      }

      if (!userinput.number.value) {
         var value = '<spring:message code="login.message_enterphone" javaScriptEscape="true" />'
         alert(value);
         userinput.number.focus();
         return false;
      }
   }
</script>
<body>

   <center>
      <div style="width: 1200px; font-size: 12px; margin-top: 60px;">
         <form action="emailFindPro" method="post" onSubmit="return checkIt()"
            class="form-inline" name="userinput">
            <table style="width: 520px">
               <tr>
                  <td><legend>

                        <h5>
                           <spring:message code="login.findemail" text="default text" />
                        </h5>

                     </legend></td>
                  <td><legend>
                        <h5>&nbsp;</h5>
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
                  <td width="180px" class="td_left"><spring:message
                        code="login.name" text="default text" /></td>
                  <td width="400px"><input type="text" name="name" id="name"
                     class="form-control font" size="15" maxlength="10"></td>
               </tr>

               <tr>
                  <td>&nbsp;</td>
               </tr>

               <tr>
                  <td width="180px" class="td_left"><spring:message
                        code="login.phone" text="default text" /></td>
                  <td width="400px" class="font"><input type="text"
                     name="pnumber" id="pnumber" class="form-control font" size="20"
                     maxlength="15">&nbsp;&nbsp;&nbsp;<spring:message
                        code="login.guide1" text="default text" />&nbsp;&nbsp;</td>
               </tr>

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
                  <td colspan="2" class="w3-center"><center>
                        <input type="submit" name="emailfind" class="btn emailbtn"
                           value=<spring:message code="login.findemail" text="default text" />>
                        <input type="button" class="btn emailbtn"
                           value=<spring:message code="login.findpasswd" text="default text" />
                           onclick="location.href='<c:url value="/member/passwordFindForm"/>'">
                        <input type="button" class="btn emailbtn"
                           value=<spring:message code="login.cancel" text="default text" />
                           onclick="location.href='<c:url value="/member/main"/>'">
                     </center></td>
               </tr>


            </table>

         </form>
      </div>
   </center>
</body>
</html>
