<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="content">
		<h2>Customer ID : ${The_Customer.id }</h2>

		<c:url var="details" value="CustomerManagement">
			<c:param name="command" value="DETAILS" />
			<c:param name="customerId" value="${The_Customer.id}" />
		</c:url>
		<a href="${details }"><h2>Name : ${The_Customer.name }</h2></a>
		<hr>
		<h2>Account Details :</h2>
		<br/>
		<h2>Account ID : ${The_Account.accountId }</h2>
		<br/>
		<h2>Account Type : ${The_Account.accountType }</h2>
		<br/>
		<h2>Balance : ${The_Account.balance }</h2>
	</div>
</div>
</body>
</html>