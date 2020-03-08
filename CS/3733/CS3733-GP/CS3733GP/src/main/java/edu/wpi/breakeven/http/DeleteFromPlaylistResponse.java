package edu.wpi.breakeven.http;

public class DeleteFromPlaylistResponse {
	public String message;
	public int code;

    public DeleteFromPlaylistResponse(String message, int code) {
    	this.code = code;
    	this.message = message;
    }
}