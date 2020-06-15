<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>

<jsp:include page="header.jsp"/>


<c:if test="${not empty msg }">
	<script type="text/javascript">
		alert("Soory ! Customer with multiple accounts can't be deleated !!")
	</script>
	<c:remove var="msg" scope="session"/>
</c:if>

<div id="container">
	<div id="content">
		<input type="button" value="Create Customer" 
				   onclick="window.location.href='create-customer-form.jsp'; return false;"
				   class="customer-button"
		/>
		<br/><br/>
		<form action="CustomerManagement" method="POST">
		    <input type="hidden" name="command" value="SEARCH" />
			Search Customer : <input type="text" name="searchkwd" />
			<input type="submit" value="Search" class="search-button" />
		</form>
		<br/><br/>
		<table border="1" style="width: 100%; height: 100%;">
			<tr>
				<th>Customer Id</th><th>Customer Name</th><th colspan="3">Actions</th>
			</tr>
			<c:forEach var="customer" items="${Customer_List}">
			<!-- Set up update link for each customer -->
			
			<c:url var="details" value="CustomerManagement">
				<c:param name="command" value="DETAILS" />
				<c:param name="customerId" value="${customer.id}" />
			</c:url>
			
			<c:url var="updateLink" value="CustomerManagement">
				<c:param name="command" value="LOAD"/>
				<c:param name="customerId" value="${customer.id}"/>
			</c:url>
			<c:url var="deleteLink" value="CustomerManagement">
				<c:param name="command" value="DELETE" />
				<c:param name="customerId" value="${customer.id}" />
			</c:url>
			
			<tr>
				<!-- As we use jstl tag customer.firstName will call customer.getFirstName() automatically -->
				<td><h5>${customer.id}</h5></td>
				<td><h5>${customer.name}</h5></td>
				<td><a href="${details}">View</a></td>
				<td><a href="${updateLink}">Update</a></td>
				<td><a href="${deleteLink}"onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>	</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<br/><br/><br/>
</div>

</body>
</html>

<jsp:include page="footer.jsp"/>