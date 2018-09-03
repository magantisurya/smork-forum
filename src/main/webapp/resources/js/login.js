$(function() {
	$("#loginForm").validate({
		rules : {
			username : {
				required : true,
				validEmail : true
			},
			password : {
				required : true,
				minlength : 8,
				maxlength : 16
			}
		},
		messages : {
			username : {
				required : "User Name can not be empty.",
			},
			password : {
				required : "Password can not be empty.",
				minlength : "Password should be atleast 8 characters long.",
				maxlength : "Password should be maximum 16 characters long."
			}
		},
		submitHandler : function(form) {
			form.submit();
		}

	});
});
$.validator
		.addMethod(
				"validEmail",
				function(value, element) {
					return /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i
							.test(value);
				}, "Please enter valid email address.");