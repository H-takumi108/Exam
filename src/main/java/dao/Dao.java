package dao;

import java.sql.Connection;

public class Dao {
	static DateSourse ds;
//データベース未接続なのでエラー	
	public Connection getConnection() throws Exception {
		return ds.getConnection();
	}
}