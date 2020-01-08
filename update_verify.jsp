<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head><title> 수강신청 사용자 정보 수정 </title></head>
<body>
<%
	String s_id = request.getParameter("s_id");
	
	String s_name = new String(request.getParameter("s_name").getBytes("8859_1"),"utf-8");
	String s_addr = new String(request.getParameter("s_addr").getBytes("8859_1"),"utf-8");
	String s_pwd = new String(request.getParameter("s_pwd"));
	String s_college = new String(request.getParameter("s_college").getBytes("8859_1"),"utf-8");
	String s_major = new String(request.getParameter("s_major").getBytes("8859_1"),"utf-8");	
	String s_phonenumber = new String(request.getParameter("s_phonenumber").getBytes("8859_1"),"utf-8");	

	Connection myConn = null;
	Statement stmt = null;
	String mySQL = "";
	
	String dburl ="jdbc:oracle:thin:@210.94.199.20:1521:dblab";
	String user ="ST2013112136";
	String passwd = "ST2013112136";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	
	try{
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();
	} 
	catch(SQLException ex){
			System.err.println("SQLException: " + ex.getMessage());
	}
	mySQL = "update student ";
	mySQL = mySQL + " set s_name ='" + s_name + "' , " ;
	mySQL = mySQL + " s_addr ='" + s_addr + "' , " ;
	mySQL = mySQL + " s_pwd ='" + s_pwd + "' , " ;
	mySQL = mySQL + " s_college ='" + s_college + "' , " ;
	mySQL = mySQL + " s_phonenumber ='" + s_phonenumber + "' , " ;
	mySQL = mySQL + " s_major ='" + s_major + "' where s_id='" + s_id + "' ";
	try{
		stmt.executeQuery(mySQL);
%>
<script>
	alert("학생 정보가 수정되었습니다.");
	location.href="update.jsp";
</script>
<%
	} catch(SQLException ex){
		String sMessage;
		if(ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다";
		else if(ex.getErrorCode() == 20003) sMessage = "암호에 공란은 입력되지 않습니다.";
		else sMessage = "잠시 후 다시 시도하십시오";
	
%>
<script>
	alert("<%= sMessage %>");
	location.href = "update.jsp";
</script>
<%
	} finally{
	if(stmt !=null) try{ stmt.close(); myConn.close();}
	catch(SQLException ex){}
	}
%>
</body></html>