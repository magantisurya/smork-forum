<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<body>
</body>
</html>
<script src="resources/js/lib/popper.js"></script>
<script src="resources/js/lib/jquery.js"></script>
<script src="resources/js/lib/intlTelInput.js"></script>
<script src="resources/js/lib/bootstrap.js"></script>
<script src="resources/js/lib/jquery.validate.js"></script>
<script src="resources/js/lib/additional-methods.js"></script>
<script src="resources/js/lib/bootstrap-datepicker.js"></script>
<script src="resources/js/lib/dataTables.min.js"></script>
<script src="resources/js/lib/bootstrap4.min.js"></script>
<script>
	function showInfo(title, body) {
		var modal = $('#info-modal');
		modal.find('.modal-title').text(title);
		modal.find('.modal-body>p').text(body);
		modal.modal('show');
	}
	$.fn.serializeObject = function() {
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			if (o[this.name]) {
				if (!o[this.name].push) {
					o[this.name] = [ o[this.name] ];
				}
				o[this.name].push(this.value || '');
			} else {
				o[this.name] = this.value || '';
			}
		});
		return o;
	};
	$('span[data-date]').each(function(index, value) {
		if (!!value)
			$(this).text(new Date($(value).text()).toLocaleString())
	});
	$('.modal').on('hidden.bs.modal', function() {
		$(this).find('input,textarea').val('');
	})
</script>
