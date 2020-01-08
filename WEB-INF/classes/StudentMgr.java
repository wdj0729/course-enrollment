package studentUpdateBean;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import studentUpdateBean.*;

public class StudentMgr {
    private OracleConnectionPoolDataSource ocpds = null;
    private PooledConnection pool = null;

    public StudentMgr() {
        try {
            ocpds = new OracleConnectionPoolDataSource();

        	ocpds.setURL("jdbc:oracle:thin:@210.94.199.20:1521:dblab");
	ocpds.setUser("ST2013112136");
	ocpds.setPassword("ST2013112136");

            pool = ocpds.getPooledConnection();
        } catch (SQLException e) {
            System.out.println("Error : Connection Failed");
        }
    }

    public Student getStudent(String s_id) {
        Student student = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = pool.getConnection();

            String mySQL = "select * from student " +
                    "where s_id = ?";
            pstmt = conn.prepareStatement(mySQL);
            pstmt.setString(1, s_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                student = new Student();
                student.setS_id(rs.getString("s_id"));
                student.setS_name(rs.getString("s_name"));
                student.setS_addr(rs.getString("s_addr"));
                student.setS_year(rs.getInt("s_year"));
                student.setS_college(rs.getString("s_college"));
                student.setS_major(rs.getString("s_major"));
                student.setS_pwd(rs.getString("s_pwd"));
	   student.setS_phonenumber(rs.getString("s_phonenumber"));
            }
            pstmt.close();
            conn.close();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        }
        return student;
    }

    public void updateStudent(Student student) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        conn = pool.getConnection();
        String mySQL = "update student" +
                " set s_name = ?, " +
                " s_addr = ?," +
                "s_year = ?," +
                "s_college = ?," +
                "s_major = ?," +
                "s_pwd = ? " +
	   "s_phonenumber = ? " +
                "where s_id=?";
        pstmt = conn.prepareStatement(mySQL);
        pstmt.setString(1, student.getS_name());
        pstmt.setString(2, student.getS_addr());
        pstmt.setInt(3, student.getS_year());
        pstmt.setString(4, student.getS_college());
        pstmt.setString(5, student.getS_major());
        pstmt.setString(6, student.getS_pwd());
        pstmt.setString(7, student.getS_id());
        pstmt.setString(8, student.getS_phonenumber());
        pstmt.executeUpdate();

        pstmt.close();
        conn.close();
    }
}