package edu.wpi.breakeven.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.wpi.breakeven.model.Playlist;

public class PlaylistDAO {
	private Connection conn;
	private String table;

	public PlaylistDAO() {
		try {
			setTable("playlist");
			conn = DatabaseUtil.connect();
		}
		catch(Exception e) {
			conn = null;
		}
	}

	public void setTable(String table) {
		this.table = table;
	}

	public Playlist getPlaylist(String name) throws Exception{
		try {
			Playlist playlist = null;
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM " + table + " WHERE name=?;");
			ps.setString(1, name);
			ResultSet resultSet = ps.executeQuery();
			while(resultSet.next()) {
				playlist = generatePlaylist(resultSet);
			}
			resultSet.close();
			ps.close();
			return playlist;
		}
		catch (Exception e) {
			throw new Exception("Failed to update report:" + e.getMessage());
		}
	}

	public boolean updatePlaylist(Playlist Playlist) throws Exception {
		try {
			String query = "UPDATE " + table + " SET segments=? WHERE name=?;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, Playlist.segments);
			ps.setString(2, Playlist.name);
			int numAffected = ps.executeUpdate();
			ps.close();
			return (numAffected == 1);
		}
		catch (Exception e) {
			throw new Exception("Failed to update report: " + e.getMessage());
		}
	}

	public boolean deletePlaylist(String name) throws Exception {
		try {
			//PreparedStatement ps = conn.prepareStatement("SELECT * FROM playlist WHERE name=?;");
			PreparedStatement ps = conn.prepareStatement("delete from " + table + " where name=?");
			ps.setString(1, name);
			int numAffected = ps.executeUpdate();
			ps.close();
			return (numAffected == 1);
		}
		catch (Exception e) {
			throw new Exception("Failed to insert constant: " + e.getMessage());
		}
	}

	public boolean addPlaylist(Playlist playlist) throws Exception {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM " + table + " where name=?;");
			ps.setString(1, playlist.name);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				resultSet.close();
				return false;
			}
			ps = conn.prepareStatement("INSERT INTO " + table + "(name,segments) values(?,?);");
			ps.setString(1, playlist.name);
			ps.setInt(2, playlist.segments);
			ps.execute();
			return true;
		}
		catch (Exception e) {
			throw new Exception("Failed in insert playlist: " + e.getMessage());
		}
	}

	public List<Playlist> getAllPlaylist() throws Exception {
		List<Playlist> allPlaylist = new ArrayList<>();
		try {
			Statement statement = conn.createStatement();
			String query = "SELECT * FROM " + table + ";";
			ResultSet resultSet = statement.executeQuery(query);
			while(resultSet.next()) {
				Playlist p = generatePlaylist(resultSet);
				allPlaylist.add(p);
			}
			resultSet.close();
			statement.close();
			return allPlaylist;
		}
		catch (Exception e) {
			throw new Exception("Failed in getting segments: " + e.getMessage());
		}
	}

	private Playlist generatePlaylist(ResultSet resultSet) throws Exception {
		String name = resultSet.getString("name");
		int value = resultSet.getInt("segments");
		return new Playlist (name, value);
	}
}