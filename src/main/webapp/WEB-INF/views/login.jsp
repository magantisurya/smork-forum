<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log In</title>
<link rel="stylesheet" href="resources/css/lib/bootstrap.css" />
<link rel="stylesheet" href="resources/icon/css/all.css" />
<link rel="stylesheet" href="resources/css/lib/validation.css" />
</head>
<body>
	<div class="container">
		<div class="d-flex align-items-center">
			<div class="mx-auto">
				<form action="/login" name="loginForm" id="loginForm" method="post"
					class="">
					<div class="form-group">
						<label class="heading"> <span class="h1">Log In</span>
						</label>
					</div>
					<div class="form-group">
						<label for="username" class="form-label">Email</label>
						<div class="validate-style">
							<input name="username" type="text"
								placeholder="Enter email address" class="form-control" />
							<c:if test="${param.error!=null}">
								<label class="error">Invalid Credentials</label>
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="form-label">Password</label>
						<div class="validate-style">
							<input type="password" id="password" name="password"
								placeholder="Enter Password" class="form-control" />
							<c:if test="${param.error!=null}">
								<label class="error">Invalid Credentials</label>
							</c:if>
						</div>
					</div>
					<br>
					<div class="form-group">
						<input value="Log In" type="submit" class="btn btn-primary" /><a
							href="/signup" class="btn link">Don't have an Account?Sign Up</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script src="/resources/js/lib/jquery.js"></script>
<script src="/resources/js/lib/jquery.validate.js"></script>
<script src="/resources/js/lib/additional-methods.js"></script>
<script src="/resources/js/login.js"></script>
</html>