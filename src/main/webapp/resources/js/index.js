$(function() {
	$('a[href="#latest"]').click()
	$("#addCategoryForm")
			.validate(
					{
						rules : {
							categoryName : {
								required : true,
								minlength : 2,
								maxlength : 10,
							},
							description : {
								required : true,
								minlength : 10,
								maxlength : 65536,
							}
						},
						messages : {
							categoryName : {
								required : "Name can not be empty.",
								minlength : "Name should be atleast 2 characters long.",
								maxlength : "Name should be maximum 10 characters long.",
							},
							description : {
								required : "Description can not be empty.",
								minlength : "Description should be atleast 10 characters long.",
								maxlength : "Description should be maximum 65536 characters long.",
							}
						},
						submitHandler : function(form, event) {
							event.preventDefault()
							$.ajax({
								url : "/rest/category/add",
								dataType : 'json',
								type : 'post',
								contentType : 'application/json',
								data : JSON
										.stringify($(form).serializeObject()),
								success : function(response) {
									$('#addCategory').modal('hide');
									if (response.status == 201)
										showInfo('Success',
												'New Category Added');
									else
										showInfo('Failed',
												'Could not add new category');

								}
							});
						}

					});
	$
			.ajax({
				url : "/rest/category/",
				dataType : 'json',
				type : 'get',
				success : function(response) {
					$('#addCategory').modal('hide');
					if (response.status == 200) {
						var data = '';
						var dropDownData = '';
						$
								.each(
										response.data,
										function(index, value) {
											data += '<tr><td> <div class="media-body"> <h5 class="mt-0 mb-1">'
													+ value.categoryName
													+ '</h5>'
													+ value.description
													+ ' </div></td> <td><div class="float-sm-right"> <a href="/add-topic?categoryId='
													+ value.categoryId
													+ '" class="btn btn-primary " title="Add topic"><i class="fa fa-plus"></i></a>&nbsp;&nbsp;&nbsp; <span >'
													+ ((!!value.avgTopicsPerMonth) ? Math
															.round(value.avgTopicsPerMonth)
															: 0)
													+ '/month</span></div></td></tr><br>'
											dropDownData += '<a class="dropdown-item" data-categoryId='
													+ value.categoryId
													+ ' href="#">'
													+ value.categoryName
													+ '</a>'
										})
						$('#categoriesDropDown').append(dropDownData);
						$('#categories tbody').append(data);
					} else
						showInfo('Failed', 'Could not fetch categories');

				}
			});

});
function showLatestTopics(categoryId, latest, top, fromDate, toDate) {
	latestTopicTable.ajax.url(
			"/rest/topic?categoryId=" + categoryId + "&latest=" + latest
					+ "&top=" + top + "&fromDate=" + fromDate + "&toDate="
					+ toDate).load();
}
var latestTopicTable = $('#latestTopics').DataTable(
		{
			ajax : "/rest/topic?categoryId=0&latest=true&top=false",
			columns : [
					{
						data : null,
						render : function(data) {
							return '<a href="/open-topic?topicId='
									+ data.topicId + '">' + data.subject
									+ '</a>'
						}
					}, {
						data : null,
						render : function(data) {
							return "NA"
						}
					}, {
						data : null,
						render : function(data) {
							return data.totalReplies
						}
					}, {
						data : null,
						render : function(data) {
							return "NA"
						}
					}, {
						data : null,
						render : function(data) {
							if (!!data.lastActivity)
								return new Date(data.lastActivity)
							else
								return "No activity"
						}
					} ],
			searching : false,
			sortable : false,
		});