function insert_presentation(slides) {
	var presentation_div = create('div', 'presentation');
	var tumb_div = create('div', 'tumb');
	var slides_div = create('div', 'slides');
	for(var i = 0; i < slides.length; i++) {
		create_tumb(tumb_div, i, slides[i]);
		create_slide(slides_div, i, slides[i]);
	}
	
	presentation_div.appendChild(slides_div);
	presentation_div.appendChild(tumb_div);
	$('#presentation').remove();
	$('.main').append(presentation_div);
}
function create_tumb(div, index, slide_description) {
	var slide_tumb = create('div', null, 'tumb');
	$(slide_tumb).click(function(e) {
		changeTo(function(current){
			return $($('.slide')[index]);
		});
	});

	var count = create('span');
	count.innerHTML = (index+1)+".";
	slide_tumb.appendChild(count);

	var slide = create('div', null, 'tumb_slide');
	var image = create('img');
	image.alt=slide_description[0];
	image.src=slide_description[1];
	slide.appendChild(image);
	slide_tumb.appendChild(slide);
	div.appendChild(slide_tumb);
}
function create_slide(div, index, slide_description) {
	var slide = create('div', null, 'slide');
	slide.style.backgroundImage = "url('"+slide_description[1]+"')";
	
	var header = create('h1');
	header.innerHTML = slide_description[0];
	slide.appendChild(header);
	
	div.appendChild(slide);
}
function create(tag, id, className) {
	var element = document.createElement(tag);
	if(id) {
		element.id=id;
	}
	if(className) {
		element.className=className;
	}
	return element;
}
function changeTo(retriever) {
	var current = $(".slide:visible");
	var target = retriever(current);
	if(target.length) {
		current.hide();
		target.fadeIn();
	}
	return false;
};