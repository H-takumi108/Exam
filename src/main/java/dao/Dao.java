package dao;

import java.sql.Connection;

public class Dao {
	static DateSourse ds;
	
	public Connection getConnection() throws Exception {
		return ds.getConnection();
	}
} 