package edu.wpi.breakeven.model;
import java.util.UUID;

public class Segment {
	public String name;
	public String url;
	public double duration;
	public String quote;
	public String character;
	public int type;
	public String pl;
	public String uuid;
	
	public Segment(String name, String url, double duration, String character, String quote, int remote, String playlist) {
		uuid = UUID.randomUUID().toString().replace('-', '_');
		//generates a uuid from the last four characters of the character and the last four characters in the quote
		//better for testing because this uuid is predictable

		this.url = url == "" || url == null ? "https://bluh.s3.amazonaws.com/segments/real .ogg files/OGG/" + uuid + ".ogg" : url;
		this.duration = duration;
		this.character = character;
		this.quote = quote;
		this.name = name == null ? uuid : name;
		this.pl = playlist == "" || playlist == null ? "" : playlist;
		this.type = remote;
	}
}