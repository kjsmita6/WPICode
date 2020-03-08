function refreshSegmentList() {
	let xhr = new XMLHttpRequest();
	xhr.onloadend = () => {
		if(xhr.readyState === XMLHttpRequest.DONE) {
			console.log(`XHR: ${xhr.responseText}`);
			processSegmentListResponse(xhr.responseText);
		}
		else {
			processSegmentListResponse('N/A');
		}
	};

	xhr.open('GET', listSegmentsEndpoint, true);
	// xhr.setRequestHeader("X-Api-Key", api);
	xhr.send(JSON.stringify({}));
	console.log('XHR sent');

}

function processSegmentListResponse(result) {
	console.log(`Result: ${result}`);
	let js = JSON.parse(result);
	let segList = document.getElementById('ScriptVideoMenu');
	let output = '<ul>';
		for(let i = 0; i < js.list.length; i++) {
			let segments = js.list[i];
			console.log(segments);
			let name = segments['name'];
			let url = segments['url'];
			let char = segments['character'];
			let quote = segments['quote'];
			output += `<li>Video: ${name}<br><video height=240 width=320 controls><source src="${url}" type="video/ogg"></video><br>Character: ${char}<br>Quote: ${quote}<br><br></li>`;
		}
	segList.innerHTML = output + '</ul>';
}