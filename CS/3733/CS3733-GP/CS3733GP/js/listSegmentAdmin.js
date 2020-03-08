function refreshAdminSegmentList() {
	
	let xhr = new XMLHttpRequest();
	xhr.onloadend = () => {
		if(xhr.readyState === XMLHttpRequest.DONE) {
			console.log(`XHR: ${xhr.responseText}`);
			processAdminSegmentListResponse(xhr.responseText);
		}
		else {
			processAdminSegmentListResponse('N/A');
		}
	};
	
	xhr.open('GET', listSegmentsEndpoint, true);
	// xhr.setRequestHeader("X-Api-Key", api);
	xhr.send(JSON.stringify({}));
	console.log('XHR sent');
	
}

function processAdminSegmentListResponse(result) {
	console.log(`Result: ${result}`);
	let js = JSON.parse(result);
	let segList = document.getElementById('SegmentAdminList');
	let output = '<ul>';
	for(let i = 0; i < js.list.length; i++) {
		let segments = js.list[i];
		console.log(segments);
		let name = segments['name'];
		let remote = segments['type'];
		let str = remote === 1 ? "Remote" : "Local";
		output += `<li id="segment${i}" onclick="switchMode(${i})">${name} ${str}</li>`;
	}
	output += '</ul>';
	segList.innerHTML = output;
}

function switchMode(seg) {
	let li = document.getElementById(`segment${seg}`);
	if(li.innerText.indexOf('Remote') > -1) {
		let newStr = li.innerText.replace('Remote', 'Local');
		li.innerText = newStr;
	}
	else {
		let newStr = li.innerText.replace('Local', 'Remote');
		li.innerText = newStr;
	}
}