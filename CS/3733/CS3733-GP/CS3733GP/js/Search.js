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

function search() {
	console.log(`clicked button`);
	console.log(`starting search`);
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
	var input = document.getElementById("search").elements;
	var searchchar = input.namedItem("Schar").value;
	var searchquote = input.namedItem("Sword").value;
	console.log(`character search param: ${searchchar}`);
	console.log(`quote search param: ${searchquote}`);	
	function processSegmentListResponse(result) {
		console.log(`Result: ${result}`);
		var segList = document.getElementById('ScriptVideoMenu');
		var output = '<ul>';
		var js = JSON.parse(result);
		
		
		var filteredseglist = arrayFilter(js.list, function (arrayelement){
			var segmentFilterReturn = '';
			if (searchchar == "" && searchquote == ""){
				segmentFilterReturn = arrayelement['quote'].toLowerCase().includes(searchquote.toLowerCase()) || 
				arrayelement['character'].toLowerCase().includes(searchchar.toLowerCase()) ;
			}
			else if(searchchar == "" && searchquote != ""){
				segmentFilterReturn = arrayelement['quote'].toLowerCase().includes(searchquote.toLowerCase());
			}
			else if(searchchar != "" && searchquote == ""){
				segmentFilterReturn = arrayelement['character'].toLowerCase().includes(searchchar.toLowerCase());
			}
			else if (searchchar != "" && searchquote != ""){
				segmentFilterReturn = arrayelement['quote'].toLowerCase().includes(searchquote.toLowerCase()) &&
				arrayelement['character'].toLowerCase().includes(searchchar.toLowerCase()) ;
			}
			return segmentFilterReturn;
		});
			for(var i = 0; i < filteredseglist.length; i++) {
				var segments = filteredseglist[i];
				console.log(segments);
				var name = segments['name'];
				var url = segments['url'];
				var char = segments['character'];
				var quote = segments['quote'];
				output += `<li>Video: ${name}<br><video height=240 width=320 controls><source src="${url}" type="video/ogg"></video><br>Character: ${char}<br>Quote: ${quote}<br><br></li>`;
			}
		segList.innerHTML = output + '</ul>';
	}
	processSegmentListResponse(response);
});
}



