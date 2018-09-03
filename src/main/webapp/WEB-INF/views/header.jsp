<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Smork Forum</title>
<link rel="shortcut icon" href="">
<link rel="stylesheet" href="resources/css/lib/intlTelInput.css" />
<link rel="stylesheet" href="resources/css/lib/bootstrap.css" />
<link rel="stylesheet" href="resources/css/lib/bootstrap4.min.css" />
<link rel="stylesheet" href="resources/icon/css/all.css" />
<link rel="stylesheet" href="resources/css/lib/validation.css" />
<link rel="stylesheet"
	href="resources/css/lib/bootstrap-datepicker.standalone.css" />
<style>
.table {
	width: 100% !important;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<a class="navbar-brand" href="#">Smork Tech</a>
		<div class="clearfix">
			<div class="float-sm-right">
				<ul class="navbar-nav ">
					<sec:authorize access="hasRole('ROLE_USER')">
						<li class="nav-item active "><a class="nav-link"
							href="/logout">Logout</a></li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li class="nav-item active "><a class="nav-link"
							href="/login">Login</a></li>
						<li class="nav-item "><a class="nav-link" href="/signup">Sign
								Up</a></li>
					</sec:authorize>
					<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
				</ul>
			</div>
		</div>
	</nav>

</body>



<div class="modal" id="info-modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p></p>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
</html>