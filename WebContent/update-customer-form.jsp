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
	<title>Create Customer</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<style>
  	</style>
</head>
<body>
<div class="container">
	<p><p>
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8" style="background-color:#F0F8FF;">
		<h2 style="text-align:center;">Update Customer</h2>
		<form class="form-horizontal" action="CustomerManagement" method="POST">
				<input type="hidden" name="command" value="UPDATE"/>
				<div class="form-group">
				  <label class="control-label col-sm-4" for="customerId">Customer Id :</label>
				  <div class="col-sm-8">
					<input type="number" class="form-control" id="customerId" name="customerId" value="${The_Customer.id }" readonly>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-4" for="name">Customer Name :</label>
				  <div class="col-sm-8">
					<input type="text" class="form-control" id="name" name="name" value="${The_Customer.name}" readonly>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-4" for="age"><span style="text-align:left;">Age :</span></label>
				  <div class="col-sm-8">
					<input type="text" class="form-control" id="age" name="age" value="${The_Customer.age }" required>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-4" for="address">Address :</label>
				  <div class="col-sm-8">
					<input type="text" class="form-control" id="address" name="address" value="${The_Customer.address }" required>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-4" for="state">State :</label>
				  <div class="col-sm-8">
					<input type="text" class="form-control" id="state" name="state" value="${The_Customer.state }" required>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-4" for="city">City :</label>
				  <div class="col-sm-8">
					<input type="text" class="form-control" id="city" name="city" value="${The_Customer.city }" required>
				  </div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8 text-center">
					<button type="submit" class="btn btn-success btn-lg">Submit</button>
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