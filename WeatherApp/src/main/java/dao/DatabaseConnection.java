package dao;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import util.Config;

/**
 * The {@code DatabaseConnection} class provides connections, using DBCP as a
 * library for creating connection pools.
 * 
 * @author Margarita Skokova
 */
public class DatabaseConnection {
	private static String JDBC_DRIVER = Config.getConfigDB(Config.Key.JDBC_DRIVER);
	private static String URL = Config.getConfigDB(Config.Key.DB_URL);
	private static String user = Config.getConfigDB(Config.Key.DB_USER);
	private static String password = Config.getConfigDB(Config.Key.DB_PASSWORD);
	private static BasicDataSource basicSource = new BasicDataSource();

	static {
		basicSource.setDriverClassName(JDBC_DRIVER);
		basicSource.setUrl(URL);
		if (user != null && password != null) {
			basicSource.setUsername(user);
			basicSource.setPassword(password);
		}
		basicSource.setMinIdle(5);
		basicSource.setMaxIdle(10);
		basicSource.setMaxOpenPreparedStatements(100);
	}

	public static Connection getConnection() throws SQLException {
		return basicSource.getConnection();
	}

	private DatabaseConnection() {
	}
}
