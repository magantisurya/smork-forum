$.ajax({
	url : "https://flutter.io",
	type : "GET",
	crossDomain : true,
	dataType:'text/html',
	success : function(response) {
		// documnt.write(response)
		alert($(response));
	},
	error : function(xhr, status) {
		alert("error");
	}
});