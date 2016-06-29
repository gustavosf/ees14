var addAutor = function(el) {
	var last = $(el).siblings().last();
	var add = last.clone().val('');
	add.insertAfter(last);
}