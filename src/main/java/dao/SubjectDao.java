package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Subject;

public class SubjectDao extends Dao {
	
	
	public Subject get(String cd,School school) throws Exception {
	    Connection connection = getConnection();
	    PreparedStatement statement = null;
	    ResultSet rSet = null;

	    try {
	        statement = connection.prepareStatement(
	            "select * from subject where cd = ? and school_cd = ?"
	        );
	        statement.setString(1, cd);
	        statement.setString(2, school.getCd());

	        rSet = statement.executeQuery();
	        
	        
	        Subject subject = null;

	        if (rSet.next()) {
	            subject = new Subject();
	            subject.setCd(rSet.getString("cd"));
	            subject.setName(rSet.getString("name"));

	            School sch = new School();
	            sch.setCd(rSet.getString("school_cd"));
	            subject.setSchool(sch);
	        }
	        return subject;
	    } catch (Exception e) {
			throw e;
		} finally {
			if (rSet != null) {
			    rSet.close();
			}
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}
	}
	
	
	public List<Subject> filter(School school) throws Exception {
		List<Subject> list = new ArrayList<>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.prepareStatement("select name,cd from subject where school_cd = ?");
			statement.setString(1, school.getCd());
			
			rs = statement.executeQuery();
			
			while(rs.next()) {
				Subject subject = new Subject();
				subject.setSchool(school);
				subject.setCd(rs.getString("cd"));
				subject.setName(rs.getString("name"));
				
				
				list.add(subject);
			}
			
		} catch (Exception e) {
			throw e;
		} finally {
			if (rs != null) {
			    rs.close();
			}
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}
	
		return list;
	}
	
	
	
	public boolean save(Subject subject) throws Exception {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;
		
		try {
			Subject old = get(subject.getCd(),subject.getSchool());
			if (old == null) {
				statement = connection.prepareStatement(
						"insert into subject(school_cd,cd,name) values(?,?,?)");
				
				statement.setString(1, subject.getSchool().getCd());
				statement.setString(2, subject.getCd());
				statement.setString(3, subject.getName());
			} else {
				statement = connection
						.prepareStatement("update subject set name=? where school_cd = ? and cd = ?");
				statement.setString(1, subject.getName());
				statement.setString(2, subject.getSchool().getCd());
				statement.setString(3, subject.getCd());
			}
			count = statement.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
			
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		} 
		
		if (count > 0) {
			return true;
		} else {
			return false;
		}
	} 
	
	
	public boolean delete(Subject subject) throws Exception {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;
		
		try {
			statement = connection.prepareStatement(
					"delete from subject where school_cd = ? and cd = ?");
			statement.setString(1, subject.getSchool().getCd());
			statement.setString(2, subject.getCd());
			count = statement.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
			
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		} 
		
		if (count > 0) {
			return true;
		} else {
			return false;
		}
	} 
	
}