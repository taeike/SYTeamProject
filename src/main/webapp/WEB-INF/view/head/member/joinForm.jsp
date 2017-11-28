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
select {
	width: 90px;
	height: 30px;
	padding-left: 10px;
	font-size: 13px;
	border: 1px solid border-radius: 3px;
}
div{
margin-top: 100px;
}
</style>

<script>
	function checkIt() {
		
		
		
		var userinput = eval("document.userinput");

		if (!userinput.email.value) {
			var value= '<spring:message code="login.message_enteremail" javaScriptEscape="true" />'
			alert(value);
			userinput.email.focus();
			return false;
		}

		if (!userinput.name.value) {
			var value= '<spring:message code="login.message_entername" javaScriptEscape="true" />'
			alert(value);
			userinput.name.focus();
			return false;
		}

		if (!userinput.password.value) {
			var value= '<spring:message code="login.message_enterpw" javaScriptEscape="true" />'
				alert(value);
			userinput.password.focus();
			return false;
		}

		if (userinput.password.value != userinput.password2.value) {
			var value= '<spring:message code="login.message_enterpsamepw" javaScriptEscape="true" />'
				alert(value);
			userinput.password2.focus()
			return false;
		}

		if (!userinput.year.value) {
			var value= '<spring:message code="login.message_enteryear" javaScriptEscape="true" />'
				alert(value);
			userinput.year.focus();
			return false;
		}

		if (!userinput.mon.value) {
			var value= '<spring:message code="login.message_entermonth" javaScriptEscape="true" />'
				alert(value);
			userinput.year.focus();
			return false;
		}

		if (!userinput.day.value) {
			var value= '<spring:message code="login.message_enterday" javaScriptEscape="true" />'
			alert(value);
			userinput.year.focus();
			return false;
		}

		if (userinput.idchk.value != "Y") {
			var value= '<spring:message code="login.message_checkemail" javaScriptEscape="true" />'
				alert(value);
			userinput.idchk.focus();
			return false;
		}
	}

	function openConfirmid(userinput) {
	
		if (userinput.email.value == "") {
			var value= '<spring:message code="login.message_entername" javaScriptEscape="true" />'
			alert(value);
			return;
		}

		url = "confirmId?email=" + encodeURIComponent(userinput.email.value);
		open(
				url,
				"confirm",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=200");
	}
</script>
<body>
	

	<center>
	<div>
		<form action="joinPro" method="post" onSubmit="return checkIt()"
			class="form-inline" name="userinput">

			<table style="width: 40%;">

				<tr>
					<td><legend>
							<h3><spring:message code="login.join" text="default text" /></h3>
						</legend></td>
					<td><legend>
							<h3>&nbsp;</h3>
						</legend></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>


				<tr>
					<td width="200"><center><spring:message code="login.email" text="default text" /></center></td>
					<td width="400"><input type="text" name="email" id="email"
						class="form-control" size="40" maxlength="35"> <input
						type="hidden" name="idchk"> <input type="button"
						name="confirm_id" class="btn" value=<spring:message code="login.confirmoverlap" text="default text" />
						OnClick="openConfirmid(this.form)"></td>
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
					<td width="200"><center><spring:message code="login.password" text="default text" /></center></center></td>
					<td width="400"><input type="password" name="password"
						id="password" class="form-control" size="25" maxlength="20"></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td width="200"><center><spring:message code="login.confirmpwd" text="default text" /></center></td>
					<td width="400"><input type="password" name="password2"
						id="password2" class="form-control" size="25" maxlength="20"></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td width="200"><center><spring:message code="login.phone" text="default text" /></center></td>
					<td width="400"><input type="text" name="pnumber" id="pnumber"
						class="form-control" size="20" maxlength="15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="login.guide1" text="default text" /></td>
				</tr>
						
				<tr>
					<td>&nbsp;</td>
				</tr>		
				
						
				<tr>
					<td width="200"><center><spring:message code="login.birth" text="default text" /></center></td>
					<td class="lLine" colspan="5"><select name="year"
						class="form-control">
							<option value="0"><spring:message code="login.y" text="default text" /></option>
							<option value="2017">2017</option>
							<option value="2016">2016</option>
							<option value="2015">2015</option>
							<option value="2014">2014</option>
							<option value="2013">2013</option>
							<option value="2012">2012</option>
							<option value="2011">2011</option>
							<option value="2010">2010</option>
							<option value="2009">2009</option>
							<option value="2008">2008</option>
							<option value="2007">2007</option>
							<option value="2006">2006</option>
							<option value="2005">2005</option>
							<option value="2004">2004</option>
							<option value="2003">2003</option>
							<option value="2002">2002</option>
							<option value="2001">2001</option>
							<option value="2000">2000</option>
							<option value="1999">1999</option>
							<option value="1998">1998</option>
							<option value="1997">1997</option>
							<option value="1996">1996</option>
							<option value="1995">1995</option>
							<option value="1994">1994</option>
							<option value="1993">1993</option>
							<option value="1992">1992</option>
							<option value="1991">1991</option>
							<option value="1990">1990</option>
							<option value="1989">1989</option>
							<option value="1988">1988</option>
							<option value="1987">1987</option>
							<option value="1986">1986</option>
							<option value="1985">1985</option>
							<option value="1984">1984</option>
							<option value="1983">1983</option>
							<option value="1982">1982</option>
							<option value="1981">1981</option>
							<option value="1980">1980</option>
							<option value="1979">1979</option>
							<option value="1978">1978</option>
							<option value="1977">1977</option>
							<option value="1976">1976</option>
							<option value="1975">1975</option>
							<option value="1974">1974</option>
							<option value="1973">1973</option>
							<option value="1972">1972</option>
							<option value="1971">1971</option>
							<option value="1970">1970</option>
							<option value="1969">1969</option>
							<option value="1968">1968</option>
							<option value="1967">1967</option>
							<option value="1966">1966</option>
							<option value="1965">1965</option>
							<option value="1964">1964</option>
							<option value="1963">1963</option>
							<option value="1962">1962</option>
							<option value="1961">1961</option>
							<option value="1960">1960</option>
							<option value="1959">1959</option>
							<option value="1958">1958</option>
							<option value="1957">1957</option>
							<option value="1956">1956</option>
							<option value="1955">1955</option>
							<option value="1954">1954</option>
							<option value="1953">1953</option>
							<option value="1952">1952</option>
							<option value="1951">1951</option>
							<option value="1950">1950</option>
							<option value="1949">1949</option>
							<option value="1948">1948</option>
							<option value="1947">1947</option>
							<option value="1946">1946</option>
							<option value="1945">1945</option>
							<option value="1944">1944</option>
							<option value="1943">1943</option>
							<option value="1942">1942</option>
							<option value="1941">1941</option>
							<option value="1940">1940</option>
							<option value="1939">1939</option>
							<option value="1938">1938</option>
							<option value="1937">1937</option>
							<option value="1936">1936</option>
							<option value="1935">1935</option>
							<option value="1934">1934</option>
							<option value="1933">1933</option>
							<option value="1932">1932</option>
							<option value="1931">1931</option>
							<option value="1930">1930</option>
							<option value="1929">1929</option>
							<option value="1928">1928</option>
							<option value="1927">1927</option>
							<option value="1926">1926</option>
							<option value="1925">1925</option>
							<option value="1924">1924</option>
							<option value="1923">1923</option>
							<option value="1922">1922</option>
							<option value="1921">1921</option>
							<option value="1920">1920</option>
							<option value="1919">1919</option>
							<option value="1918">1918</option>
							<option value="1917">1917</option>
							<option value="1916">1916</option>
							<option value="1915">1915</option>
							<option value="1914">1914</option>
							<option value="1913">1913</option>
							<option value="1912">1912</option>
							<option value="1911">1911</option>
							<option value="1910">1910</option>
							<option value="1909">1909</option>
							<option value="1908">1908</option>
							<option value="1907">1907</option>
							<option value="1906">1906</option>
							<option value="1905">1905</option>
							<option value="1904">1904</option>
							<option value="1903">1903</option>
							<option value="1902">1902</option>
							<option value="1901">1901</option>
							<option value="1900">1900</option>
					</select> <select name="month" class="form-control">
							<option value="0"><spring:message code="login.m" text="default text" /></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select> <select name="day" class="form-control">
							<option value="0"><spring:message code="login.d" text="default text" /></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
					</select></td>
				</tr>
						<tr><td>&nbsp;</td></tr> <tr><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
					<td colspan="2" class="w3-center"><center><input type="submit"
						name="confirm" class="btn" value=<spring:message code="login.register" text="default text" />> 
						<input type="button" class="btn" value="&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;"
						onclick="location.href='<c:url value="/member/main"/>'"></center></td>
				</tr>
			</table>
		</form>
		</div>
	</center>
</body>
</html>

<script type="text/javascript">
	function goReplace(str) {
		location.replace(str);
	}
</script>