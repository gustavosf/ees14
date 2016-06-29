$(document).ready(function() {
	$('#filter').keyup(function(){
		var value = $(this).val().toLowerCase();
		if (value == '') {
			$('li.user-record').show();
		} else {
			$('li.user-record').each(function(i, ur) {
				if ($(ur).text().toLowerCase().indexOf(value) !== -1)
					$(this).show();
				else
					$(this).hide();
			})
		}
	});
});