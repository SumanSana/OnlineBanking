
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="header.jsp"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create Customer</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>



<body>

<div class="container">

	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8" style="background-color:#F0F8FF;">
		
		<h2 style="text-align:center;">Transfer Money</h2>
		
		<c:if test="${not empty msg }">
			<c:choose>
				<c:when test="${fn:containsIgnoreCase(msg, 'Success')}">
					<br/>
					<h3 style="color:green;text-align:center;">${msg }</h3>
				</c:when>
				<c:when test="${fn:containsIgnoreCase(msg, 'Failure') }">
					<br/><h3 style="color:red;text-align:center;">${msg }</h3>
				</c:when>
			</c:choose>
			<c:remove var="msg" scope="session" />
		</c:if>
		<br/>
		
		<form class="form-horizontal" action="AccountManagement" method="POST">
		
				<input type="hidden" name="command" value="TRANSFER"/>
				
				<div class="form-group">
				  <label class="control-label col-sm-4" for="sourceAcId">Source Account ID :</label>
				  <div class="col-sm-8">
					<input type="number" class="form-control" id="sourceAcId" name="sourceAcId" required>
				  </div>
				</div>
				
				
				<div class="form-group">
				  <label class="control-label col-sm-4" for="targetAcId">Target Account ID :</label>
				  <div class="col-sm-8">
					<input type="number" class="form-control" id="targetAcId" name="targetAcId" required>
				  </div>
				</div>
				
				<div class="form-group">
				  <label class="control-label col-sm-4" for="transferAmount">Transfer Amount :</label>
				  <div class="col-sm-8">
					<input type="number" step=".01" class="form-control" id="transferAmount" name="transferAmount" required>
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