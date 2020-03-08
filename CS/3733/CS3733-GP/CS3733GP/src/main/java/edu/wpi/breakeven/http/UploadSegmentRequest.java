package edu.wpi.breakeven.http;

public class UploadSegmentRequest {
	public String character;
	public String quote;
	public String base64;
	
	public UploadSegmentRequest() {
		character = "";
		quote = "";
		base64 = "";
	}
	
	public UploadSegmentRequest(String c, String q, String b64) {
		character = c;
		quote = q;
		base64 = b64;
	}
	
	public String toString() {
		return "uploadVideoSegment(" + character + ", " + quote + ", " + base64 + ")";
	}
}
