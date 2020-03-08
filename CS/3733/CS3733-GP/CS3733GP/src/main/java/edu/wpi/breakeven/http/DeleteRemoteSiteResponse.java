package edu.wpi.breakeven.http;

public class DeleteRemoteSiteResponse {
	
	public int statusCode;
	public String error;
	
	public DeleteRemoteSiteResponse (int statusCode, String errorMessage) {
		this.statusCode = statusCode;
		this.error = errorMessage;
	}
}
