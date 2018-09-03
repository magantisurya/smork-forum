$(function() {
	$.ajax({
		url : "/rest/topic/get?topicId=" + $('#topicId').val(),
		dataType : 'json',
		type : 'get',
		success : function(response) {
			if (response.status == 200) {
				var user = JSON.parse(response.data.creator);
				var userDiv = $(' div.user');
				userDiv.find('img').attr('src', user.profilePicture);
				userDiv.find('.media-body>h6').text(user.username);
			} else
				showInfo('Failed', 'Could not fetch categories');

		}
	});

});
