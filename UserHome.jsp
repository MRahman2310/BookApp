<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ page isELIgnored="false" %>


<c:choose>
<c:when test="${sessionScope.name==null}">
    <c:set var="msg" value="Please Login First!" scope="session"  />
    <% response.sendRedirect("login-signup.jsp"); %>
</c:when>
<c:otherwise>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>User APP</h1>
	<hr>
	<p>
		Welcome: ${sessionScope.name} &nbsp;&nbsp;&nbsp;
		<a href='UserHome.jsp'>Home </a> &nbsp;&nbsp;&nbsp;
		<a href='AllProducts.jsp'>Products </a> &nbsp;&nbsp;&nbsp;
		<a href='MyProducts.jsp'>My Products </a> &nbsp;&nbsp;&nbsp;
		<a href='Logout'>Logout </a>
	</p>
	<hr>
	<c:if test="${sessionScope.p_msg != null}">
		<c:choose>
		    <c:when test="${fn:contains(sessionScope.p_msg,'Success')}">
		        <p style="background-color: green; color: white; padding: 10px; text-align: center;">
		    </c:when>
		    <c:otherwise>
		        <p style="background-color: red; color: white; padding: 10px; text-align: center;">
		    </c:otherwise>
		</c:choose>
					${sessionScope.p_msg}
				</p>
		<c:set var="p_msg" value="${null}" scope="session"  />
	</c:if>
	
	<h3>Add New Product:</h3>
	<form action="AddProduct" method="post" enctype="multipart/form-data">
		<label>Name:</label>
		<input type='text' name='name' required /> <br><br>
		<label>Price:</label>
		<input type='text' pattern='[0-9]+' name='price' required /> <br><br>
		<label>Description:</label>
		<textarea rows='3' name='description' required></textarea> <br><br>
		<label>Image:</label>
		<input type='file' name='image' accept="image/*" /> <br><br>
		<label>Brochure Pdf:</label>
		<input type='file' name='brochure' accept=".pdf" /> <br><br>
		<button>Add</button>
	</form>
</body>
</html>


</c:otherwise>
</c:choose>