<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
</head>
<body>
	<c:url value="/logout" var="urlLogout" />
	<c:url value="/delete-user/" var="urlDelete"></c:url>
	<c:url value="/edit-user/" var="urlEdit"></c:url>
	<c:url value="/" var="urlHome"></c:url>
	<c:url value="/get-all-users" var="urlShowUsers"></c:url>
	<c:url value="/toggle-enable-user/" var="urlToggleEnable"></c:url>
	<form:form action="${urlLogout}" method="post" id="logout" />
	<form:form action="${urlDelete}" method="post" id="delete"
		hidden="true">
		<input name="username" id="deleteUserName" />
	</form:form>
	<form:form action="${urlToggleEnable}" method="post" id="toggleEnable"
		hidden="true">
		<input name="username" id="toggleEnableUserName" />
	</form:form>
	<form:form action="${urlEdit}" method="post" id="edit" hidden="true">
		<input name="username" id="editUserName" />
	</form:form>
	<sec:authentication property="principal" var="user" />
	<div class="w3-bar w3-black">
		<a href="${urlHome}" class="w3-bar-item w3-button">Home</a> <a
			href="#" class="w3-bar-item w3-button"
			onclick="document.getElementById('getAllUser').submit()">Show All
			Users</a> <a href="${urlHome}" class="w3-bar-item w3-button">My
			Account</a> <a href="#" class="w3-bar-item w3-button"
			onclick="document.getElementById('logout').submit()">Logout</a>
	</div>
	<table class="w3-table-all" id="table">
		<thead>
			<tr>
				<td colspan="7"><h1 align="center">Users Information</h1></td>
			</tr>
			<tr>
				<td colspan="7" align="center"><span
					class="message w3-text-blue">${message}</span></td>
			</tr>
			<tr class="w3-black">
				<th align="left">Authority</th>
				<th align="left">Username</th>
				<th align="left">Name</th>
				<th align="left">Email</th>
				<th align="left">Phone</th>
				<th align="left">Enabled</th>
				<th align="left">ACTION</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user">
				<tr>
					<td align="left">${user.authorities}</td>
					<td align="left">${user.username}</td>
					<td align="left">${user.firstName}${user.lastName}</td>
					<td align="left">${user.email}</td>
					<td align="left">${user.phone}</td>
					<sec:authorize access="hasRole('ROLE_MODERATOR')">
						<td align="left"><c:choose>
								<c:when test="${user.enabled}">
									<a href="#" onclick="toggleEnableUser('${user.username}')"
										class="w3-green w3-btn">ENABLED</a>
								</c:when>
								<c:when test="${!user.enabled}">
									<a href="#" onclick="toggleEnableUser('${user.username}')"
										class="w3-red w3-btn">DISABLED</a>
								</c:when>
							</c:choose></td>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<td align="left"><i class="fa fa-trash-o w3-btn"
							onclick="deleteUser('${user.username}')"
							style="font-size: 36px; color: red"></i><i class="fa fa-edit w3-btn"
							style="font-size: 36px;" onclick="editUser('${user.username}')"></i></td>
					</sec:authorize>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script type="text/javascript">
	function deleteUser(username) {
		document.getElementById("deleteUserName").value = username;
		document.getElementById("delete").submit();
	}
	function toggleEnableUser(username) {
		document.getElementById("toggleEnableUserName").value = username;
		document.getElementById("toggleEnable").submit();
	}
	function editUser(username) {
		document.getElementById("editUserName").value = username;
		document.getElementById("edit").submit();
	}
</script>
</html>