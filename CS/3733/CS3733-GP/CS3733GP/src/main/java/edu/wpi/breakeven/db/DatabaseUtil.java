package edu.wpi.breakeven.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	public final static String host = "cs3733newrds.ch3bmkspbvns.us-east-1.rds.amazonaws.com";
	public final static String username = "admin";
	public final static String pass = "password";
	
	public final static String prefix = "jdbc:mysql://";
	public final static String port = "3306";
	public final static String postfix = "?allowMultiQueries=true";
	
	public final static String db = "innodb";
	
	static Connection conn;
	
	protected static Connection connect() throws Exception {
		if(conn != null) {
			return conn;
		}
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					prefix + host + ":" + port + "/" + db + postfix,
					username,
					pass);
			return conn;
		}
		catch(Exception e) {
			throw new Exception("Failed to connect to db: " + e.getMessage());
		}
	}
}