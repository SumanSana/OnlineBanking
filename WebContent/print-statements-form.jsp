
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
		
		<h2 style="text-align:center;">Print Statement</h2>
		
		<c:if test="${not empty msg }">
			<h3 style="text-align:center;color:red;">${msg }</h3>
			<c:remove var="msg" scope="session" />
		</c:if>
		<br/>
		
		<form class="form-horizontal" action="AccountManagement" method="POST" >
		
				<input type="hidden" name="command" value="PRINTSTATEMENT"/>
				
				<div class="form-group">
				  <label class="control-label col-sm-4" for="accountId">Account ID :</label>
				  <div class="col-sm-8">
					<input type="text" class="form-control" id="accountId" name="accountId" required>
				  </div>
				</div>
				
				<div class="form-group">
				  <label class="control-label col-sm-4" for="startDate">Start Date :</label>
				  <div class="col-sm-8">
					<input type="date" class="form-control" id="startDate" name="startDate" required>
				  </div>
				</div>
				
				<div class="form-group">
				  <label class="control-label col-sm-4" for="endDate">End Date :</label>
				  <div class="col-sm-8">
					<input type="date" class="form-control" id="endDate" name="endDate" required>
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