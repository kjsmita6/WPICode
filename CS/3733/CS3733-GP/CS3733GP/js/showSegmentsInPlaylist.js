	function arrayFilter(array, predicate) {
	    var index = -1,
	        length = array == null ? 0 : array.length,
	        resIndex = 0,
	        result = [];

	    while (++index < length) {
	      var value = array[index];
	      if (predicate(value, index, array)) {
	        result[resIndex++] = value;
	      }
	    }
	    return result;
	  }

function showSegmentsInPlaylist() {
	console.log(`clicked button`);
		// Return a new promise.
		var promise = new Promise(function(resolve, reject) {
			// Do the usual XHR stuff
			console.log(`inside promise`);
			var req = new XMLHttpRequest();
			console.log(`made request object`);
			req.open('GET', listSegmentsEndpoint);
			req.onload = function() {
				if (req.status == 200) {
					resolve(req.response);
				} else {
					reject(Error(req.statusText));
				}
			};
			// Handle network errors
			req.onerror = function() {
				reject(Error("Network Error"));
			};
			// Make the request
			req.send();
		});
	
promise.then(function(response) {
	console.log(`converting to iterable form`);
	function processSegmentListResponse(result) {
		console.log(`Result: ${result}`);
		let input = document.getElementById('showPlaylistForm').elements;
		let playlistTitle = input.namedItem('showSelectedPlaylist').value;
		let playlistSpot = document.getElementById('listofPlaylistNames');
		console.log(`selected playlist param: ${playlistTitle}`);
		let output = `<h4>${playlistTitle}</h4><br><ul>`;
		let js = JSON.parse(result);
		
		var filteredseglist = arrayFilter(js.list, function (arrayelement){
				segmentFilterReturn = arrayelement['pl'].toLowerCase().includes(playlistTitle.toLowerCase());
			return segmentFilterReturn;
		});
		if(filteredseglist.length > 0){
			for(let i = 0; i < filteredseglist.length; i++) {
				let segments = filteredseglist[i];
				console.log(segments);
				let name = segments['name'];
				let url = segments['url'];
				let char = segments['character'];
				let quote = segments['quote'];
				output += `<li>Video: ${name}<br><video height=240 width=320 controls><source src="${url}" type="video/ogg"></video><br>Character: ${char}<br>Quote: ${quote}<br><br></li>`;
			}
			playlistSpot.innerHTML = output + '</ul>';
		}
		else{
			playlistSpot.innerHTML = output + `<li>There are no videos in this playlist, go to the append/remove video menu to add a video to a playlist</li><ul>`;
		}
	}
	processSegmentListResponse(response);
});
}



