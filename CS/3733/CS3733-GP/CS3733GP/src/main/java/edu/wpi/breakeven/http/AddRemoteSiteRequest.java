package edu.wpi.breakeven.http;

import java.util.ArrayList;

public class AddRemoteSiteRequest 
{
	public String siteName;
	public String url;
	public String apikey;

	public AddRemoteSiteRequest(String siteName, String url, String api)
	{
		this.siteName = siteName;
		this.url = url;
		this.apikey = api;
	}
	
	public AddRemoteSiteRequest()
	{ }
}
