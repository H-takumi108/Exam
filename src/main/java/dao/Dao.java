package dao;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Dao {
	static DataSource ds;
//データベース未接続なのでエラー	
	public Connection getConnection() throws Exception {
		if (ds==null) {
			InitialContext ic=new InitialContext();
			// データベース接続
			ds=(DataSource)ic.lookup("java:/comp/env/jdbc/DB2_kouka2");
		}
		return ds.getConnection();
	}
}