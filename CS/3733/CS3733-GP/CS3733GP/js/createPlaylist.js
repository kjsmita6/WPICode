function createPlaylist() {
	let xhr = new XMLHttpRequest();
	xhr.onloadend = () => {
		if(xhr.readyState === XMLHttpRequest.DONE) {
			console.log(`XHR: ${xhr.responseText}`);
			refreshPlaylistList();
		}
	};
	let form = document.getElementById("playlist").elements;
	let name = form.namedItem("playlist").value;
	let segments = 0;
	xhr.open('POST', createPlaylistEndpoint, true);
	let json = { 'name' : name, 'segments' : segments};
	xhr.send(JSON.stringify(json));
	console.log('XHR sent');
}