package edu.wpi.breakeven.http;


public class AppendSegmentResponse {
	public String response;
	public int httpCode;
	
	public AppendSegmentResponse(String s, int code) {
		this.response = s;
		this.httpCode = code;
	}
	
//	public String toString() {
//	return "AppendSegmentResponse(" + response + ")";
//	}
}
