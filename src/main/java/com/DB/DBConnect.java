package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnect {
	private static  Connection conn;
	public static Connection getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:oracle", "EBOOK_APP", "ebook");
					
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(conn!=null)
			System.out.println("Connected ...");
		else
			System.out.println("Nottt....");
		return conn;
	}

}

