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
				<h4>
					<span class="username"></span>&nbsp;&nbsp;&nbsp;&nbsp;<small><i>Posted
							on <span data-date>${data.creationTime}</span>
					</i></small>
				</h4>
				${data.content}
			</div>
		</div>
		<hr>
		<button class="reply mr-3" data-parent="0">
			<i class="fa fa-reply"></i>
		</button>
		<br>
		<hr>

		<ul class="list-unstyled" id="replies">
		</ul>
	</div>
</body>
<div class="modal fade" id="reply" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">Reply</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="#" id="replyForm" method="post">
				<input name="parentId" type="hidden"> <input name="topicId"
					type="hidden" value="${data.topicId}">
				<div class="modal-body mx-3">
					<div class="md-form mb-5">
						<textarea name="content" rows="4" class="form-control validate"> </textarea>
					</div>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button class="btn btn-primary">Reply</button>
				</div>
			</form>
		</div>
	</div>

</div>

<jsp:include page="footer.jsp"></jsp:include>
<script src="resources/js/view-topic.js"></script>
</html>
