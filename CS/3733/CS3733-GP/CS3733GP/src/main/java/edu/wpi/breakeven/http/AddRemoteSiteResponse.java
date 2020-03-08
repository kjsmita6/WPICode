package edu.wpi.breakeven.http;
import java.util.ArrayList;
import java.util.List;

import edu.wpi.breakeven.model.Segment;
import edu.wpi.breakeven.model.ThirdPartySite;

public class AddRemoteSiteResponse {
	
	public int statusCode;
	public String error;
	
	public AddRemoteSiteResponse () {
//		statusCode = 0;
//		error = "";
	}

	public AddRemoteSiteResponse (int statusCode, String errorMessage) {
		this.statusCode = statusCode;
		this.error = errorMessage;
	}
	
//	public String toString() { 
//		return "AddRemoteSite(" + statusCode + ", " + error + ")";
//	}
}
