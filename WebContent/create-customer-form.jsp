<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <%-- 
 <%
 	if((String)session.getAttribute("username")==null){
 		String contextPath = request.getContextPath();
 		response.sendRedirect(response.encodeRedirectURL(contextPath + "/login.jsp")); 
 	}
 %>
 --%>

 
 
<jsp:include page="header.jsp"/>

<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create Customer</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
</head>
<body>
<div class="container">
	<p><p>
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8" style="background-color:#F0F8FF;">
		<h2 style="text-align:center;">Create Customer</h2>
		<br/>
		<c:if test="${not empty customerId }">
			<c:choose>
				<c:when test="${customerId == -1 }">
					<h3 style="text-align:center;color:red">Failure : Account Creation failed !!</h3>
					<br/>
				</c:when>
				<c:when test="${customerId > 0 }">
					<h3 style="text-align:center;color:green">Successful : Customer is Created !!</h3>
					<h3 style="text-align:center;color:green">Customer Id : ${customerId } </h3>
					<br/>
				</c:when>
			</c:choose>
			<c:remove var="customerId" scope="session" />
		</c:if>
		<form class="form-horizontal" action="CustomerManagement" method="POST">
				<input type="hidden" name="command" value="CREATE"/>
				<div class="form-group">
				  <label class="control-label col-sm-4" for="name">Customer Name :</label>
				  <div class="col-sm-8">
					<input type="text" class="form-control" id="name" name="name" required>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-4" for="age">Age :</label>
				  <div class="col-sm-8">
					<input type="number" class="form-control" id="age" name="age" required>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-4" for="address">Address :</label>
				  <div class="col-sm-8">
					<input type="text" class="form-control" id="address" name="address" required>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-4" for="state">State :</label>
				  <div class="col-sm-8">
					<input type="text" class="form-control" id="state" name="state" required>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-4" for="city">City :</label>
				  <div class="col-sm-8">
					<input type="text" class="form-control" id="city" name="city" required>
				  </div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8 text-center">
					<button type="submit" class="btn btn-success btn-lg">Create Customer</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
</div>
</body>
</html>