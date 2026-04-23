package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Student;
import bean.TestListStudent;

public class TestListStudentDao extends Dao {

	private String baseSql = "";

	public List<TestListStudent> postFilter(ResultSet rSet) throws Exception {
		List<TestListStudent> list = new ArrayList<TestListStudent>();
		try {
			while (rSet.next()) {
				TestListStudent tls = new TestListStudent();
				tls.setSubjectName(rSet.getString("subjectName"));
				tls.setSubjectCd("subjectCd");
				tls.setNum(rSet.getInt("num"));
				tls.setPoint(rSet.getInt("point"));;
				
				list.add(tls);
			}
		} catch (SQLException | NullPointerException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<TestListStudent> filter(Student student) throws Exception {
		List<TestListStudent> list = new ArrayList<TestListStudent>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;
		String condition = "";
		String order = "";
		
		String conditionIsAttend = "";
		if () {
			conditionIsAttend = "";
		}
		
		try {
			statement = connection.prepareStatement();
			statement.setInt(1, student.getEntYear());
			statement.setString(2, student.getClassNum());
			statement.setString(3, student.get);
			rSet = statement.executeQuery();
			
			list = postFilter(rSet, school);
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
		return list;
	}
}
