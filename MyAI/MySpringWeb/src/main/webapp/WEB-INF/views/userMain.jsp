<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="userMain.jsp.title"/></title>
</head>
<body>
	<spring:message code="userMain.jsp.welcome" arguments="${userVo.userName}"/>
</body>
</html>