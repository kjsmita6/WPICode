package edu.wpi.breakeven.model;

import java.util.UUID;

public class ThirdPartySite {
	public String name;
	public String url;
	public String apikey;
	
	public ThirdPartySite(String name, String url, String api)
	{
		String uuid = UUID.randomUUID().toString().replace('-', '_');
		this.name = name == "" || name == null ? uuid : name;
		this.url = url;
		this.apikey = api;
	}
	
	public ThirdPartySite() {
		this.name = UUID.randomUUID().toString().replace('-', '_');
		this.url = null;
		this.apikey = null;
	}
}
