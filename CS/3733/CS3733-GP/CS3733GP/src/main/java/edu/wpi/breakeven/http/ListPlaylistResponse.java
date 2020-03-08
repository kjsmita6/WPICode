package edu.wpi.breakeven.http;

import java.util.ArrayList;
import java.util.List;

import edu.wpi.breakeven.model.Playlist;

public class ListPlaylistResponse {
	public List<Playlist> list;
	public int statusCode;
	public String error;
	
	public ListPlaylistResponse(List<Playlist> list, int code) {
		this.list = list;
		this.statusCode = code;
		this.error = "";
	}
	
	public ListPlaylistResponse(int code, String e) {
		this.list = new ArrayList<Playlist>();
		this.statusCode = code;
		this.error = e;
	}
	
}