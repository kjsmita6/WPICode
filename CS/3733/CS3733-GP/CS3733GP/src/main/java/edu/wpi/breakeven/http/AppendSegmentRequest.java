package edu.wpi.breakeven.http;

public class AppendSegmentRequest {
	public String segmentName;
	public String playlistName;
	
	public AppendSegmentRequest() {
		segmentName = "";
		playlistName = "";
	}
	
	public AppendSegmentRequest(String s, String p) {
		segmentName = s;
		playlistName = p;
	}
//	public String toString() {
//		return "CreateConstant( + segmentName)";
//	}
}
