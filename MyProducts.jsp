<%@page import="com.incapp.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.incapp.HbUtility"%>
<%@page import="org.hibernate.SessionFactory"%>

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
	<c:if test="${sessionScope.d_msg != null}">
		<c:choose>
		    <c:when test="${fn:contains(sessionScope.d_msg,'Success')}">
		        <p style="background-color: green; color: white; padding: 10px; text-align: center;">
		    </c:when>
		    <c:otherwise>
		        <p style="background-color: red; color: white; padding: 10px; text-align: center;">
		    </c:otherwise>
		</c:choose>
					${sessionScope.d_msg}
				</p>
		<c:set var="d_msg" value="${null}" scope="session"  />
	</c:if>
	
	<section style='display:grid;grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));'>
	<%
	SessionFactory sessionFactory = HbUtility.getSessionFactory();
	Session ses = sessionFactory.openSession();
	String email=(String)session.getAttribute("email");
	List<Product> products = ses.createQuery("select p from Product p where p.userEmail =:userEmail").setParameter("userEmail",email).list();
	ses.close();
	request.setAttribute("products",products);
	%>
	<c:choose>
	    <c:when test="${empty products}">
	        <p style='color:red;'>No Product!</p>
	    </c:when>
	    <c:otherwise>
	    	<section style='display:flex;'>
		        <c:forEach items="${products}" var="p">
					<div style='background-color:yellow; padding:20px;margin:5px;'>
						<c:choose>
						    <c:when test="${empty p.image}">
						        <img src="images/product.png" height="50px" alt="">
						    </c:when>
						    <c:otherwise>
						        <img src="GetImage?id=${p.id}" height="50px" alt="">
						    </c:otherwise>
						</c:choose>
						<p>Id: ${p.id} </p>
						<p>Name: ${p.name} </p>
						<p>Price: ${p.price} </p>
						<p>Description: ${p.description} </p>
						
						<a href="DeleteProduct?id=${p.id}">Delete</a>
						<br><br>
						<!-- or -->
						<form action="DeleteProduct" method="post">
							<input type="hidden" name="id" value="${p.id}" />
							<button>Delete</button>
						</form>
						
						<c:if test="${!empty p.brochure}">
							<hr>
							<a href="DownloadBrochure?id=${p.id}">Brochure Download</a>
						</c:if>
					</div>
				</c:forEach>
			</section>
	    </c:otherwise>
	</c:choose>
	
	</section>
</body>
</html>


</c:otherwise>
</c:choose>