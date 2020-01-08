<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>수강신청 입력</title></head>
<body>
<%
	Connection myConn = null;
	int result = 0;
	int current= 0;
	String mySQL = "";
	String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:DBLAB";
	String user = "ST2013112136";   // 본인 아이디(ex.ST0000000000)
	String passwd = "ST2013112136";  // 본인 비밀번호(ex.ST0000000000)
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	
	String c_id = request.getParameter("c_id");
	String c_id_no = request.getParameter("c_id_no");
	try {
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection(dburl, user, passwd);
	} catch (SQLException ex) {
		System.err.println("SQLException : " + ex.getMessage());
	}

	mySQL = "select c_id from enroll where c_id ='<%=c_id>'";
	Statement stmt = myConn.createStatement();
	ResultSet myResultSet = stmt.executeQuery(mySQL);
	ResultSetMetaData rsmd = myResultSet .getMetaData();
	current = rsmd.getColumnCount();

	CallableStatement cstmt = myConn.prepareCall("{call CheckCourse(?, ?, ?, ?)}");
	cstmt.setString(1,c_id);
	cstmt.setString(2, c_id_no);
	cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
	cstmt.registerOutParameter(4, java.sql.Types.INTEGER);
	try {
		cstmt.execute();
		result = cstmt.getInt(3);
                        current = cstmt.getInt(4);
%>
	
<script>
	alert("모집인원은 " + "<%= result%>" +"명이며, 현재 수강 신청을 할 수 있는 인원은 " + "<%= result-current%>" + "명 입니다.");
	location.href = "insert.jsp";
</script>
<%
	} catch (SQLException ex) {
		System.err.println("SQLException : " + ex.getMessage());
	} finally {
		if (cstmt != null)
			try {
				myConn.commit();
				cstmt.close();
				myConn.close();
			} catch (SQLException ex) {
				
			}
	}
%>
</body></html>