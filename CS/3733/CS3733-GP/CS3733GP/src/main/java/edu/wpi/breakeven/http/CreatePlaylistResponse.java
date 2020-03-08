package edu.wpi.breakeven.http;

public class CreatePlaylistResponse {

	public String response;
	public int httpCode;

	public CreatePlaylistResponse (String s, int code) {
		this.response = s;
		this.httpCode = code;
	}

	public CreatePlaylistResponse () {
	}
}