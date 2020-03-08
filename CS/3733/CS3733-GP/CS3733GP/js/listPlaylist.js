function refreshPlaylistList() {
	
	let xhr = new XMLHttpRequest();
	xhr.onloadend = () => {
		if(xhr.readyState === XMLHttpRequest.DONE) {
			console.log(`XHR: ${xhr.responseText}`);
			processPlaylistListResponse(xhr.responseText);
		}
		else {
			processPlaylistListResponse('N/A');
		}
	};
	
	xhr.open('GET', listPlaylistEndpoint, true);
	// xhr.setRequestHeader("X-Api-Key", api);
	xhr.send(JSON.stringify({}));
	console.log('XHR sent');
	
}

function processPlaylistListResponse(result) {
	console.log(`Result: ${result}`);
	let js = JSON.parse(result);
	let playlistList2 = document.getElementById('playlistNames');
	let output = `<ul>`;
	for(let i = 0; i < js.list.length; i++) {
		let playlist = js.list[i];
		console.log(playlist);
		let name = playlist['name'];
		output += `<li>${name}</li>`;
	}
	playlistList2.innerHTML = output + `</ul>`;
}