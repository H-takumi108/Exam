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

	private String baseSql = "SELECT s.ent_year,s.class_num,s.no,s.name AS student_name,"
			+ "t.no,t.point,sub.cd AS subject_cd,sub.name AS subject_name,s.is_attend,s.school_cd FROM student s ";

	public Test get(Student student,Subject subject,School school,int no) throws Exception {
		Test test = new Test();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;
		try {
			statement = connection.prepareStatement(
					"SELECT * FROM test WHERE student_no = ? AND subject_cd = ? AND school_cd = ? AND no = ?");
			statement.setString(1, student.getNo());
			statement.setString(2, subject.getCd());
			statement.setString(3, school.getCd());
			statement.setInt(4, no);
			rSet = statement.executeQuery();
			
			if (rSet.next()) {
				SchoolDao schoolDao = new SchoolDao();
				StudentDao studentDao = new StudentDao();
				SubjectDao subjectDao = new SubjectDao();
				test.setStudent(studentDao.get(rSet.getString("student_no")));
				test.setClassNum(rSet.getString("class_num"));
				test.setSubject(subjectDao.get(rSet.getString("subject_cd"),schoolDao.get(rSet.getString("school_cd"))));
				test.setSchool(schoolDao.get(rSet.getString("school_cd")));
				test.setNo(rSet.getInt("no"));
				test.setPoint(rSet.getInt("point"));
			} else {
				test = null;
			}
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
		return test;
	}
	
	public List<Test> postFilter(ResultSet rSet) throws Exception {
		List<Test> list = new ArrayList<Test>();
		try {
			while (rSet.next()) {
				Test test = new Test();
				test.setNo(rSet.getInt("no"));
				test.setPoint(rSet.getInt("point"));
				School school = new School();
				school.setCd(rSet.getString("school_cd"));
				test.setSchool(school);
				
				Student stu = new Student();
				stu.setEntYear(rSet.getInt("ent_year"));
				stu.setClassNum(rSet.getString("class_num"));
				stu.setNo(rSet.getString("no"));
				stu.setName(rSet.getString("student_name"));
				stu.setAttend(rSet.getBoolean("is_attend"));
				
				Subject sub = new Subject();
				sub.setCd(rSet.getString("subject_cd"));
				sub.setName(rSet.getString("subject_name"));
				
				test.setStudent(stu);
				test.setSubject(sub);
				
				list.add(test);
			}
		} catch (SQLException e) {
		    throw e;
		}
		return list;
	}
	
	public List<Test> filter(int entYear,String classNum,Subject subject,int num,School school) throws Exception {
		List<Test> list = new ArrayList<Test>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;
		String leftjoin = "LEFT JOIN test t ON s.no = t.student_no AND s.school_cd = t.school_cd AND t.subject_cd = ? AND t.no = ? ";
		String leftjoin2 = "Left JOIN subject sub ON t.subject_cd = sub.cd AND t.school_cd = sub.school_cd ";
		String condition = "WHERE s.ent_year = ? AND s.class_num = ? AND s.school_cd = ? ";
		String order = "ORDER BY s.no";
		
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
	
	public boolean save(List<Test> list) throws Exception {
	    Connection connection = getConnection();
	    boolean result = true;

	    try {
	        connection.setAutoCommit(false); 
	        for (Test test : list) {
	            boolean r = save(test, connection); 
	            if (!r) {
	                result = false;
	                break;
	            }
	        }
	        if (result) {
	            connection.commit();
	        } else {
	            connection.rollback();
	        }

	    } catch (Exception e) {
	        if (connection != null) {
	            connection.rollback();
	        }
	        throw e;

	    } finally {
	        if (connection != null) {
	            try {
	                connection.setAutoCommit(true);
	                connection.close();
	            } catch (SQLException e) {
	                throw e;
	            }
	        }
	    }

	    return result;
	}
	
	public boolean save(Test test, Connection connection) throws Exception {
		PreparedStatement statement = null;
		int count = 0;
		
		try {
			Student student = test.getStudent();
			Subject subject = test.getSubject();
			School school = test.getSchool();
			int no = test.getNo();
			
			Test old = get(student, subject, school, no);
			
			if (old == null) {
				statement = connection.prepareStatement(
						"insert into test(student_no,subject_cd,school_cd,no,point,class_num) values(?,?,?,?,?,?)");
				statement.setString(1, test.getStudent().getNo());
				statement.setString(2, test.getSubject().getCd());
				statement.setString(3, test.getSchool().getCd());
				statement.setInt(4, test.getNo());
				statement.setInt(5, test.getPoint());
				statement.setString(6, test.getClassNum());
			} else {
				statement = connection.prepareStatement(
						"update test set point=? where student_no=? AND subject_cd=? AND school_cd=? AND no=?");
				statement.setInt(1, test.getPoint());
		        statement.setString(2, test.getStudent().getNo());
		        statement.setString(3, test.getSubject().getCd());
		        statement.setString(4, test.getSchool().getCd());
		        statement.setInt(5, test.getNo());
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
		}
		
		if (count > 0) {
			return true;
		} else {
			return false;
		}
	} 	
}

