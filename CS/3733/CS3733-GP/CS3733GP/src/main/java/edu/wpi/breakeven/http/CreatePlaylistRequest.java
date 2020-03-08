package edu.wpi.breakeven.http;


public class CreatePlaylistRequest {

	public String name;
	public int segments;
	
	public CreatePlaylistRequest() {
		name = "";
		segments = 0;
	}
	
	public CreatePlaylistRequest(String c, int i) {
		name = c;
		segments = i;
	}
	
//	public String toString() {
//		return "createPlaylist" + name + ", " + segments;
//	}
}