package edu.wpi.breakeven.http;

public class MarkLocalResponse {
	public int code;
	public String message;
	
    public MarkLocalResponse() { 
    	this.code = 0;
    	this.message = null;
    }
    
    public MarkLocalResponse(int code, String message) {
    	this.code = code;
    	this.message = message;
    }
}