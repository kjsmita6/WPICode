function addRemoteSite() {
	let xhr = new XMLHttpRequest();
	xhr.onloadend = () => {
		if(xhr.readyState === XMLHttpRequest.DONE) {
			console.log(`XHR: ${xhr.responseText}`);
			refreshThirdPartyList();
		}
	}
	let form = document.getElementById("remoteSite").elements;
	let name = form.namedItem('siteName').value;
	let url = form.namedItem("remoteSite").value;
	let api = form.namedItem('apikey').value;
	xhr.open('POST', addRemoteSiteEndpoint, true);
	let json = { 'siteName' : name, 'url' : url, 'apikey': api };
	xhr.send(JSON.stringify(json));
	console.log('XHR sent');
}

function refreshThirdPartyList() {
	let xhr = new XMLHttpRequest();
	xhr.onloadend = () => {
		if(xhr.readyState === XMLHttpRequest.DONE) {
			processListResponse(xhr.responseText);
		}
	}
	xhr.open('GET', listRemoteSitesEndpoint, true);
	xhr.send(JSON.stringify({}));
}

function processListResponse(response) {
	let js = JSON.parse(response);
	let siteList = document.getElementById('RemoteSiteList');
	let output = '<ul>';
	for(let i = 0; i < js.list.length; i++) {
		let site = js.list[i];
		let name = site['name'];
		let url = site['url'];
		output += `<li>${name} (${url})</li>`;
	}
	output += '</ul>';
	siteList.innerHTML = output;
}