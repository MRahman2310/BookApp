<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.incapp.entity.Product"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ page isELIgnored="false" %>


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
	<c:choose>
	    <c:when test="${empty products}">
	        <p style='color:red;'>Product Not Found!</p>
	    </c:when>
	    <c:otherwise>
	    	<section style='display:flex;'>
		        <c:forEach items="${products}" var="p">
					<div style='background-color:yellow; padding:20px;margin:5px;'>
						<p>Id: ${p.id} </p>
						<p>Name: ${p.name} </p>
						<p>Price: ${p.price} </p>
						<p>Description: ${p.description} </p>
					</div>
				</c:forEach>
			</section>
	    </c:otherwise>
	</c:choose>
</body>
</html>