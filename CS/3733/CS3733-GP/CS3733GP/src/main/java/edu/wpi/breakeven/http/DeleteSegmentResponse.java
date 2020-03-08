package edu.wpi.breakeven.http;

public class DeleteSegmentResponse {
	public String message;
	public int code;
	
	public DeleteSegmentResponse(int code, String message)
	{
		this.code = code;
		this.message = message;
	}
	
	public DeleteSegmentResponse() {}
}
