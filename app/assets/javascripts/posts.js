var ready = function(){
	$("#search-bar").keyup(function(event) {
		if (!event.shiftKey) {
			$.get('/search', {search: $(this).val()}, function(data) {
		 		$("#posts").html(data)
			});
		}
	});
};

$(document).ready(ready);            
$(document).on('turbolinks:load', ready)
