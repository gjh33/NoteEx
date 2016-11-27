$( "#searchbar" ).on("input", function() {
	$( ".searchResult" ).remove();
	var query = $( "#searchbar" ).val();
	
	if (query != "") {
		var searchJSON = { query : query };
		
		jQuery.get("<%= api_courses_search_path %>", searchJSON, function (result) {
			var data = result.data;
			for (var i = 0; i < data.length; i++) {
				var classObject = data[i];
				var path = "<%= course_path %>" + "?id=" + classObject.id;
				
				var clone = $( "#searchResultTemplate" ).clone();
				clone.find( ".panel-body" ).html('<a href="' + path + '">' + stringifyClass(classObject) + '</a>');
				clone.find( ".hidden" ).removeClass("hidden").addClass("shown").addClass("searchResult");
				clone.attr("id", "result" + i);
				clone.appendTo( "#mainContainer" );
			}
		});
	}
});

function stringifyClass(classObject)
{
	var string = classObject.faculty + " " + classObject.number + ": " + classObject.name;
	return string;
}	