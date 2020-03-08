function uploadSegment(e) {
	//let file = b64.split(',')[1];
	document.getElementById('uploadStatus').innerHTML = 'Uploading...';
	document.getElementById('uploadStatus').hidden = false;
	
	let p = new Promise((resolve, reject) => {
		let reader = new FileReader();
		reader.onload = () => {
			resolve(reader.result);
		}
		reader.readAsDataURL(e.target.files[0]);
	});

	p.then(b64 => {
		//console.log(e);
		//console.log(b64);
		//console.log(file);
		let json = {};
		let form = document.getElementById('uploadForm').elements;
//		console.log(form.namedItem('file'));
		json['character'] = form.namedItem('char').value;
		json['quote'] = form.namedItem('quote').value;

		json['base64'] = b64.split(',')[1];
		
		let xhr = new XMLHttpRequest();
		xhr.open('POST', uploadSegmentEndpoint, true);
		xhr.send(JSON.stringify(json));

		xhr.onloadend = () => {
			document.getElementById('uploadStatus').innerText = 'Done.';
			document.getElementById('uploadForm').reset();
			refreshSegmentList();
		}
	});
}

function deleteSegment() {
	let form = document.getElementById('deleteForm').elements;
	let name = form.namedItem('toDelete').value;
	let json = { 'name' : name };
	let xhr = new XMLHttpRequest();
	xhr.open('POST', deleteSegmentEndpoint, true);
	xhr.send(JSON.stringify(json));
	
	xhr.onloadend = () => {
		refreshSegmentList();
	}	
}
