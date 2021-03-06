var addAutor = function(el) {
	var last = $(el).siblings().last(),
		add = last.clone().val('');
	add.insertAfter(last);
}

$(document).ready(function() {
	$('[rel=filter]').on('keyup change', function(){
		var filters = getFilters();
		if (Object.keys(filters).length == 0) {
			$('li.pub-record').show();
		} else {
			$('li.pub-record').each(function(i, ur) {
				var show = true;
				$.each(filters, function(i, el) {
					var fvalue = $(ur).children('span.'+i).text();
					if (fvalue.toLowerCase().indexOf(el) < 0)
						show = false;
				});
				if (show) $(this).show();
				else $(this).hide();
			})
		}
	});
	$('[rel=order]').on('change', function(){
		var order = $(this).val(),
			container = $('ul.pub-list'),
			list = $('li.pub-record').sort(function(a, b){
				var aval = $(a).children('span.pub-'+order).text().toLowerCase();
				var bval = $(b).children('span.pub-'+order).text().toLowerCase();
				return aval.localeCompare(bval);
			});
		list.detach().appendTo(container);
	});
});

var getFilters = function() {
	var filters = {};
	$('[rel=filter]').each(function(i, el){
		var value = $(this).val().toLowerCase(),
			type = $(this).attr('name'),
			target = 'pub-'+type;
		if (value) {
			filters[target] = value.toLowerCase();
		}
	});
	return filters;
}