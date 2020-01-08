<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>

<html><head><title>해당 교수 정보 조회</title></head>
<body>

	<%@ include file="top.jsp"%>
	<% if (session_id == null)	response.sendRedirect("login.jsp");	%>
	
	<table width="75%" align="center" border>	<br>
		<tr>
            <th>교수명</th>
            <th>소속학부</th>
            <th>소속학과</th>
			<th>이메일</th>
			<th>연락처</th>
		</tr>
		<%
			Connection myConn = null;
			ResultSet myResultSet = null;
			String mySQL = "";
			String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
			String user = "ST2013112136"; 
			String passwd = "ST2013112136";
            String dbdriver = "oracle.jdbc.driver.OracleDriver";
            
			String p_id = request.getParameter("p_id");

			try {
				Class.forName(dbdriver);
				myConn = DriverManager.getConnection(dburl, user, passwd);
			} catch (SQLException ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}
		                          
            mySQL = "select p_name, p_college, p_major, p_email, p_phonenumber from professor where p_id = '" + p_id +"'";

			Statement stmt = myConn.createStatement();

			myResultSet = stmt.executeQuery(mySQL);

			if (myResultSet != null) {
				while (myResultSet.next()) {
                    String p_name = myResultSet.getString("p_name");
                    String p_college = myResultSet.getString("p_college");
                    String p_major = myResultSet.getString("p_major");
                    String p_email = myResultSet.getString("p_email");
                    String p_phonenumber = myResultSet.getString("p_phonenumber");
		%>
		<tr>
            <td align="center"><%=p_name%></td>
			<td align="center"><%=p_college%></td>
            <td align="center"><%=p_major%></td>
            <td align="center"><%=p_email%></td>
			<td align="center"><%=p_phonenumber%></td>
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