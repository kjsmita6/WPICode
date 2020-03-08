package edu.wpi.breakeven.http;

import java.util.ArrayList;
import java.util.List;

import edu.wpi.breakeven.model.Segment;

public class ListSegmentResponse {
	public List<Segment> list;
	public int statusCode;
	public String error;
	
	public ListSegmentResponse() {
		this.list = new ArrayList<Segment>();
		this.statusCode = 0;
		this.error = "";
	}

	public ListSegmentResponse(List<Segment> list, int code) {
		this.list = list;
		this.statusCode = code;
		this.error = "";
	}
	
	public ListSegmentResponse(int code, String e) {
		this.list = new ArrayList<Segment>();
		this.statusCode = code;
		this.error = e;
	}
}