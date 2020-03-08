package edu.wpi.breakeven.model;

public class RemoteSegment {
	public String url;
	public String character;
	public String text;

	public RemoteSegment() { }

	public RemoteSegment(String url, String character, String text) {
		this.url = url;
		this.character = character;
		this.text = text;
	}
}