package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Subject;
import bean.TestListSubject;


public class TestListSubjectDao extends Dao {

	private String baseSql = 
			"SELECT s.ent_year,s.class_num,s.no AS student_no,s.name AS student_name,t.no AS test_no,t.point FROM student s ";

	public List<TestListSubject> postFilter(ResultSet rSet) throws Exception {
		List<TestListSubject> list = new ArrayList<TestListSubject>();
		
		try {
			TestListSubject tlsub = null;
			String stubaseNo = null;
			
			while (rSet.next()) {
				String stuNo = rSet.getString("student_no");
				
				if(stubaseNo == null || !stuNo.equals(stubaseNo)) {
					tlsub = new TestListSubject();
					tlsub.setEntYear(rSet.getInt("ent_year"));
					tlsub.setClassNum(rSet.getString("class_num"));
					tlsub.setStudentNo(rSet.getString("student_no"));
					tlsub.setStudentName(rSet.getString("student_name"));
					tlsub.setPoint(new java.util.HashMap<>());
					
					list.add(tlsub);
					stubaseNo = stuNo;
				}
				int testNo = rSet.getInt("test_no");
		        int point = rSet.getInt("point");

		        tlsub.putPoint(testNo, point);
			}
		} catch (SQLException | NullPointerException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<TestListSubject> filter(int entYear,String classNum,Subject subject,School school) throws Exception {
		List<TestListSubject> list = new ArrayList<TestListSubject>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;
		String join = "INNER JOIN test t ON s.no = t.student_no AND s.school_cd = t.school_cd ";
		String condition = "WHERE s.ent_year = ? AND s.class_num = ? AND t.subject_cd = ? AND s.school_cd = ? ";
		String order = "ORDER BY s.no,t.no";
		
		try {
			statement = connection.prepareStatement(baseSql+join+condition+order);
			statement.setInt(1,entYear);
			statement.setString(2,classNum);
			statement.setString(3,subject.getCd());
			statement.setString(4,school.getCd());

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

