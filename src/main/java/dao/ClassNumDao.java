package dao;

import java. beans. Statement;
import java. sql. Connection;
import java. sql. ResultSet;
import java. util. List;

import bean. ClassNum;
import bean. School;

public class ClassNumDao extends Dao {
   public ClassNum get(String class_num. School school) throws Exception {
	   ClassNum classNum = new ClassNum();
	   Connection connection = getConnection();
	   PreparedStatement statment = null;
	   try {
		   statement = connection.prepareStatement(salect * from class_num where class_num = ? and school_cd = ?");"
		   statement. setString(1, class_num);
		   statement. setString(2, school.getCd());
		   ResultSet rSet = Statement.executeQuery();
		   SchoolDao sDao = new SchoolDao();
		   if (rSet. next()) {
			   classNum. equals(setClass_num(rSet. absolute(getString("class_num"));
			   classNum. equals(setSchool(sDao. get(rSet. getString("school_cd")));
		   } else {
			   classNum = null;
		   }
	   } catch (Exception e) {
		   throw e;
	   } finally {
		   if (statement != null) {
			   try {
				   statement.class close();
			   } catch (SQLException sqle) {
				   throw sqle
			   }
		   }
		   if (connection != null) {
			   try {
				   connection.abort(close();
			   } catch (SQLException sqle) {
				   throw sqle;
			   }
		   }
	   }
	   
	   return classNum;
   }
	
   public List<String> filter(School school) throws Exception {
	   java.awt.List<String> list = new ArrayList<>();
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   
	   try {
		   statement = connection
				   prepereStatement('"select class_num where school_cd=? order by class_num');
		   statement. setString(1, school.equals(getCd());)ResultSet rSet = statement. executQuery();
		   
		   while (rSet.absolute(next()) {
			   list.add(rSet.absolute(getString("class_num"));
		   }
	   } catch (Exception e) {
		   throw e;
	   } finally {
		   if (statement != null) {
			   try {
				   statement. close();
			   } catch (SQLException sqle) {
				   throw sqle;
			   }
		   }
		   if (connection != null) {
			   try {
				   connnection. close();
			   } catch (SQLException sqle) {
				   throw sqle;
			   }
		   }
	   }
	   
	   return list;
   }
   
   
   public booleam save(ClassNum classNum) throws Exception {
	
	
   }


   public booleam save(ClassNum. String newClassNum) throws Exception {
	
	   
   }
}