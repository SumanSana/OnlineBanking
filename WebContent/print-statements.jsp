<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>

<jsp:include page="header.jsp"/>


<div id="container">
	<div id="content">
		<h3 style="color:green;">Account Id : ${accountId }</h1>
		<br/>
		<h3 style="color:green;">Name : ${name }</h1>
		<br/>
		<h3 style="color:green;">Current Balance : ${curBal }</h1>
		<br/>
		
		
		<c:if test="${Statement_List.size() > 0 }">
			<hr>
			<table border="1" style="width: 100%; height: 100%;">
				<tr>
					<th>Date</th><th>Amount</th><th >Remark</th>
				</tr>
				<c:forEach var="statement" items="${Statement_List}">
				
				
				<tr>
					<td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${statement.date }" /></td>
					<td>
					<c:choose>
						<c:when test = "${fn:containsIgnoreCase(statement.remark, 'Credit')}">
							<span style="color:green"> &#2352; ${statement.amount } (Cr)</span>
						</c:when>
						<c:otherwise>
							 <span style="color:red"> &#2352; ${statement.amount } (Dr)</span>
						</c:otherwise>
					</c:choose>
					</td>
					<td><span style="margin-left:0;"><i>${statement.remark }</i></span></td>
					
				</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	<br/><br/><br/>
</div>

</body>
</html>

<jsp:include page="footer.jsp"/>