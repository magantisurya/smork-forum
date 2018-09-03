<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>${data.subject}</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<div class="container">
		<input type="hidden" value="${param.topicId}" id="topicId">
		<h2>${data.subject}</h2>
		<h6>${data.categoryName}</h6>
		<div class="media user">
			<img class="mr-3" src="" alt="profile" width="45px;" height="45px;">
			<div class="media-body">
				<h6 class="mt-0 mb-1"></h6>
				${data.content}
			</div>
		</div>
		<hr>
		<br>
		<hr>
		<ul class="list-unstyled" id="replies">
			<li class="media"><img class="mr-3" src="" alt="profile"
				width="45px;" height="45px;">
				<div class="media-body">
					<h5 class="mt-0 mb-1">List-based media object</h5>
					Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
					scelerisque ante sollicitudin. Cras purus odio, vestibulum in
					vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
					vulputate fringilla. Donec lacinia congue felis in faucibus.
				</div>
				<div>
					<a href="#addCategory" data-toggle="modal"
						class="btn btn-primary float-sm-right" title="Add topic"><i
						class="fa fa-plus"></i></a>
				</div></li>
			<li class="media my-4"><img class="mr-3" src="" alt="profile"
				width="45px;" height="45px;">
				<div class="media-body">
					<h5 class="mt-0 mb-1">List-based media object</h5>
					Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
					scelerisque ante sollicitudin. Cras purus odio, vestibulum in
					vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
					vulputate fringilla. Donec lacinia congue felis in faucibus.
				</div></li>
			<li class="media"><img class="mr-3" src="" alt="profile"
				width="45px;" height="45px;">
				<div class="media-body">
					<h5 class="mt-0 mb-1">List-based media object</h5>
					Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
					scelerisque ante sollicitudin. Cras purus odio, vestibulum in
					vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
					vulputate fringilla. Donec lacinia congue felis in faucibus.
				</div></li>
		</ul>
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
<script src="resources/js/view-topic.js"></script>
</html>
