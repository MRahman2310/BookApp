<%@page import="java.util.ArrayList"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>User APP</h1>
	<hr>
	<a href="index.jsp">Home </a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="login-signup.jsp">Login/SignUp </a>
	<hr>
	<c:if test="${sessionScope.msg!=null}">
		<p style="background-color: red; color: white; padding: 10px; text-align: center;">
			${sessionScope.msg}
		</p>
		<c:set var="msg" value="${null}" scope="session"  />
	</c:if>
	
	<h3>Search Product:</h3>
	<form action="SearchProduct" method="post">
		<label>Name:</label>
		<input type="search" name="name" required="required" /> <br><br>
		<button>Submit</button>
	</form>
</body>
</html>