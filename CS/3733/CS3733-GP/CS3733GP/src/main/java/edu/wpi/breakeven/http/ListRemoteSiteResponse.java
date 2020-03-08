package edu.wpi.breakeven.http;

import java.util.ArrayList;
import java.util.List;

import edu.wpi.breakeven.model.ThirdPartySite;

public class ListRemoteSiteResponse {
	public List<ThirdPartySite> list;
	public int statusCode;
	public String error;

	public ListRemoteSiteResponse(List<ThirdPartySite> list, int code) {
		this.list = list;
		this.statusCode = code;
		this.error = "";
	}
	
	public ListRemoteSiteResponse(int code, String e) {
		this.list = new ArrayList<ThirdPartySite>();
		this.statusCode = code;
		this.error = e;
	}
}
