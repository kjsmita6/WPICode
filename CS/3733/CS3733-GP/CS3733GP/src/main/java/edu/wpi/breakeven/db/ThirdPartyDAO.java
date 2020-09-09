package edu.wpi.breakeven.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.wpi.breakeven.model.ThirdPartySite;

public class ThirdPartyDAO {
	private Connection conn;
	private String table;
	
	public ThirdPartyDAO() {
		try {
			conn = DatabaseUtil.connect();
			table = "thirdpartysites";
		}
		catch(Exception e) {
			conn = null;
		}
	}
	
	public void setTable(String table) {
		this.table = table;
	}
	
	public ThirdPartySite getThirdParty(String name) throws Exception{
		try {
			ThirdPartySite thirdpartysites = null;
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM " + table + " WHERE name=?;");
			ps.setString(1, name);
			ResultSet resultSet = ps.executeQuery();
			while(resultSet.next()) {
				thirdpartysites = generateThirdParty(resultSet);
			}
			resultSet.close();
			ps.close();
			return thirdpartysites;
		}
		catch (Exception e) {
			throw new Exception("Failed to update report:" + e.getMessage());
		}
	}

	public boolean deleteThirdParty(String name) throws Exception {
		try {
			PreparedStatement ps = conn.prepareStatement("delete from " + table + " WHERE name=?;");
			ps.setString(1, name);
			int numAffected = ps.executeUpdate();
			ps.close();
			return (numAffected == 1);
		}
		catch (Exception e) {
			throw new Exception("Failed to insert constant: " + e.getMessage());
		}
	}

	public boolean addThirdPartySite(ThirdPartySite thirdpartysites) throws Exception {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM " + table + " where name=?;");
			ps.setString(1, thirdpartysites.name);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				ThirdPartySite thirdpartysite = generateThirdParty(resultSet);
				resultSet.close();
				return false;
			}
			ps = conn.prepareStatement("INSERT INTO " + table + " (name,url,apikey) values(?,?,?);");
			ps.setString(1, thirdpartysites.name);
			ps.setString(2, thirdpartysites.url);
			ps.setString(3, thirdpartysites.apikey);
			//ps.setDouble(2, thirdpartysites.entries);
			ps.execute();
			return true;
		}
		catch (Exception e) {
			throw new Exception("Failed in insert thirdpartysites: " + e.getMessage());
		}
	}

	public List<ThirdPartySite> getAllThirdParty() throws Exception {
		List<ThirdPartySite> allThirdPartySite = new ArrayList<>();
		try {
			Statement statement = conn.createStatement();
			String query = "SELECT * FROM " + table + ";";
			ResultSet resultSet = statement.executeQuery(query);
			while(resultSet.next()) {
				ThirdPartySite thirdpartysites = generateThirdParty(resultSet);
				allThirdPartySite.add(thirdpartysites);
			}
			resultSet.close();
			statement.close();
			return allThirdPartySite;
		}
		catch (Exception e) {
			throw new Exception("Failed to get " + table + ": " + e.getMessage());
		}
	}

	private ThirdPartySite generateThirdParty(ResultSet resultSet) throws Exception {
		String name = resultSet.getString("name");
		String url = resultSet.getString("url");
		String api = resultSet.getString("apikey");
		return new ThirdPartySite (name, url, api);
	}
}