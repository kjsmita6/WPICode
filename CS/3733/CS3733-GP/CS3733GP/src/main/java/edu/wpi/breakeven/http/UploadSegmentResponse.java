package edu.wpi.breakeven.http;

public class UploadSegmentResponse {
	public final int statusCode;
	public final String error;
	
	public UploadSegmentResponse() { 
		statusCode = 0;
		error = "";
	}
	
	public UploadSegmentResponse(int statusCode, String error) {
		this.statusCode = statusCode;
		this.error = error;
	}
}
