 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
	<title>View Account</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<style>
  	</style>
</head>

<body>

<div class="container">

	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8" style="background-color:#F0F8FF;">
		
		<h2 style="text-align:center;">View Account</h2>
		
		<c:if test="${not empty msg }">
			<h3 style="text-align:center;color:red;">${msg }</h3>
			<c:remove var="msg" scope="session" />
		</c:if>
		<br/>
		
		<form class="form-horizontal" action="AccountManagement" method="POST">
		
				<input type="hidden" name="command" value="VIEW"/>
				
				<div class="form-group">
				  <label class="control-label col-sm-4" for="accountId">Account ID :</label>
				  <div class="col-sm-8">
					<input type="number" class="form-control" id="accountId" name="accountId" required>
				  </div>
				</div>
				
				<div class="form-group">
				  <label class="control-label col-sm-4" for="accountType">Account Type :</label>
				  <div class="col-sm-8">
					<select class="form-control" id="accountType" name="accountType">
						<option value="Savings">Savings</option>
						<option value="Current">Current</option>
						<option value="Fixed Deposit">Fixed Deposit</option>
					</select>
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