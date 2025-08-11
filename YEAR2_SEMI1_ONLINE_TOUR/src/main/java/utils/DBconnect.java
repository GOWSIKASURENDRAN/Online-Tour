package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		String username = "root";
		String password = "123456";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_tour_db?characterEncoding=utf8",username,password);
		return con;
	
	}
}
