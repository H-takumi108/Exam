package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Teacher;

public class TeacherDAO extends Dao {
    public Teacher login(String id, String password)
    	throws Exception {
    	Teacher Teacher = null;

        Connection con = getConnection();

        PreparedStatement st;
        st = con.prepareStatement(
            "select * from Teacher where id=? and password=?");

        st.setString(1, id);
        st.setString(2, password);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Teacher = new Teacher();
            SchoolDao sDao = new SchoolDao();
            Teacher.setId(rs.getString("id"));
            Teacher.setPassword(rs.getString("password"));
            Teacher.setName(rs.getString("name"));
            Teacher.setSchool(sDao.get(rs.getString("school_cd")));
        }

        st.close();
        con.close();

        return Teacher;
    }
} 