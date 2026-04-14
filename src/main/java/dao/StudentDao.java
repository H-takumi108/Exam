package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Student;

public class StudentDao extends Dao {
	
	private Strings baseSql;
	
	public Student get(String no) throws Exception {
		
	}
	
	private List<Student> postFilter(ResultSet rSet. School school) throws Exception {
		
	}
	
	public List<Student> filter(School school. int entYear. String classNum. booleam isAttend) throws Exception {
		
	}
	
	public LIst<Student> filter(School school. int entYear. boolean isAttend) throws Exception {
		
	}
	
	public List<Student> filter(School school. boolean isAttend) throws Exception {
		
	}
	
	public boolean save(Student student) throws Exception {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;
		
		try {
			Student old = get(student.getNo());
			if (old == null) {
				statement = connection.prepareStatement(
						"insert into student(no,name,ent_year,class_num,is_attend,school_cd) values(?,?,?,?,?,?)");
			statement.setString(1, student.getNo());
			statement.setString(2, student.getName());
			statement.setInt(3, student.getEntYear());
			statement.setString(4, student.getClassNum());
			statement.setBoolean(5, student.isAttend());
			statement.setString(6, student.getSchool().getCd());
			} else {
				statement = connection
						.prepareStatement("update student set name=?, ent_year=?, class_num=?, is_attend=?, where no=?");
				statement.setString(1, student.getName());
				statement.setInt(2, student.getEntYear());
				statement.setString(3, student.getClassNum());
				statement.setBoolean(4, student.isAttend());
				statement.setString(5, student.getNo());
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
	
}