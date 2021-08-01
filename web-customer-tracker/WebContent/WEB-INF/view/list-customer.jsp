<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
	<title>List Customer</title>
</head>
<body>
	<div id="wrapper">
		<div id="header">
		<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
		
		<input type="button" value="Add Customer" 
				onclick="window.location.href='showFormForAdd'; return false;" class="add-button"/>
				
		<form:form action="search" method="GET"> 
			Search Customer: <input type ="text" name="theSearchBox"/>
			<input type="submit" value="Search" class="add-button"/>
		</form:form>
				
			<table id="myTable">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email Address</th>
					<th>Action</th>
				</tr>
				<c:forEach var="tempCustomer" items="${customerObj}">
					<c:url var="updateLink" value="showFormForUpdate">
						<c:param name="customerID" value="${tempCustomer.id}"></c:param>
					</c:url>
					<c:url var="deleteLink" value="delete">
						<c:param name="customerID" value="${tempCustomer.id}"></c:param>
					</c:url>
					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						<td><a href="${updateLink}">Update</a>|
						<a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete?')))">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>