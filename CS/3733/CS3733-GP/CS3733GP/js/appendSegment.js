function appendSegment() {
	let xhr = new XMLHttpRequest();
	let form = document.getElementById('appremForm').elements;
	let seg = form.namedItem('appSeg').value;
	let pl = form.namedItem('appPlay').value;
	let json = {
			"segmentName": seg,
			"playlistName": pl
	};
	xhr.open('POST', appendSegmentEndpoint, true);
	xhr.send(JSON.stringify(json));
	xhr.onloadend = () => {
		if(xhr.readyState === XMLHttpRequest.DONE) {
			console.log(`XHR: ${xhr.responseText}`);
			refreshPlaylistList();	
		}
	}
	
}