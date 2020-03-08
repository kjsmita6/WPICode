function deletePlaylist() {
	let form = document.getElementById('deletePForm').elements;
	let name = form.namedItem('playlistName').value;
	let json = { 'name' : name };
	let xhr = new XMLHttpRequest();
	xhr.open('POST', deleteFromPlaylistEndpoint, true);
	xhr.send(JSON.stringify(json));
	
	xhr.onloadend = () => {
		refreshPlaylistList();
	}	
}