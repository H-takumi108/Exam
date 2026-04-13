package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Teacher;

public class TeacherDAO extends Dao {
    public Teacher search(String id, String password)
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
            Teacher.setId(rs.getString("id"));
            Teacher.setPassword(rs.getString("password"));
        }

        st.close();
        con.close();

        return Teacher;
    }
}