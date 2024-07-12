package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;
public class DB {
	private static Connection con;
	public static Connection getConn() throws ClassNotFoundException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:oracle", "EBOOK_APP", "ebook");
		}catch(Exception e) {
			e.printStackTrace();
			throw new ClassNotFoundException("class not detect jdbc...");
		}
		if(con != null) {
			System.out.println("Connect...");
		}
		else
			System.out.println("not connect...");
		return con;
	}
	
	
}
