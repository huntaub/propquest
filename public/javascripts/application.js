function add_one_question (node) {
	var f = $$('a.section_links')
	for(var i=0; i<f.length; i++){
			f[i].href = f[i].href.replace('questions='+$('question_number').innerHTML, 'questions='+(parseInt($('question_number').innerHTML) + 1));
	}
	$('question_number').innerHTML = (parseInt($('question_number').innerHTML) + 1);
}

function remove_one_question (node) {
	if (parseInt($('question_number').innerHTML) != 2) {
		var f = $$('a.section_links')
		for(var i=0; i<f.length; i++){
				f[i].href = f[i].href.replace('questions='+$('question_number').innerHTML, 'questions='+(parseInt($('question_number').innerHTML) + 1));
		}
		$('question_number').innerHTML = (parseInt($('question_number').innerHTML) - 1);
	}
}