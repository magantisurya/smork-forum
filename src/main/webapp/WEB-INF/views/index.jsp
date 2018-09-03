<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<div class="container">

		<ul class="nav nav-tabs">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">All
					Categories</a>
				<div class="dropdown-menu" id="categoriesDropDown"></div></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#latest">Latest</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#top">Top</a>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#categories">Categories</a></li>
		</ul>
		<div class="tab-content">
			<!--================================== latest======================================== -->

			<div class="tab-pane container" id="latest">
				<br>
				<table class="table" id="latestTopics">
					<thead>
						<tr>
							<th scope="col">Topic</th>
							<th scope="col">Users</th>
							<th scope="col">Replies</th>
							<th scope="col">Views</th>
							<th scope="col">Activity</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<!--================================== top======================================== -->

			<div class="tab-pane container fade" id="top">
				<br>
				<table class="table" id="topTopics">
					<thead>
						<tr>
							<th scope="col">Topic</th>
							<th scope="col">Users</th>
							<th scope="col">Replies</th>
							<th scope="col">Views</th>
							<th scope="col">Activity</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<!--================================== categories======================================== -->
			<div class="tab-pane container fade" id="categories">
				<br> <a href="#addCategory" data-toggle="modal"
					class="btn btn-primary float-sm-right">Add new category</a> <br>
				<br> <br>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Category</th>
							<th scope="col" class="text-right">Topics</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>



</body>
<div class="modal fade" id="addCategory" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">Add Category</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="#" id="addCategoryForm" method="post">
				<div class="modal-body mx-3">
					<div class="md-form mb-5">
						<label for="categoryName">Title</label> <input type="text"
							name="categoryName" id="categoryName"
							class="form-control validate-style">
					</div>
					<div class="md-form mb-5">
						<label for="description"> Description</label>
						<textarea name="description" class="form-control validate"> </textarea>
					</div>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button class="btn btn-primary">Add</button>
				</div>
			</form>
		</div>
	</div>

</div>
<script src="resources/js/index.js"></script>
</html>
