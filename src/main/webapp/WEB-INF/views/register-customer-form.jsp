<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register | Perishables</title>
</head>
<body>
	<form:form method="POST" action="submit" modelAttribute="customer">
		<form:input path="name" />
		<form:input path="password" />
		<form:input path="email" />
		<form:input path="mobNo" />
		<form:input path="dob" />
		<input type="submit" value="register" />
	</form:form>
</body>
</html>