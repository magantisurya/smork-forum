<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>
	<c:url value="/save-user" var="urlSaveUser" />
	<c:url value="/logout" var="urlLogout" />
	<div class="w3-container w3-blue">
		<h2>Edit User</h2>
	</div>
	<form:form action="${urlSaveUser}" id="userForm" method="post"
		class="w3-container w3-content">
		<table>
			<tr>
				<td align="center" class="error">${message }</td>
			</tr>
			<tr>
				<td><form:input path="firstName" name="firstName" type="text"
						placeholder="First Name" class="w3-input" /></td>
			</tr>
			<tr>
				<td><form:input path="lastName" name="lastName" type="text"
						placeholder="Last Name" class="w3-input" /></td>
			</tr>
			<tr hidden="true">
				<td><form:input path="username" name="username" type="text"
						placeholder="UserName" class="w3-input" /></td>
			</tr>
			<tr>
				<td><form:input path="email" name="email" type="email"
						placeholder="Email" class="w3-input" /></td>
			</tr>
			<tr>
				<td><form:input path="phone" name="phone" type="tel"
						placeholder="Phone" class="w3-input" /></td>
			</tr>
			<tr>
				<td><form:radiobutton path="authorities" name="ROLE_USER" 
						value="ROLE_USER" />ROLE_USER<br> <form:radiobutton
						path="authorities" name="ROLE_ADMIN" value="ROLE_ADMIN" />ROLE_ADMIN<br>
					<form:radiobutton path="authorities" name="ROLE_MODERATOR"
						value="ROLE_MODERATOR" />ROLE_MODERATOR<br> <form:radiobutton
						path="authorities" name="ROLE_GUEST" value="ROLE_GUEST" />ROLE_GUEST</td>
			</tr>
			<tr>
				<td><form:button value="submit" type="submit"
						class="w3-btn w3-blue">Save</form:button></td>
			</tr>
		</table>
	</form:form>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.js"></script>
<script>
	$(document)
			.ready(
					function() {
						jQuery.validator
								.addMethod(
										"customMail",
										function(value, element) {
											return this.optional(element)
													|| /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
															.test(value);
										}, "Please enter a valid email address");
						jQuery.validator
								.addMethod(
										"customPhone",
										function(value, element) {
											return this.optional(element)
													|| /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im
															.test(value);
										}, "Please enter a valid phone number");
						$("#userForm")
								.validate(
										{
											rules : {
												firstName : {
													required : true,
													minlength : 2,
													maxlength : 10,
													alphanumeric : true
												},
												lastName : {
													required : true,
													minlength : 2,
													maxlength : 10,
													alphanumeric : true
												},
												username : {
													required : true,
													minlength : 2,
													maxlength : 10,
													alphanumeric : true
												},
												email : {
													required : true,
													customMail : true
												},
												phone : {
													required : true,
													customPhone : true
												}
											},
											messages : {
												firstName : {
													required : "First Name can not be empty.",
													minlength : "First Name should be atleast 2 characters long.",
													maxlength : "First Name should be maximum 10 characters long.",
													alphanumeric : "First Name should contain only alphanumeric characters."
												},
												lastName : {
													required : "Last Name can not be empty.",
													minlength : "Last Name should be atleast 2 characters long.",
													maxlength : "Last Name should be maximum 10 characters long.",
													alphanumeric : "Last Name should contain only alphanumeric characters."
												},
												username : {
													required : "User Name can not be empty.",
													minlength : "User Name should be atleast 2 characters long.",
													maxlength : "User Name should be maximum 10 characters long.",
													alphanumeric : "User Name should contain only alphanumeric characters."
												},
												email : {
													required : "Email can not be empty.",
												},
												phone : {
													required : "Phone number can not be empty."
												}
											},
											submitHandler : function(form) {
												form.submit();
											}

										});
					});
</script>
<style>
.error {
	color: red;
}
</style>
</html>