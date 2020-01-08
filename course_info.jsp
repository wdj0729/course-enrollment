<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>

<html><head><title>전체 강의 시간표 조회</title></head>
<body>

	<%@ include file="top.jsp"%>
	<% if (session_id == null)	response.sendRedirect("login.jsp");	%>
	
	<table width="75%" align="center" border>	<br>
		<tr>
            <th>과목번호</th>
            <th>교수명</th>
			<th>분반</th>
			<th>과목명</th>
            <th>학점</th>
            <th>개설연도</th>
			<th>개설학기</th>
			<th>교시</th>
			<th>학교/강의실</th>
			<th>수강정원</th>
		</tr>
		<%
			Connection myConn = null;
			ResultSet myResultSet = null;
			String mySQL = "";
			String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
			String user = "ST2013112136"; 
			String passwd = "ST2013112136";
			String dbdriver = "oracle.jdbc.driver.OracleDriver";

			try {
				Class.forName(dbdriver);
				myConn = DriverManager.getConnection(dburl, user, passwd);
			} catch (SQLException ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}
		                          
            mySQL = "select DISTINCT c.c_id, c.c_id_no, c.c_name, c_unit, t.t_year, t.t_semester, t.t_time, t.t_where, t.t_max, p.p_name, p.p_id from course c, teach t, professor p where t.t_year ='2020' and t_semester='1' ORDER BY t.t_time ASC";

			Statement stmt = myConn.createStatement();

			myResultSet = stmt.executeQuery(mySQL);

			if (myResultSet != null) {
				while (myResultSet.next()) {
					String c_id = myResultSet.getString("c_id");
					int c_id_no = myResultSet.getInt("c_id_no");
					String c_name = myResultSet.getString("c_name");
                    int c_unit = myResultSet.getInt("c_unit");
                    int t_year = myResultSet.getInt("t_year");
                    int t_semester = myResultSet.getInt("t_semester");
                    String p_name = myResultSet.getString("p_name");
					String p_id = myResultSet.getString("p_id");
					int t_time = myResultSet.getInt("t_time");
                    String t_where = myResultSet.getString("t_where");
                	String t_max = myResultSet.getString("t_max");
		%>
		<tr>
            <td align="center"><%=c_id%></td>
            <td align="center"><a href="prof_info.jsp?p_id=<%=p_id%>"><%=p_name%></a></td>
			<td align="center"><%=c_id_no%></td>
			<td align="center"><%=c_name%></td>
            <td align="center"><%=c_unit%></td>
            <td align="center"><%=t_year%></td>
			<td align="center"><%=t_semester%></td>
			<td align="center"><%=t_time%></td>
			<td align="center"><%=t_where%></td>
			<td align="center"><%=t_max%></td>
		</tr>
		<%
			  }
			}
			stmt.close();
			myConn.close();
		%>
	</table>
</body>
</html>