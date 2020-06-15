<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%
 	if((String)session.getAttribute("username")==null){
 		String contextPath = request.getContextPath();
 		response.sendRedirect(response.encodeRedirectURL(contextPath + "/login.jsp")); 
 	}
 %>
 <jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<h3>Id : ${The_Customer.id }</h3>
	<h3>Name : ${The_Customer.name }</h3>
	<h3>Age : ${The_Customer.age }</h3>
	<h3>Address : ${The_Customer.address }</h3>
	<h3>State : ${The_Customer.state }</h3>
	<h3>City : ${The_Customer.city }</h3>
	
</body>
</html>