<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<link rel="shortcut icon" href="">
<link rel="stylesheet" href="/resources/css/lib/intlTelInput.css" />
<link rel="stylesheet" href="/resources/css/lib/bootstrap.css" />
<link rel="stylesheet" href="/resources/icon/css/all.css" />
<link rel="stylesheet" href="/resources/css/lib/validation.css" />
<link rel="stylesheet"
	href="resources/css/lib/bootstrap-datepicker.standalone.css" />
<title>Sign Up</title>
</head>
<body>
	<div class="container">
		<div class="col-sm-6 mx-auto">
			<br>
			<div class="form-group row">
				<h2 class="mx-auto ">Add Category</h2>
			</div>
			<br>
			<form action="/signup" id="signupForm" method="post"
				class="container">
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Name</label>
					<div class="col-sm-8 validate-style">
						<input name="firstName" type="text" placeholder="First Name"
							class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Description</label>
					<div class="col-sm-8 validate-style">
						<input name="lastName" type="text" placeholder="Last Name"
							class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Username</label>
					<div class="col-sm-8 validate-style">
						<input name="username" type="text" placeholder="Username"
							class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Date of Birth</label>
					<div class="col-sm-8 validate-style input-group ">
						<input name="dob" type="text" placeholder="Date of Birth"
							class="form-control" data-type="datepicker" />
						<div class="input-group-append">
							<button class="btn btn-outline-secondary border-left-0 border"
								data-datepicker-icon type="button">
								<i class="fa fa-calendar"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Email</label>
					<div class="col-sm-8 validate-style">
						<input name="email" type="email" placeholder="Email"
							class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Password</label>
					<div class="col-sm-8 validate-style">
						<input id="password" type="password" name="password"
							placeholder="Password" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Confirm Password</label>
					<div class="col-sm-8 validate-style">
						<input type="password" id="confirmPassword" name="confirmPassword"
							placeholder="Confirm Password" class="form-control" />
					</div>
				</div>
				<div class="form-group row ">
					<button value="submit" type="submit"
						class="btn btn-primary mx-auto">Sign Up</button>
				</div>
				<div class="form-group row ">
					<a href="/login" class="mx-auto">Already have an account?</a>
				</div>
			</form>
		</div>
	</div>
	<input type="hidden" id="showModal" value="${showModal}">
	<div class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">${modalTitle}</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>${modalBody}</p>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
<jsp:include page="footer.jsp"></jsp:include>
<script>
	if ($('#showModal').val())
		$('div.modal').modal('show');
</script>
</html>