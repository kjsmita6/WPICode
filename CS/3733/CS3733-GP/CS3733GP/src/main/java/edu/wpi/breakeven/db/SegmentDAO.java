package edu.wpi.breakeven.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.wpi.breakeven.ListSegmentsHandler;
import edu.wpi.breakeven.UploadSegmentHandler;
import edu.wpi.breakeven.model.Segment;

public class SegmentDAO {
	private Connection conn;
	public String table;
	
	public SegmentDAO() throws Exception {
		try {
			setTable("segment");
			conn = DatabaseUtil.connect();
		}
		catch(Exception e) {
			conn = null;
			throw e;
		}
	}
	
	public void setTable(String table) {
		this.table = table;
	}
	
	public Segment getSegment(String uuid) throws Exception {
		try {
			Segment seg = null;
			PreparedStatement ps = conn.prepareStatement("select * from " + table + " where name=?;");
			ps.setString(1,  uuid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				seg = generateSegment(rs);
			}
			rs.close();
			ps.close();
			return seg;
		}
		catch(Exception e) {
			e.printStackTrace();
			throw new Exception("Error getting segment: " + e.getMessage());
		}
	}
	
	public boolean updateSegment(Segment seg) throws Exception {
		try {
			String query = "update `" + table + "` set url=?,duration=?,stchar=?,quote=?,remote=?,playlist=? where name=?;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, seg.url);
			ps.setDouble(2, seg.duration);
			ps.setString(3, seg.character);
			ps.setString(4, seg.quote);
			ps.setInt(5, seg.type);
			ps.setString(6, seg.pl);
			ps.setString(7, seg.name);
			int rows = ps.executeUpdate();
			ps.close();
			return rows >= 1;
		}
		catch(Exception e) {
			throw new Exception("Failed to update segment: " + e.getMessage());
		}
	}
	
	public boolean deleteSegment(String name) throws Exception {
		try {
			PreparedStatement ps = conn.prepareStatement("delete from " + table + " where name=?;");
			ps.setString(1, name);
			int rows = ps.executeUpdate();
			ps.close();
			return rows >= 1;
		}
		catch(Exception e) {
			throw new Exception("Failed to delete segment: " + e.getMessage());
		}
	}
	public boolean markSegmentRemote(String name) throws Exception{
		try {
			Segment s = getSegment(name);
			PreparedStatement ps;
			if(s.type == 0) {
			ps = conn.prepareStatement("UPDATE "+ table +" SET remote = 1 WHERE name = ?;");
			ps.setString(1, name);
			}
			else {
			ps = conn.prepareStatement("UPDATE "+ table +" SET remote = 0 WHERE name=?;");
			ps.setString(1, name);
			}
			int rows = ps.executeUpdate();
			ps.close();
			return rows == 1;
			
		}catch(Exception e) {
			throw new Exception("Failed to mark segment remote: " + e.getMessage());
		}
	}

	public boolean addToPlaylist(String seg, String playlist) throws Exception {
		try {
			PreparedStatement ps = conn.prepareStatement("update " + table + " set playlist=? where name=?;");
			ps.setString(1, playlist);
			ps.setString(2, seg);
			int rows = ps.executeUpdate();
			//ps.close();
			return rows >= 1;
		}
		catch(Exception e) {
			throw new Exception("Failed to add to playlist: " + e.getMessage());
		}
	}
	
	public boolean addSegment(Segment seg) throws Exception {
		try {
			PreparedStatement ps = conn.prepareStatement("select * from " + table + " where name=?;");
			ps.setString(1, seg.name);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Segment s = generateSegment(rs);
				rs.close();
				return false;
			}
			ps = conn.prepareStatement("insert into " + table + " (name,url,duration,stchar,quote,remote,playlist) values"
					+ "(?,?,?,?,?,?,?);");
			ps.setString(1, seg.name);
			ps.setString(2, seg.url);
			ps.setDouble(3, seg.duration);
			ps.setString(4, seg.character);
			ps.setString(5, seg.quote);
			ps.setInt(6, seg.type);
			ps.setString(7, seg.pl);
			ps.execute();
			return true;
		}
		catch(Exception e) {
			throw new Exception("Failed to add segment: " + e.getMessage());
		}
	}
	
	public List<Segment> getAllSegments() throws Exception,SQLException {
		List<Segment> segments = new ArrayList<>();
		try {
			Statement statement = conn.createStatement();
			String query = "select * from " + table + ";";
			
			ResultSet rs = statement.executeQuery(query);
			while(rs.next()) {
				Segment s = generateSegment(rs);
				segments.add(s);
			}
			rs.close();
			statement.close();
			return segments;
		}
		catch(SQLException se) {
			throw se;
		}
		catch(Exception e) {
			throw new Exception("Failed to get segments: " + e.getMessage());
		}
	}
	
	private Segment generateSegment(ResultSet rs) throws Exception {
		String name = rs.getString("name");
		String url = rs.getString("url");
		double duration = rs.getDouble("duration");
		String character = rs.getString("stchar");
		String quote = rs.getString("quote");
		int remote = rs.getInt("remote");
		String playlist = rs.getString("playlist");
		return new Segment(name, url, duration, character, quote, remote, playlist);
	}
}
