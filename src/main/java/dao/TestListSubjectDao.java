package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Student;
import bean.TestListStudent;
import bean.TestListSubject;

public class TestListSubjectDao extends Dao {

	private String baseSql = "SELECT sub.name AS subject_name,t.subject_cd AS subject_cd,t.no,t.point FROM TEST t ";

	public List<TestListSubject> postFilter(ResultSet rSet) throws Exception {
		List<TestListSubject> list = new ArrayList<TestListSubject>();
		try {
			while (rSet.next()) {
				TestListSubject tlsub = new TestListSubject();
				tls.set(rSet.getString("subject_name"));
				tls.setSubjectCd(rSet.getString("subject_cd"));
				tls.setNum(rSet.getInt("no"));
				tls.setPoint(rSet.getInt("point"));
				
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
		String join = "INNER JOIN SUBJECT sub ON t.subject_cd = sub.cd AND t.school_cd = sub.school_cd ";
		String condition = "WHERE t.student_no = ? AND t.school_cd = ? ";
		String order = "ORDER BY sub.name,t.no ";
		
		try {
			statement = connection.prepareStatement(baseSql+join+condition+order);
			statement.setString(1,student.getNo());
			statement.setString(2,student.getSchool().getCd());

			rSet = statement.executeQuery();
			
			list = postFilter(rSet);
		} catch (Exception e) {
			throw e;
		} finally {
			if (rSet != null) {
			    try {
			        rSet.close();
			    } catch (SQLException e) {
			        throw e;
			    }
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
}

