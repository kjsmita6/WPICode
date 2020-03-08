package edu.wpi.breakeven.model;

public class Playlist {
	public String name;
	public int segments;
	
	public Playlist(String name, int segments)
	{
		this.segments = segments;
		this.name = name;
	}
	
//	public void appendSegment(Segment segment)
//	{
//		entries.add(segment);	
//	}
//	
//	public void removeSegment(Segment segment)
//	{
//		entries.remove(segment);	
//	}
}
