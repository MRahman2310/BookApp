<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	section{
		display:flex;
		gap:30px;
	/* 	justify-content: center; */
	}
	section>div{
		background-color: lightblue;
		padding: 20px;
		border-radius: 15px;
	}
</style>
</head>
<body>
	<h1>User APP</h1>
	<hr>
	<a href="index.jsp">Home </a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="login-signup.jsp">Login/SignUp </a>
	<hr>
	
	<c:if test="${sessionScope.msg != null}">
		<c:choose>
		    <c:when test="${fn:contains(sessionScope.msg,'Success')}">
		        <p style="background-color: green; color: white; padding: 10px; text-align: center;">
		    </c:when>
		    <c:otherwise>
		        <p style="background-color: red; color: white; padding: 10px; text-align: center;">
		    </c:otherwise>
		</c:choose>
					${sessionScope.msg}
				</p>
		<c:set var="msg" value="${null}" scope="session"  />
	</c:if>
	
	<section>
		<div>
			<h3>Login:</h3>
			<form action="Login" method="post">
				<label>Email:</label>
				<input type="email" name="email" required="required" /> <br><br>
				<label>Password:</label>
				<input type="password" name="password" required="required" /> <br><br>
				<button>Submit</button>
			</form>
		</div>
		<div>
			<h3>Sign Up:</h3>
			<form action="Register" method="post">
				<label>Name:</label>
				<input type="text" name="name" pattern="[a-zA-Z ]+" maxlength="25" required="required" /> <br><br>
				<label>Phone:</label>
				<input type="tel" name="phone" pattern="[0-9]+" maxlength="10" minlength='10' required="required" /> <br><br>
				<label>Email:</label>
				<input type="email" name="email" required="required" /> <br><br>
				<label>Password:</label>
				<input type="password" name="password" required="required" /> <br><br>
				<button>Submit</button>
			</form>
		</div>
	</section>
</body>
</html>