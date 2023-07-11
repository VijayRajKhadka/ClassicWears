package controller.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import resources.MyConstants;

public class DbConnection {
	
	//Getting database connection credential from MyConstants and storing into variables.
	private static final String JDBC_DRIVER = MyConstants.DRIVERNAME;

	private static final String URL = MyConstants.DB_URL;

	private static final String USERNAME = MyConstants.DB_USER_NAME;

	private static final String PASSWORD = MyConstants.DB_USER_PASSWORD;

	//Making connection
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
	    Connection con = null;
	    try {
	        Class.forName(JDBC_DRIVER);
	        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	    } catch (ClassNotFoundException | SQLException ex) {
	        ex.printStackTrace();
	        // or you can throw a custom exception and handle it in a JSP page
	        throw ex;
	    }
	    return con;
	}
}
	