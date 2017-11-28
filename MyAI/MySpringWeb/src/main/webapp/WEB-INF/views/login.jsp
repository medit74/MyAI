<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="login.jsp.title"/></title>
<style>
.error {
color: #ff0000;
font-style: italic;
}
</style>
</head>
<body>
	<spring:hasBindErrors name="userVo" />
	<form:errors path="userVo" />
	<spring:message code="login.jsp.title"/>
	<form method="post" action="loginProc.do">
	<table>
	    <tr>
	        <td><spring:message code="login.jsp.userId"/></td>
	        <td><input type="text" name="userId" value="${userVo.userId}"><form:errors path="userVo.userId" cssClass="error"/></td>
	    </tr>
	    <tr>
	        <td><spring:message code="login.jsp.userPw"/></td>
	        <td><input type="password" name="userPw"><form:errors path="userVo.userPw" cssClass="error"/></td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center"><input type="submit" value="<spring:message code="login.jsp.submit"/>"></td>
	    </tr>
	    
	</table>
	<p> ${message} </p>
	</form>
	<table>
	<tr>
        <td>Language</td>
        <td>
        <script type="text/javascript">
			function changeLocale(selval) {
				var value = selval.options[selval.selectedIndex].value;
				window.location.href="./loginForm.do?language="+value;
			}
		</script>
        <select onchange="changeLocale(this)">
        <option value="">==Select language==</option>
        <option value="en">English</option>
        <option value="ko">Korean</option>
        </select>
        </td>    
    </tr>
	</table>
</body>
</html>