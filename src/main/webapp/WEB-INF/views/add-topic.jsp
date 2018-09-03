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

<jsp:include page="header.jsp"></jsp:include>
<title>New Topic</title>
</head>
<body>
	<div class="container">
		<div class=" mx-auto">
			<br> <br>
			<div class="form-group row">
				<h2 class="mx-auto ">Add Topic</h2>
			</div>
			<br>
			<form action="#" id="addTopicForm" method="post" class="container">
				<input type="hidden" value="${categoryId}" name="categoryId">
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Title</label>
					<div class="col-sm-8 validate-style">
						<input name="subject" type="text" placeholder="Enter title"
							class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Content</label>
					<div class="col-sm-8 validate-style">
						<textarea name="content" style="height: 400px;"
							placeholder="Enter content here" class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group row ">
					<button value="submit" type="submit"
						class="btn btn-primary mx-auto">Submit</button>
				</div>
			</form>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
<script>
	$("#addTopicForm").validate({
		rules : {
			subject : {
				required : true,
				minlength : 2,
				maxlength : 50,
			},
			content : {
				required : true,
				minlength : 10,
				maxlength : 65536,
			}
		},
		messages : {
			subject : {
				required : "Title can not be empty.",
				minlength : "Title should be atleast 2 characters long.",
				maxlength : "Title should be maximum 10 characters long.",
			},
			content : {
				required : "Content can not be empty.",
				minlength : "Content should be atleast 10 characters long.",
				maxlength : "Content should be maximum 65536 characters long.",
			}
		},
		submitHandler : function(form, event) {
			event.preventDefault()
			$.ajax({
				url : "/rest/topic/add",
				dataType : 'json',
				type : 'post',
				contentType : 'application/json',
				data : JSON.stringify($(form).serializeObject()),
				success : function(response) {
					if (response.status == 201)
						showInfo('Success', 'New Topic Added');
					else
						showInfo('Failed', 'Could not add new topic');

				}
			});
		}

	});
</script>
</html>