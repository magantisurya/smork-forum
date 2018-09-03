$(function() {
	$("input[name=phone]").intlTelInput({
		utilsScript:'resources/js/library/utils.js'
	});
	$('*[data-type=datepicker]').datepicker({
		autoclose:true,
		endDate:'-18Y'
	})
	$('*[data-datepicker-icon]').click(function(){
		$($(this).parent().siblings('input[data-type=datepicker]')[0]).focus()
	})
	$("#signupForm")
			.validate(
					{
						rules : {
							firstName : {
								required : true,
								minlength : 2,
								maxlength : 10,
								alphanumeric : true
							},
							lastName : {
								required : true,
								minlength : 2,
								maxlength : 10,
								alphanumeric : true
							},
							username : {
								required : true,
								minlength : 2,
								maxlength : 10,
								alphanumeric : true,
								

							},
							email : {
								required : true,
								customMail : true,
								remote : 'is-email-not-registered'
							},
							phone : {
								required : true,
								customPhone : true
							},
							password : {
								required : true,
								minlength : 8,
								maxlength : 16,
								oneDigit:true,
								oneCaps:true,
								oneSymbol:true
							},
							confirmPassword : {
								required : true,
								equalTo : "#password"
							}
						},
						messages : {
							firstName : {
								required : "First Name can not be empty.",
								minlength : "First Name should be atleast 2 characters long.",
								maxlength : "First Name should be maximum 10 characters long.",
								alphanumeric : "First Name should contain only alphanumeric characters."
							},
							lastName : {
								required : "Last Name can not be empty.",
								minlength : "Last Name should be atleast 2 characters long.",
								maxlength : "Last Name should be maximum 10 characters long.",
								alphanumeric : "Last Name should contain only alphanumeric characters."
							},
							username : {
								required : "User Name can not be empty.",
								minlength : "User Name should be atleast 2 characters long.",
								maxlength : "User Name should be maximum 10 characters long.",
								alphanumeric : "User Name should contain only alphanumeric characters."
							},
							email : {
								required : "Email can not be empty.",
								remote:'Email already registered'
							},
							phone : {
								required : "Phone number can not be empty."
							},
							password : {
								required : "Password can not be empty.",
								minlength : "Password should be atleast 8 characters long.",
								maxlength : "Password should be maximum 16 characters long.",
								oneDigit:"Password should contain atleast one digit",
								oneCaps:"Password should contain atleast one captial alphabet",
								oneSymbol:"Password should contain atleast one symbol"
							},
							confirmPassword : {
								required : "Confirm password can not be empty.",
								equalTo : "Confirm password should be same as password."
							}
						},
						submitHandler : function(form) {
							form.submit();
						}

					});
	$('#image').click(function load() {
		$(this).siblings('input').one('change',function(){
			if(this.files&&this.files[0]){
				var reader= new FileReader();
				reader.onload=(e)=>$('#image').attr('src', e.target.result);
				reader.readAsDataURL(this.files[0]);
			}
		}).click();
	})
});

jQuery.validator.addMethod("customMail", function(value, element) {
	return this.optional(element)
			|| /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value);
}, "Please enter a valid email address");
jQuery.validator.addMethod("oneDigit", function(value, element) {
	return this.optional(element)|| /[0-9]+/.test(value)	;
});
jQuery.validator.addMethod("oneCaps", function(value, element) {
	return this.optional(element)|| /[A-Z]+/.test(value)	;
});
jQuery.validator.addMethod("oneSymbol", function(value, element) {
	return this.optional(element)|| /[!"#\$%&'()\*\+,-\.\/:;<=>\?@\[\\\]\^_`{|}~]+/.test(value)	;
});
jQuery.validator.addMethod("customPhone",function(value, element) {
	return this.optional(element)|| /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im.test(value); }, "Please enter a valid phone number");