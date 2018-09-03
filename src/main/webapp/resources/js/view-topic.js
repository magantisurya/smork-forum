$(function() {
	$
			.ajax({
				url : "/rest/topic/get?topicId=" + $('#topicId').val(),
				dataType : 'json',
				type : 'get',
				success : function(response) {
					if (response.status == 200) {
						var user = JSON.parse(response.data.creator);
						var userDiv = $(' div.user');
						userDiv.find('img').attr('src', user.profilePicture);
						userDiv.find('.media-body .username').text(
								user.username);
						var replies = response.data.replies;
						var str = '';
						var childs = [];
						var parents = [];
						$.each(replies, function(index, value) {
							if (!!value.parentId)
								childs.push(value);
							else
								parents.push(value);
						})
							$.each(childs, function(childIndex, childValue) {
								$.each(parents, function(parentIndex,parentValue) {
									if(parentValue.replyId==childValue.parentId){
										if(!parentValue.childs)
											parentValue.childs=[];
										parentValue.childs.push(childValue);
										parents[parentIndex]=parentValue;
									}
								})
							})
						console.log(parents)
						console.log(childs)
						$
								.each(
										parents,
										function(index, value) {
											var user = JSON.parse(value.user);
											str += '<li class="media"><img class="mr-3" src="'
													+ user.profilePicure
													+ '" alt="profile" width="45px;" height="45px;"> <div class="media-body"> <h5 class="mt-0 mb-1">'
													+ user.username
													+ '&nbsp;&nbsp;&nbsp;&nbsp;<small>Replied at '
													+ new Date(
															value.creationTime)
															.toLocaleString()
													+ '</small></h5>'
													+ value.content;
													
											if(!!value.childs){
												$.each(value.childs,function(index,value){
													var user = JSON.parse(value.user);
													str+='<br><hr><div class="media"><img class="mr-3" src="'
														+ user.profilePicure
														+ '" alt="profile" width="45px;" height="45px;"> <div class="media-body"> <h5 class="mt-0 mb-1">'
														+ user.username
														+ '&nbsp;&nbsp;&nbsp;&nbsp;<small>Replied at '
														+ new Date(
																value.creationTime)
																.toLocaleString()
														+ '</small></h5>'
														+ value.content +'</div></div><hr>'	
												})
												
											}
													str+= '</div></li><br><button class="reply mr-3" data-parent="'
													+ value.replyId
													+ '"> <i class="fa fa-reply"></i> </button><br><hr>'
										})
						$('#replies').append(str);
					} else
						showInfo('Failed', 'Could not fetch categories');
				}
			});
	$('body').on('click', '.reply', function() {
		$('#reply').modal('show');
		$('#reply').find('input[name=parentId]').val($(this).data('parent'));
	});
	$("#replyForm").validate({
		rules : {
			content : {
				required : true,
				maxlength : 65536,
			}
		},
		messages : {
			content : {
				required : "Reply can not be empty.",
				maxlength : "Reply should be maximum 65536 characters long.",
			}
		},
		submitHandler : function(form, event) {
			event.preventDefault()
			$.ajax({
				url : "/rest/reply/add",
				dataType : 'json',
				type : 'post',
				contentType : 'application/json',
				data : JSON.stringify($(form).serializeObject()),
				success : function(response) {
					$('#reply').modal('hide');
					if (response.status == 201) {
						showInfo('Success', 'Reply Added');
					} else
						showInfo('Failed', 'Could not reply');

				}
			});
		}

	});

});
