package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Student;
import bean.Subject;
import bean.Test;

public class TestDao extends Dao {

	private String baseSql = "SELECT s.ent_year,s.class_num,s.student_no,s.name AS student_name,"
			+ "t.no,t.point,sub.cd AS subject_cd,sub.name AS subject_name FROM student s ";

	public Test get(Student student,Subject subject,School school,int no) throws Exception {
		Test test = new Test();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		
		try {
			statement = connection.prepareStatement(
					"SELECT * FROM test WHERE student_no = ? AND subject_cd = ? AND school_cd = ? AND no = ?");
			statement.setString(1, student.getNo());
			statement.setString(2, subject.getCd());
			statement.setString(3, school.getCd());
			statement.setInt(4, no);
			ResultSet rSet = statement.executeQuery();
			SchoolDao schoolDao = new SchoolDao();
			
			if (rSet.next()) {
				
			}
		}
		
		return test;
	}
	
	public List<Test> postFilter(ResultSet rSet) throws Exception {
		List<Test> list = new ArrayList<Test>();
		try {
			while (rSet.next()) {
				Test test = new Test();
				test.setNo(rSet.getInt("no"));
				test.setPoint(rSet.getInt("point"));
				
				Student stu = new Student();
				stu.setEntYear(rSet.getInt("ent_year"));
				stu.setClassNum(rSet.getString("class_num"));
				stu.setNo(rSet.getString("student_no"));
				stu.setName(rSet.getString("student_name"));
				
				Subject sub = new Subject();
				sub.setCd(rSet.getString("subject_cd"));
				sub.setName(rSet.getString("subject_name"));
				
				test.setStudent(stu);
				test.setSubject(sub);
				
				list.add(test);
			}
		} catch (SQLException | NullPointerException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Test> filter(int entYear,String classNum,Subject subject,int num,School school) throws Exception {
		List<Test> list = new ArrayList<Test>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;
		String leftjoin = "LEFT JOIN test t ON s.student_no = t.student_no AND t.subject_cd = ? AND t.no = ? ";
		String leftjoin2 = "Left JOIN subject sub ON t.subject_cd = sub.cd ";
		String condition = "WHERE s.ent_year = ? AND s.class_num = ? AND s.school_cd = ? ";
		String order = "ORDER BY s.student_no";
		
		try {
			statement = connection.prepareStatement(baseSql+leftjoin+leftjoin2+condition+order);
			statement.setString(1, subject.getCd());
			statement.setInt(2, num);
			statement.setInt(3, entYear);
			statement.setString(4, classNum);
			statement.setString(5, school.getCd());

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

